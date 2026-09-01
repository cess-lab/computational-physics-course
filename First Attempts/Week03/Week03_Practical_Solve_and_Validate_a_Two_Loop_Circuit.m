%[text] # Week 3 Practical Activity: Solve and Validate a Two-Loop Circuit
%[text] **PRACTICAL ACTIVITY.** This group investigation assesses equation derivation, matrix assembly, unit and sign reasoning, linear solving, residuals, physical validation, and interpretation. Producing a long program is not the goal.
%[text] **Physical question.** Two DC loops share one resistor. Can mesh-current equations determine every branch current while making the evidence for a unique and physically credible solution explicit?
%[text] **Working arrangement.** Complete the Week 03 Individual Practical Check — Quiz in Google Classroom before discussing the problem or using MATLAB, notes, calculators, or AI. Then work in a group of two or three. MATLAB Copilot may be used during group work, but every material suggestion must be declared and independently tested.
%%
%[text] ## Complete the Individual Check First
%[text] Each student submits the Week 03 Individual Practical Check — Quiz from Google Classroom before group work begins. The lecturer will confirm when the quiz is available. Do not duplicate those answers here.
%%
%[text] ## Group Record and Role Rotation
%[text] Record all members and assign model, matrix/implementation, and validation leads. Rotate roles from earlier practicals.
groupMembers = "TODO: names and matric numbers"
roleRecord = "TODO: identify the model, matrix/implementation, and validation leads"
%%
%[text] ## Predict Before Computing
%[text] The left loop contains a $12\,\mathrm{V}$ source and $4\,\Omega$ resistor; the right loop contains a $5\,\mathrm{V}$ source and $6\,\Omega$ resistor; the loops share a $3\,\Omega$ resistor. Both mesh currents are defined clockwise. Predict which mesh current is larger and the direction of current through the shared resistor.
predictionRecord = "TODO: predicted current ordering, shared-branch direction, and physical reason"
%%
%[text] ## Draw the Model and Declare Signs
%[text] Draw the two loops, label $V_1$, $V_2$, $R_1$, $R_2$, $R_3$, $I_1$, and $I_2$, and mark the shared-branch current as $I_1-I_2$ in the left-loop direction. State the ideal DC assumptions.
modelRecord = "TODO: circuit sketch reference, current directions, voltage-rise signs, and assumptions"
%%
%[text] ## Derive Kirchhoff Equations Before the Matrix
%[text] Apply Kirchhoff's voltage law around each loop. With the declared clockwise mesh currents, the equations are $(R_1+R_3)I_1-R_3I_2=V_1$ and $-R_3I_1+(R_2+R_3)I_2=V_2$.
derivationRecord = "TODO: show the signed voltage changes around both loops and recover both equations"
unitExplanation = "TODO: explain why resistance times current has units of voltage"
%%
%[text] ## Baseline Parameters and Matrix Assembly
%[text] Assemble $\mathbf{RI}=\mathbf{V}$ only after the equations and signs are established. Matrix entries have units of ohms, the right-hand side has units of volts, and the unknown vector has units of amperes.
V1_V = 12.0;
V2_V = 5.0;
R1_ohm = 4.0;
R2_ohm = 6.0;
R3_ohm = 3.0;
R_ohm = [R1_ohm+R3_ohm, -R3_ohm; ...
         -R3_ohm, R2_ohm+R3_ohm];
V_V = [V1_V; V2_V];
parameterRecord = table(V1_V,V2_V,R1_ohm,R2_ohm,R3_ohm)
matrixUnitRecord = table(["R";"I";"V"],["ohm";"A";"V"], ...
    'VariableNames',{'Quantity','Unit'})
