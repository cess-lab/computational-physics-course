%[text] # Week 3 Lecture Demonstration: Two-by-Two Linear Systems through Kirchhoff Circuits
%[text] **LECTURE DEMONSTRATION**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Physical Question and Learning Outcomes
%[text] Two resistor loops share one resistor. If the two source voltages are known, how can we turn Kirchhoff's voltage law into two equations that MATLAB can solve without losing the physical meaning of the signs and units?
%[text] **Learning outcomes.** By the end of this demonstration, you can derive and map two Kirchhoff equations into `A*x=b`, solve the two unknown currents with MATLAB backslash, and validate the currents by direct substitution into the original equations.
%%
%[text] ## Circuit Model, Unknowns, and Sign Convention
%[text] The circuit has a 2 ohm resistor only in the left loop, a 3 ohm resistor only in the right loop, and a 1 ohm resistor shared by both loops. The left and right sources are 5 V and 2 V. Choose both mesh currents, $I_1$ and $I_2$, clockwise. Across the shared resistor, the two mesh currents oppose each other, so the shared-branch current in the mesh-1 direction is $I_1-I_2$.
%[text] **Prediction before computing.** Both sources drive their chosen clockwise mesh currents. Predict that both solved mesh currents are positive. Because the left source is larger and its private resistance is smaller, expect the left mesh current to be larger than the right mesh current.
R1_ohm = 2;        % left private resistance (ohm)
R2_ohm = 3;        % right private resistance (ohm)
Rs_ohm = 1;        % shared resistance (ohm)
V1_V = 5;          % left source voltage (V)
V2_V = 2;          % right source voltage (V)
%%
%[text] ## Write Kirchhoff Equations Before Writing a Matrix
%[text] Walk clockwise around the left loop. In words: the voltage drops across the left resistor and shared resistor must equal the left source. Because the shared current in the mesh-1 direction is $I_1-I_2$, the equation is $(R_1+R_s)I_1-R_sI_2=V_1$.
%[text] Walk clockwise around the right loop. The shared-resistor contribution has the opposite mesh-current difference, giving $-R_sI_1+(R_2+R_s)I_2=V_2$. Every term has units of volts because resistance in ohms multiplied by current in amperes gives volts.
%%
%[text] ## Map the Equations to A*x=b
%[text] Put the coefficients of `I1_A` and `I2_A` into one matrix row per Kirchhoff equation. The unknown-current column is `x_A=[I1_A; I2_A]`, and the source-voltage column is `b_V=[V1_V; V2_V]`. The matrix `A_ohm` therefore has units of ohms, so `A_ohm*x_A` has units of volts.
A_ohm = [R1_ohm + Rs_ohm, -Rs_ohm; ...
         -Rs_ohm, R2_ohm + Rs_ohm];
b_V = [V1_V; V2_V];
A_ohm
b_V
%%
%[text] ## Solve with MATLAB Backslash
%[text] MATLAB's backslash operator solves the linear system represented by `A_ohm*x_A=b_V`. For this week, use the supplied syntax rather than implementing a matrix solver. Read the two entries of `x_A` in the same order used when the unknown vector was defined.
x_A = A_ohm\b_V;
I1_A = x_A(1)
I2_A = x_A(2)
%%
%[text] ## Reconstruct the Shared-Branch Current
%[text] Mesh currents are a convenient way to write the equations, but the shared physical branch carries their difference. Positive `Ishared_A` means the net current through the shared resistor follows the direction assigned to mesh 1; a negative value would mean the actual current is opposite to that assumed direction.
Ishared_A = I1_A - I2_A
%%
%[text] ## Core Validation: Substitute into the Original Equations
%[text] Do not accept the currents merely because MATLAB returned numbers. Rebuild the left and right Kirchhoff voltage sums from the solved currents. Each reconstructed value should reproduce its source voltage. This check directly tests the equations we claimed to solve.
left_reconstructed_V = (R1_ohm + Rs_ohm)*I1_A - Rs_ohm*I2_A
right_reconstructed_V = -Rs_ohm*I1_A + (R2_ohm + Rs_ohm)*I2_A
validation_difference_V = [left_reconstructed_V - V1_V; ...
                           right_reconstructed_V - V2_V]
