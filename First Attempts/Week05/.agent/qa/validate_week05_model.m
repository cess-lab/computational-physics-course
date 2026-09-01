eBaseline = 0.70;
MBaseline_rad = 1.00;
fBaseline = @(E_rad) E_rad-eBaseline*sin(E_rad)-MBaseline_rad;
dfBaseline = @(E_rad) 1-eBaseline*cos(E_rad);
leftBaseline_rad = MBaseline_rad-eBaseline;
rightBaseline_rad = MBaseline_rad+eBaseline;
assert(fBaseline(leftBaseline_rad) <= 0 && fBaseline(rightBaseline_rad) >= 0,'Baseline analytic bracket failed.')
assert(1-eBaseline > 0,'Baseline Kepler residual should be strictly increasing.')
toleranceX = 1e-10;
residualTolerance = 1e-12;
maximumIterations = 80;
derivativeFloor = 1e-12;
[rootBisection_rad,bisectionIterations,bisectionHalfWidth_rad] = qaBisection(fBaseline,leftBaseline_rad,rightBaseline_rad,toleranceX,maximumIterations);
[rootNewton_rad,newtonIterations,newtonStatus] = qaNewton(fBaseline,dfBaseline,MBaseline_rad,toleranceX,residualTolerance,maximumIterations,derivativeFloor);
fzeroOptions = optimset('TolX',toleranceX);
[rootFzero_rad,fzeroValue,fzeroExitFlag,fzeroOutput] = fzero(fBaseline,[leftBaseline_rad rightBaseline_rad],fzeroOptions);
assert(fzeroExitFlag > 0,'fzero failed on the valid baseline bracket.')
assert(abs(fzeroValue) < 1e-10,'fzero baseline residual is unexpectedly large.')
assert(newtonStatus == "converged",'Baseline Newton did not converge.')
assert(abs(fBaseline(rootBisection_rad)) < 1e-9,'Baseline bisection residual is unexpectedly large.')
assert(abs(fBaseline(rootNewton_rad)) <= residualTolerance,'Baseline Newton residual is unexpectedly large.')
assert(abs(rootBisection_rad-rootFzero_rad) <= bisectionHalfWidth_rad+toleranceX,'Bisection and fzero disagree beyond the bisection uncertainty.')
assert(abs(rootNewton_rad-rootFzero_rad) < 1e-9,'Newton and fzero disagree for the baseline case.')
referenceRoot_rad = 1.694638912091841;
assert(abs(rootFzero_rad-referenceRoot_rad) < 1e-10,'Baseline root changed unexpectedly relative to the stored numerical reference.')
absoluteBisectionUpperBound = ceil(log2((rightBaseline_rad-leftBaseline_rad)/(2*toleranceX)))+1;
assert(bisectionIterations <= absoluteBisectionUpperBound,'Bisection exceeded a conservative theoretical iteration bound.')
assert(newtonIterations < bisectionIterations,'Baseline Newton should use fewer iterations than bisection.')
invalidLeft_rad = 0.0;
invalidRight_rad = 0.1;
assert(fBaseline(invalidLeft_rad)*fBaseline(invalidRight_rad) > 0,'Deliberately invalid bracket unexpectedly changed sign.')
eStress = 0.999;
MStress_rad = 0.15;
fStress = @(E_rad) E_rad-eStress*sin(E_rad)-MStress_rad;
dfStress = @(E_rad) 1-eStress*cos(E_rad);
stressInitial_rad = 0.0;
stressDerivativeAtInitial = dfStress(stressInitial_rad);
stressFirstStep_rad = -fStress(stressInitial_rad)/stressDerivativeAtInitial;
assert(abs(stressDerivativeAtInitial-0.001) < 1e-14,'Stress derivative should be 0.001 at E0=0.')
assert(abs(stressFirstStep_rad-150) < 1e-10,'Stress first Newton step should be 150 rad.')
stressLeft_rad = MStress_rad-eStress;
stressRight_rad = MStress_rad+eStress;
assert(fStress(stressLeft_rad) <= 0 && fStress(stressRight_rad) >= 0,'Stress analytic bracket failed.')
[stressBisectionRoot_rad,stressBisectionIterations,stressBisectionHalfWidth_rad] = qaBisection(fStress,stressLeft_rad,stressRight_rad,toleranceX,maximumIterations);
[stressGuardedRoot_rad,stressGuardedIterations,stressGuardedStatus,stressFallbacks] = qaGuardedNewton(fStress,dfStress,stressInitial_rad,stressLeft_rad,stressRight_rad,toleranceX,residualTolerance,maximumIterations,derivativeFloor);
[stressFzeroRoot_rad,stressFzeroValue,stressFzeroExitFlag] = fzero(fStress,[stressLeft_rad stressRight_rad],fzeroOptions);
assert(stressFzeroExitFlag > 0 && abs(stressFzeroValue) < 1e-10,'Stress fzero reference failed.')
assert(stressGuardedStatus == "converged",'Safeguarded Newton failed in the stress case.')
assert(stressFallbacks >= 1,'The stress case should trigger at least one safeguarded fallback.')
assert(abs(fStress(stressBisectionRoot_rad)) < 1e-8,'Stress bisection residual is unexpectedly large.')
assert(abs(fStress(stressGuardedRoot_rad)) <= residualTolerance,'Stress safeguarded Newton residual is unexpectedly large.')
assert(abs(stressBisectionRoot_rad-stressFzeroRoot_rad) <= stressBisectionHalfWidth_rad+toleranceX,'Stress bisection and fzero disagree.')
assert(abs(stressGuardedRoot_rad-stressFzeroRoot_rad) < 1e-9,'Stress safeguarded Newton and fzero disagree.')
assert(stressGuardedIterations < stressBisectionIterations,'Safeguarded Newton should improve on pure bisection in the selected stress case.')
validationSummary = table(rootBisection_rad,rootNewton_rad,rootFzero_rad,bisectionIterations,newtonIterations,fzeroOutput.iterations,stressBisectionRoot_rad,stressGuardedRoot_rad,stressFzeroRoot_rad,stressFallbacks)
disp('WEEK05_MODEL_VALIDATION_OK')
function [root,iterations,halfWidth] = qaBisection(fun,left,right,tolX,maxIter)
fLeft = fun(left);
fRight = fun(right);
assert(isfinite(fLeft) && isfinite(fRight) && fLeft*fRight <= 0,'qaBisection requires a valid finite bracket.')
for k = 1:maxIter
    midpoint = left+0.5*(right-left);
    fMid = fun(midpoint);
    halfWidth = 0.5*(right-left);
    if fMid == 0 || halfWidth <= tolX*(1+abs(midpoint))
        break
    end
    if fLeft*fMid <= 0
        right = midpoint;
        fRight = fMid;
    else
        left = midpoint;
        fLeft = fMid;
    end