%%
%[text] ## Check Solvability and Conditioning
%[text] Record the matrix size, rank, determinant, and condition number before solving. Explain what full rank establishes and what the condition number warns about.
matrixSize = size(R_ohm,1);
matrixRank = rank(R_ohm);
determinant_ohm2 = det(R_ohm);
conditionNumber = cond(R_ohm);
assert(matrixRank == matrixSize,'The mesh-current matrix is not full rank.')
solvabilityRecord = table(matrixSize,matrixRank,determinant_ohm2,conditionNumber)
solvabilityExplanation = "TODO: interpret rank, determinant, and condition number"
%%
%[text] ## Solve the Mesh-Current System
%[text] Use MATLAB's backslash operator. Extract the two mesh currents and reconstruct the shared-branch current using the sign convention.
I_A = R_ohm\V_V;
I1_A = I_A(1);
I2_A = I_A(2);
I_shared_A = I1_A-I2_A;
solutionRecord = table(I1_A,I2_A,I_shared_A)
solutionInterpretation = "TODO: compare the signs and ordering with the prediction"
%%
%[text] ## Validate the Algebraic Residual
%[text] Compute $\mathbf{r}=\mathbf{RI}-\mathbf{V}$ and a scaled infinity-norm residual. Explain why a small residual checks the assembled equations but does not prove that the equations represent the intended circuit.
residual_V = R_ohm*I_A-V_V;
scaledResidual = norm(residual_V,inf)/(norm(R_ohm,inf)*norm(I_A,inf)+norm(V_V,inf));
assert(scaledResidual < 1e-14,'The scaled residual is unexpectedly large.')
residualRecord = table(residual_V(1),residual_V(2),scaledResidual, ...
    'VariableNames',{'Loop1Residual_V','Loop2Residual_V','ScaledResidual'})
residualExplanation = "TODO: state what this evidence can and cannot establish"
%%
%[text] ## Validate Kirchhoff Voltage Balance
%[text] Reconstruct each loop independently from physical voltage rises and drops. These balances should be zero within floating-point tolerance.
loop1Imbalance_V = V1_V-R1_ohm*I1_A-R3_ohm*(I1_A-I2_A);
loop2Imbalance_V = V2_V-R2_ohm*I2_A-R3_ohm*(I2_A-I1_A);
assert(abs(loop1Imbalance_V) < 1e-12 && abs(loop2Imbalance_V) < 1e-12, ...
    'An independently reconstructed loop balance failed.')
kvlRecord = table(loop1Imbalance_V,loop2Imbalance_V)
%%
%[text] ## Validate Power Conservation
%[text] For ideal sources and resistors, total source power supplied equals total resistor power dissipated. Use the mesh-current directions consistently when calculating both sides.
sourcePower_W = V1_V*I1_A + V2_V*I2_A;
resistorPower_W = R1_ohm*I1_A^2 + R2_ohm*I2_A^2 + R3_ohm*I_shared_A^2;
relativePowerImbalance = abs(sourcePower_W-resistorPower_W)/sourcePower_W;
assert(relativePowerImbalance < 1e-12,'Source and resistor powers do not balance.')
powerRecord = table(sourcePower_W,resistorPower_W,relativePowerImbalance)
powerExplanation = "TODO: interpret the power evidence and its dependence on the ideal model"
%%
%[text] ## Diagnose a Plausible AI-Generated Matrix
%[text] The candidate is displayed as text and is not executed. Identify every sign or coefficient defect, explain its physical consequence, and design a discriminating check.
candidateMatrix = [ ...
    "R_bad = [R1_ohm, R3_ohm; R3_ohm, R2_ohm];"; ...
    "I_bad = inv(R_bad)*[V1_V; V2_V];"; ...
    "sharedCurrent_bad_A = I_bad(1)+I_bad(2);" ...
    ]
diagnosisRecord = "TODO: defect, consequence, correction, and independent test"
%%
%[text] ## Controlled Investigation
%[text] Predict before every change and modify one factor at a time:
%[text] 1. Reverse the polarity of the $5\,\mathrm{V}$ source by setting $V_2=-5\,\mathrm{V}$; interpret all current signs.
%[text] 2. Compare $R_3=0.3\,\Omega$, $3\,\Omega$, and $30\,\Omega$; explain how coupling changes the mesh and shared currents.
%[text] 3. Perturb each resistor by $+1\%$ separately and identify which output is most sensitive.
%[text] 4. Replace one off-diagonal $-R_3$ with $+R_3$ deliberately; identify which checks fail and which might still appear plausible. \
investigationRecord = "TODO: predictions, controlled changes, numerical evidence, and physical interpretation"
%%
%[text] ## Capstone Candidate Record
%[text] Record two bounded physical questions that your group might investigate later. For each, identify the model, unknowns, likely computational method, observable output, and at least two independent validation checks. A final selection is not required this week.
capstoneCandidateRecord = "TODO: two candidate questions with method and validation evidence"
%%
%[text] ## Submission Evidence and AI Decision Record
%[text] Submit one compact group evidence packet containing the circuit model, sign convention, derived equations, unit map, matrix, solvability evidence, solution, residual, KVL and power checks, controlled investigation, physical interpretation, one limitation, and capstone candidate record.
%[text] If AI was used, record what was requested, what was accepted, modified, or rejected, why the decision was made, and which independent checks were performed.
aiDecisionRecord = "TODO: state AI-free or provide the material-use decision record"

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