assert(max(abs(validation_difference_V)) < 1e-12, ...
    'Direct-substitution validation failed.')
%%
%[text] ## Interpret the Result Physically
%[text] Both mesh currents are positive, so both flow in the directions chosen before solving. The left mesh current is larger than the right mesh current, matching the qualitative prediction. The positive shared-branch current means the net shared-resistor current follows the mesh-1 direction. A negative solution would not automatically be an error; it would mean the actual current is opposite to the assumed arrow.
current_summary = table(I1_A,I2_A,Ishared_A, ...
    'VariableNames',{'LeftMesh_A','RightMesh_A','SharedBranch_A'})
%%
%[text] ## Diagnose a Plausible Matrix with the Wrong Circuit Sign
%[text] A matrix can look reasonable and still encode the wrong circuit. If the top-right shared-resistor coefficient is entered as `+Rs_ohm` instead of `-Rs_ohm`, MATLAB can still return finite currents. The defect is physical: the shared-branch voltage was translated with the wrong sign. Compare every matrix coefficient with the original Kirchhoff equations before trusting the solve.
A_wrong_sign_ohm = [R1_ohm + Rs_ohm, Rs_ohm; ...
                    -Rs_ohm, R2_ohm + Rs_ohm];
x_wrong_sign_A = A_wrong_sign_ohm\b_V
wrong_model_difference_V = A_ohm*x_wrong_sign_A - b_V
%[text] The nonzero difference above is evaluated with the **correct physical equations**. It shows why successful execution is not the same as a correct circuit model.
%%
%[text] ## Working Exposure: Equivalent Equation Ordering
%[text] The same two physical equations may be written in a different row order. If both `A` and `b` are reordered together, the solved current vector is unchanged. Reordering only one of them would change the problem.
A_reordered_ohm = A_ohm([2 1],:);
b_reordered_V = b_V([2 1]);
x_reordered_A = A_reordered_ohm\b_reordered_V;
maximum_reordering_difference_A = max(abs(x_reordered_A-x_A))
assert(maximum_reordering_difference_A < 1e-12, ...
    'Equivalent equation ordering should preserve the solution.')
%%
%[text] ## Working Exposure: A Small Source Change
%[text] Change only the right source from 2.0 V to 2.1 V. The purpose is not yet to quantify conditioning; simply notice that changing the physical input changes both coupled mesh currents. Sensitivity measures belong to Optional stretch.
b_perturbed_V = [V1_V; 2.1];
x_perturbed_A = A_ohm\b_perturbed_V
change_in_currents_A = x_perturbed_A - x_A
%%
%[text] ## Optional Stretch: Residual, Rank, Conditioning, and Power
%[text] The following checks are **not required for the Core Week 3 route**. The algebraic residual is another way to represent substitution error. `rank` can reveal dependent equations, while `cond` gives a numerical sensitivity indicator. Power balance supplies a second physical check for this particular passive-resistor circuit.
residual_V = A_ohm*x_A - b_V
matrix_rank = rank(A_ohm)
condition_number = cond(A_ohm)
source_power_W = V1_V*I1_A + V2_V*I2_A;
resistor_power_W = R1_ohm*I1_A^2 + R2_ohm*I2_A^2 + Rs_ohm*Ishared_A^2;
power_difference_W = source_power_W - resistor_power_W
%%
%[text] ## Three Takeaways
%[text] First, choose the unknowns and sign convention before building a matrix. Second, each matrix row must be traceable back to one physical Kirchhoff equation and must preserve units. Third, a solver result becomes credible only after it is checked against the original equations and interpreted using the assumed current directions.
%%
%[text] ## Reproducibility Record
%[text] Run sections from top to bottom in a fresh MATLAB session. This demonstration requires MATLAB R2025a or later and base MATLAB only. Locked values: `R1_ohm=2`, `R2_ohm=3`, `Rs_ohm=1`, `V1_V=5`, and `V2_V=2`. No hidden Workspace state is required.

%[appendix]{"version":"1.0"}
