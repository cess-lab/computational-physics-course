%[text] # Week 3 Lecture Demonstration: Linear Systems Through Nodal Analysis
%[text] **LECTURE DEMONSTRATION.** This complete worked example is led by the lecturer. Students may inspect and rerun it, but the lecture does not require student laptops, typing, or submission.
%[text] **Physical question.** Can nodal analysis determine the voltages and currents in a resistive network while making every sign, unit, and validation check visible?
%[text] The reasoning chain is circuit model $\\rightarrow$ node equations $\\rightarrow$ matrix system $\\rightarrow$ solution $\\rightarrow$ residual and physical checks $\\rightarrow$ interpretation.
%%
%[text] ## Pause and Predict
%[text] A $12,\\mathrm{V}$ source feeds node A through a resistor. Node A connects to ground and to node B; node B also connects to ground. Predict the ordering of $V\_s$, $V\_A$, $V\_B$, and ground, and predict the direction of current in every branch.
predictionRecord = table("12 V > V_A > V_B > 0 V","source to A","A to ground and A to B","B to ground", ...
    'VariableNames',{'VoltageOrdering','SourceBranch','NodeABranches','NodeBBranch'})
%%
%[text] ## Physical Model and Assumptions
%[text] The network uses $V\_s=12,\\mathrm{V}$, $R\_1=4,\\Omega$ from the source to A, $R\_2=6,\\Omega$ from A to ground, $R\_3=5,\\Omega$ from A to B, and $R\_4=10,\\Omega$ from B to ground. Assume ideal wires, ideal voltage source, constant ohmic resistors, and steady DC conditions.
sourceVoltage_V = 12.0;
R1_ohm = 4.0;
R2_ohm = 6.0;
R3_ohm = 5.0;
R4_ohm = 10.0;
parameterRecord = table(sourceVoltage_V,R1_ohm,R2_ohm,R3_ohm,R4_ohm)
%%
%[text] ## Define Unknowns and Sign Conventions
%[text] Ground is the zero-voltage reference. The unknown vector is $\\mathbf{v}=\[V\_A;V\_B\]^T$. Define each branch current from the first named node toward the second: source-to-A, A-to-ground, A-to-B, and B-to-ground.
unknownRecord = table(["V_A";"V_B"],["V";"V"], ...
    'VariableNames',{'Unknown','Unit'})
signConvention = "A positive branch current flows from the first named node toward the second."
%%
%[text] ## Derive Kirchhoff Equations Before the Matrix
%[text] Kirchhoff's current law states that current entering a node equals current leaving it. At node A, $(V\_s-V\_A)/R\_1=V\_A/R\_2+(V\_A-V\_B)/R\_3$. At node B, $(V\_A-V\_B)/R\_3=V\_B/R\_4$.
equationRecord = [ ...
    "(V_s - V_A)/R1 = V_A/R2 + (V_A - V_B)/R3"; ...
    "(V_A - V_B)/R3 = V_B/R4" ...
    ]
%%
%[text] ## Assemble the Conductance Matrix
%[text] Rearranging the two node equations gives $\\mathbf{Gv}=\\mathbf{i}$. Every entry of $\\mathbf{G}$ has units of siemens and every entry of $\\mathbf{i}$ has units of amperes, so the solution has units of volts.
G_S = [1/R1_ohm + 1/R2_ohm + 1/R3_ohm, -1/R3_ohm; ...
       -1/R3_ohm, 1/R3_ohm + 1/R4_ohm];
i_A = [sourceVoltage_V/R1_ohm; 0];
matrixRecord = table(["G";"v";"i"],["S";"V";"A"], ...
    'VariableNames',{'Quantity','Unit'})
%%
%[text] ## Inspect Solvability Before Solving
%[text] A unique two-voltage solution requires rank two. The condition number estimates how strongly relative input perturbations may be amplified; it is a warning indicator, not a guarantee of error.
matrixRank = rank(G_S);
matrixSize = size(G_S,1);
conditionNumber = cond(G_S);
determinant_S2 = det(G_S);
assert(matrixRank == matrixSize,'The conductance matrix is not full rank.')
solvabilityRecord = table(matrixSize,matrixRank,determinant_S2,conditionNumber)
%%
%[text] ## Solve With the Backslash Operator
%[text] MATLAB's backslash operator solves the linear system directly. Avoid forming `inv(G_S)*i_A`; an explicit inverse adds work and is usually less numerically reliable.
nodeVoltage_V = G_S\i_A;
VA_V = nodeVoltage_V(1);
VB_V = nodeVoltage_V(2);
solutionRecord = table(VA_V,VB_V)
%%
%[text] ## Reconstruct Branch Currents
%[text] The node voltages become physical evidence only after they are translated back into branch currents using Ohm's law and the declared sign convention.
I_source_to_A_A = (sourceVoltage_V-VA_V)/R1_ohm;
I_A_to_ground_A = VA_V/R2_ohm;
I_A_to_B_A = (VA_V-VB_V)/R3_ohm;
I_B_to_ground_A = VB_V/R4_ohm;
branchCurrentRecord = table(I_source_to_A_A,I_A_to_ground_A,I_A_to_B_A,I_B_to_ground_A)
%%
%[text] ## Validate the Algebraic Residual
%[text] The residual $\\mathbf{r}=\\mathbf{Gv}-\\mathbf{i}$ checks whether the computed voltages satisfy the assembled matrix system. Use a scaled norm so the tolerance has a clear relation to the problem size.
residual_A = G_S*nodeVoltage_V-i_A;
scaledResidual = norm(residual_A,inf)/(norm(G_S,inf)*norm(nodeVoltage_V,inf)+norm(i_A,inf));
assert(scaledResidual < 1e-14,'The scaled algebraic residual is unexpectedly large.')
residualRecord = table(residual_A(1),residual_A(2),scaledResidual, ...
    'VariableNames',{'NodeAResidual_A','NodeBResidual_A','ScaledResidual'})