end
root = midpoint;
iterations = k;
end
function [root,iterations,status] = qaNewton(fun,derivative,x0,tolX,tolF,maxIter,derivativeFloor)
x = x0;
status = "maximum iterations";
iterations = 0;
for k = 1:maxIter
    fx = fun(x);
    dfx = derivative(x);
    if ~isfinite(fx) || ~isfinite(dfx) || abs(dfx) <= derivativeFloor
        status = "small or invalid derivative";
        break
    end
    step = -fx/dfx;
    xNew = x+step;
    fNew = fun(xNew);
    x = xNew;
    iterations = k;
    if abs(step) <= tolX*(1+abs(xNew)) && abs(fNew) <= tolF
        status = "converged";
        break
    end
end
root = x;
end
function [root,iterations,status,fallbackCount] = qaGuardedNewton(fun,derivative,x0,left,right,tolX,tolF,maxIter,derivativeFloor)
fLeft = fun(left);
fRight = fun(right);
assert(fLeft*fRight <= 0,'qaGuardedNewton requires a valid bracket.')
x = min(max(x0,left),right);
status = "maximum iterations";
iterations = 0;
fallbackCount = 0;
for k = 1:maxIter
    fx = fun(x);
    dfx = derivative(x);
    useFallback = ~isfinite(dfx) || abs(dfx) <= derivativeFloor;
    if ~useFallback
        candidate = x-fx/dfx;
        useFallback = ~isfinite(candidate) || candidate <= left || candidate >= right;
    end
    if useFallback
        candidate = left+0.5*(right-left);
        fallbackCount = fallbackCount+1;
    end
    fCandidate = fun(candidate);
    if fLeft*fCandidate <= 0
        right = candidate;
        fRight = fCandidate;
    else
        left = candidate;
        fLeft = fCandidate;
    end
    step = candidate-x;
    x = candidate;
    iterations = k;
    if abs(step) <= tolX*(1+abs(x)) && abs(fCandidate) <= tolF
        status = "converged";
        break
    end
end
root = x;
end
