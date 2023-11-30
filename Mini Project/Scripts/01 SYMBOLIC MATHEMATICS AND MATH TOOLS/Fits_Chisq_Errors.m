%
% Program to look at simple fits to experimental data, with chisquared and errors
%
function Fits_Chisq_Errors
%
clear; 
help Fits_Chisq_Errors;  % Clear memory and print header
% 
global X Y Wt Yfit Itype
%
fprintf(' Data Fit Using Chisquared Minimization, MATLAB tool fminsearch \n');
%
% data on temp along rod between 2 heat baths at fixed temperatures
%
x = [1:9];
T = [ 15.6 17.5 36.6 43.8 58.2 61.6 64.2 70.4 98.8];
for i = 1:9
    sig(i) = 6.7 ;
end
%
% data on thermocouple voltage as a function of temperature
%
for i = 1:11
    TT(i) = 5.0 .*(i - 1);
    sigV(i) = 0.02;
end
V = [-0.89 -0.69 -0.53 -0.34 -0.15 0.02 0.20 0.42 0.61 0.82 1.03];
%
% Monte Carlo data on gaussian, mean = 0, sigma = 1
%
NG = [2 6 15 26 42 65 90 126 127 121 110 93 78 47 30 10 8 2]
XG = linspace(-2.86,2.78,18);
%
figure(1)
errorbar(x,T,sig,'o')
title('Temperature Along a Bar Between 2 Heat Baths')
xlabel('x(cm)')
ylabel('T(^oC)')
%
figure(2)
errorbar(TT,V,sigV,'o')
title('Thermocouple Output Voltage aa a Function of Temperature')
xlabel('T(^oC)')
ylabel('V(mV)')
%
figure(3)
errorbar(XG,NG,sqrt(NG),'o')
title('Monte Carlo Data  - Gaussian Function')
xlabel('x')
ylabel('n')
%
% global variable are UC for fits
%
   Y = T;
   X = x;
   Wt = 1.0 ./(sig .^2);
%
% type of fit in FIT_FUN, need to specify Itype of function and starting values of parameters ao 
%
Itype = 1;         % polynomial fit
ao(1) = mean(T);   % starting values
ao(2) =0 ;
ao(3) = 0 ;
ao(4) = 0;
%
  afit = fminsearch(@FIT_FUN,ao);   % find best fit parameters a
  chs = FIT_FUN(afit);
  dof = length(Y) - length(afit);
%
% then find err martix on fit values - need explicit deriv vector of chi
% wrt a - found in FIT_ERR
%
  [erra,diag] = FIT_ERR(ao,afit);
  fprintf(' Cubic Fit to Temperature Data - chisq, dof, coefficients and diagonal errors\n');
  chs
  dof
  afit
  diag
%
figure(1)
errorbar(x,T,sig,'bo')
hold on
plot(X,Yfit,'r-')
title('Cubic Fit to Temperature Data')
hold off
%
% global variable are UC for fits
%
   Y = V;
   X = TT;
   Wt = 1.0 ./(sigV .^2);
%
% type of fit in FIT_FUN, need to specify Itype of function and starting values of parameters ao 
%
Itype = 1;         % polynomial fit
ao(1) = mean(V);   % starting values
ao(2) =0 ;
ao(3) = 0 ;
ao(4) = 0;
%
  afit = fminsearch(@FIT_FUN,ao);   % find best fit parameters a
  chs = FIT_FUN(afit);
  dof = length(Y) - length(afit);
%
% then find err martix on fit values - need explicit deriv vector of chi
% wrt a - found in FIT_ERR
%
  [erra,diag] = FIT_ERR(ao,afit);
  fprintf(' Cubic Fit to Thermocouple Voltage Data - chisq, dof, coefficiencts and diagonal errors\n');
  chs
  dof
  afit
  diag
figure(2)
errorbar(TT,V,sigV,'bo')
hold on
plot(X,Yfit,'r-')
title('Cubic Fit to Thermocouple Voltage Data')
hold off
%
% global variable are UC for fits
%
   Y = NG;
   X = XG;
   Wt = 1.0 ./(NG);