%%
%[text] ## Validate Kirchhoff Current Balance Independently
%[text] Re-evaluate KCL from the reconstructed branch currents. This catches mistakes made when translating the solution into physical quantities, even if the matrix residual is small.
nodeAImbalance_A = I_source_to_A_A-I_A_to_ground_A-I_A_to_B_A;
nodeBImbalance_A = I_A_to_B_A-I_B_to_ground_A;
assert(abs(nodeAImbalance_A) < 1e-12 && abs(nodeBImbalance_A) < 1e-12, ...
    'A node-current balance failed.')
kclRecord = table(nodeAImbalance_A,nodeBImbalance_A)
%%
%[text] ## Check Voltage Ordering and Power Balance
%[text] The predicted ordering $V\_s\>V\_A\>V\_B\>0$ tests physical plausibility. For an ideal DC network, source power supplied should equal total resistor power dissipated.
assert(sourceVoltage_V > VA_V && VA_V > VB_V && VB_V > 0, ...
    'The node voltages violate the predicted physical ordering.')
sourcePower_W = sourceVoltage_V*I_source_to_A_A;
resistorPower_W = I_source_to_A_A^2*R1_ohm + I_A_to_ground_A^2*R2_ohm + ...
    I_A_to_B_A^2*R3_ohm + I_B_to_ground_A^2*R4_ohm;
relativePowerImbalance = abs(sourcePower_W-resistorPower_W)/sourcePower_W;
assert(relativePowerImbalance < 1e-12,'Source and resistor powers do not balance.')
powerRecord = table(sourcePower_W,resistorPower_W,relativePowerImbalance)
%%
%[text] ## Visualise Voltages and Currents
%[text] A compact comparison plot communicates the solved state without pretending that a plot alone validates the circuit.
tiledlayout(1,2)
nexttile
bar(categorical({'Source','Node A','Node B','Ground'}),[sourceVoltage_V VA_V VB_V 0])
ylabel('Voltage (V)')
title('Node voltages')
grid on
nexttile
bar(categorical({'Source to A','A to ground','A to B','B to ground'}), ...
    [I_source_to_A_A I_A_to_ground_A I_A_to_B_A I_B_to_ground_A])
ylabel('Current (A)')
title('Branch currents')
grid on
%%
%[text] ## Conditioning Is a Property of the Formulated Problem
%[text] Increase $R\_4$ from $10,\\Omega$ to $1,\\mathrm{M}\\Omega$. Node B becomes weakly connected to ground, and the conductance matrix becomes more sensitive. Compare the condition number rather than judging from one printed solution.
R4_weak_ohm = 1e6;
G_weak_S = [1/R1_ohm + 1/R2_ohm + 1/R3_ohm, -1/R3_ohm; ...
            -1/R3_ohm, 1/R3_ohm + 1/R4_weak_ohm];
weakConditionNumber = cond(G_weak_S);
conditioningRecord = table(conditionNumber,weakConditionNumber,weakConditionNumber/conditionNumber, ...
    'VariableNames',{'BaselineConditionNumber','WeakGroundConditionNumber','ConditionNumberRatio'})
%[text] A small residual can coexist with sensitivity to uncertain resistor values. Residual and conditioning answer different questions.
%%
%[text] ## Method Choice and Model Limits
%[text] Direct linear solving is appropriate because the circuit equations are linear in the unknown node voltages. The model does not include component tolerances, temperature dependence, source internal resistance, transient behaviour, or nonlinear devices.
methodDecision = table("linear nodal equations","direct solve with backslash","KCL, residual, voltage ordering, power balance", ...
    'VariableNames',{'ModelStructure','SelectedMethod','ValidationEvidence'})
%%
%[text] ## Capstone Problem Spaces
%[text] A capstone begins with a bounded physical question, not a favourite MATLAB function. Candidate spaces include circuit or sensor networks, coupled oscillations, equilibrium and threshold problems, motion or decay models, experimental data fitting, and random transport. For each candidate, record the model, unknowns, method, observable output, and independent validation evidence.
capstonePrompt = table( ...
    ["circuit or sensor network";"coupled physical modes";"equilibrium or threshold";"motion or decay";"experimental fitting";"random transport"], ...
    ["voltages or currents";"mode frequencies";"physical root";"trajectory or population";"parameters and residuals";"distribution or scaling"], ...
    'VariableNames',{'ProblemSpace','PossibleEvidence'})
%%
%[text] ## Demonstration Takeaways
%[text] Derive physical equations before assembling the matrix; preserve units and sign conventions; inspect rank and conditioning; solve with backslash; and return to the circuit for residual, Kirchhoff, plausibility, and power checks.
%[text] The practical transfers this reasoning to a two-loop mesh-current system and asks the group to defend the result under controlled changes.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