%
% type of fit in FIT_FUN, need to specify Itype of function and starting values of parameters ao 
%
Itype = 2;         % gaussian fit
clear 'ao'
ao(1) = 1000;   % starting values, norm
ao(2) = 0 ;      % mean
ao(3) = 1 ;     % std
%
  afit = fminsearch(@FIT_FUN,ao);   % find best fit parameters a
  chs = FIT_FUN(afit);
  dof = length(Y) - length(afit);
%
% then find err martix on fit values - need explicit deriv vector of chi
% wrt a - found in FIT_ERR
%
  [erra,diag] = FIT_ERR(ao,afit);
  fprintf(' Gaussian Fit to Monte Carlo "Data" - chisq, dof, coefficiencts and diagonal errors\n');
  chs
  dof
  afit
  diag
figure(3)
errorbar(XG,NG,sqrt(NG),'bo')
hold on
plot(X,Yfit,'r-')
title('Gaussian Fit to Monte Carlo Data, 1000 Events Simulated')
xlabel('x')
ylabel('N')
hold off
%
% general fit function for least sq fit to measures Y with weight Wt at 
% points X fit parameters a, Yfit a specified function.
%
  function[chi] = FIT_FUN(a)
%
% type of user defined function in Itype
% Itype = 1 = polynominal order 4
% Itype = 2 = pure gaussian
% Itype = 3 = pure Poisson
% Ityp2 = 4, = pure exponential
%
global X Y Wt Yfit Itype
%
  if Itype == 1 ;   % polynominial  - cubic
     Yfit = a(1) + X .*a(2) + X .*X .*a(3) + X .*X .*X .*a(4);
  end
  if Itype == 2;   % a1 = norm, a2 = mean,  a3 = sig
     g = exp(-0.5 .*(((X -a(2))./a(3)) .^2));
     g = g .*(X(2) -X(1));
     Yfit = (a(1) ./ (sqrt(2.0 .*pi) .*a(3))) .*g;
  end;
  if Itype == 3
  %
  % pure Poisson - bins must start at 0. a(1) = mean, a(2) = norm
  %
      for i=1:length(X);
        Yfit(i) = ((a(1) .^(i-1)) .*exp(-a(1))) ./gamma(i); 
      end;
     Yfit = Yfit .*a(2);
  end;
  if Itype == 4  ;  % a(1) = norm at 0, a(2) = exp slope 
    Yfit = a(1) .*exp(-X ./a(2));
  end
   %
 ch = ((Y-Yfit) .^2) .*Wt;
 chi = sum(ch);
%
% calculates the error matrix on fit variables a in least sq fit
% companion to FIT_FUN, get gradient numerically 
%
 function[erra,diag] = FIT_ERR(ao,a)
%
% X Y Wt Yfit Itype are assumed global variables, used in fmins, dgfun
%
 global X Y Wt Yfit Itype
%
% a are best fit params - ao are starting values
%
 npt = length(X); 
 na = length(a);
%
% get deriv of the npt Yfit wrt the na parameters, step 1% of distance to ao
%
  dyda = zeros(na,npt);
  da = abs((a-ao) ./100.0);
  ymin  = Yfit;
%
  for i=1:na
      b = a;
      b(i) = a(i) + da(i);
      for j = 1:npt
         dummy = FIT_FUN(b);
         dyda(i,j) = (Yfit(j) - ymin(j)) ./da(i);  
      end  
  end
%
% now propagate errors from meas points Y to param a
% assume that the starting errors on Y are uncorrelated  - covariance matrix
%
 covyi = zeros(npt,npt);
  for i = 1:npt
   covyi(i,i) = covyi(i,i) + Wt(i);
  end;
 covai = dyda * covyi * (dyda');
 ii = eye(na); 
 erra = ii / covai;
%
% estimator using diagonal elements
%
 for i=1:na
  diag(i) = sqrt(abs(erra(i,i)));
 end
%