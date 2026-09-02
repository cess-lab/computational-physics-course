%[text] # Week 3 Practical Activity: Kirchhoff Linear-Systems Challenge Set
%[text] **PRACTICAL ACTIVITY**
%[text] PHY4605 AI-Enabled Group Investigation
%%
%[text] ## Group Identification and Baseline
%[text] Work in your assigned group of two or three. Generative AI may be used to write, debug, or improve MATLAB code. For every challenge, record your prediction, model and units, plan, runnable evidence, validation, interpretation, and concise AI decision record in your completed copy. Do not submit a complete chat transcript.
%[text] This baseline runs from a fresh MATLAB session. Add your group work in a new code section immediately after each challenge. Do not use hidden Workspace variables.
group_id = "REPLACE_WITH_GROUP_ID";
group_members = "REPLACE_WITH_NAMES";
matlab_release = version('-release');
%%
%[text] ## Question 1: Choose Unknowns and Predict Current Directions
%[text] A two-loop sensor-bias circuit has clockwise mesh currents `Ia_A` and `Ib_A`. The left private resistor is 4 ohm, the right private resistor is 6 ohm, the shared resistor is 2 ohm, and the clockwise source rises are 12 V and 6 V. Before solving, state the current directions, the current units, and which mesh current you expect to be larger.
sensor_Ra_ohm = 4;
sensor_Rb_ohm = 6;
sensor_Rs_ohm = 2;
sensor_Va_V = 12;
sensor_Vb_V = 6;
%[text] **Required evidence:** labelled unknowns, sign convention, unit statement, and qualitative prediction. **Defence hook:** explain what a negative solved mesh current would mean.
%%
%[text] ## Question 2: Derive the Two Sensor-Circuit Equations
%[text] Apply Kirchhoff's voltage law once around each sensor loop. Write both equations first in symbols, then substitute the supplied numerical values. Keep the shared-resistor current difference consistent with the clockwise mesh directions.
%[text] **Required evidence:** two KVL equations and a one-sentence sign explanation for the shared-resistor term. **Defence hook:** point to the term that couples the two equations and explain why it appears in both.
%%
%[text] ## Question 3: Map, Solve, Reconstruct, and Validate
%[text] Translate your two sensor-circuit equations into `A_sensor_ohm*x_sensor_A=b_sensor_V`. Solve with MATLAB backslash, reconstruct the shared-branch current, then substitute the solved currents into both original KVL equations.
%[text] **Required evidence:** matrix, source vector, solved current vector with units, shared current, and two direct-substitution differences in volts. **Defence hook:** map one complete matrix row back to its physical KVL equation.
%%
%[text] ## Question 4: Diagnose a Shared-Resistance Sign Defect
%[text] Make a copy of your sensor matrix and deliberately flip the sign of exactly one off-diagonal shared-resistance coefficient. Solve the defective system. Then evaluate those currents using your **correct original KVL equations** and explain why finite MATLAB output does not prove that the matrix represents the circuit.
%[text] **Required evidence:** defective coefficient identified, defective solved output, validation failure using the correct equations, and repaired result. **Defence hook:** explain why the defect is a modelling/sign error rather than a MATLAB syntax error.
%%
%[text] ## Question 5: Build a Two-Node KCL System
%[text] Now use node voltages instead of mesh currents. Node `Va_V` is connected to a 12 V fixed node through 4 ohm, to ground through 6 ohm, and to node `Vb_V` through 2 ohm. Node `Vb_V` is connected to a 5 V fixed node through 5 ohm, to ground through 10 ohm, and to node `Va_V` through 2 ohm. Write KCL as **sum of currents leaving each unknown node equals zero**.
node_R12_ohm = 4;
node_Ra0_ohm = 6;
node_Rab_ohm = 2;
node_R5_ohm = 5;
node_Rb0_ohm = 10;
node_source12_V = 12;
node_source5_V = 5;
%[text] **Required evidence:** two symbolic KCL equations, current-direction convention, and units of each term. **Defence hook:** explain why each voltage difference divided by resistance has units of amperes.
%%
%[text] ## Question 6: Map the Node Equations and Check Current Balance
%[text] Rearrange your KCL equations into `A_node_S*x_node_V=b_node_A`, where the coefficients have units of siemens, the unknowns are node voltages, and the right-hand side has units of amperes. Solve with backslash. Independently calculate the three branch currents leaving node A and verify that their signed sum is approximately zero.
%[text] **Required evidence:** conductance matrix, source-current vector, solved node voltages, one node-current balance, and physical interpretation of the voltage ordering. **Defence hook:** explain why this matrix has units of siemens instead of ohms.
%%
%[text] ## Question 7: Diagnose a Unit-Scaling Defect
%[text] Re-express the node-network resistances in kilo-ohms while keeping voltages in volts. Decide whether your calculated currents will then naturally be in amperes or milliamperes. Create one deliberately inconsistent version that mixes ohms and kilo-ohms, observe the numerical consequence, then repair the units before interpreting the result.
%[text] **Required evidence:** unit prediction, inconsistent output, diagnosis, repaired calculation, and one sentence connecting the numerical scale to Ohm's law. **Defence hook:** explain why a numerically smooth answer can still be physically wrong by a factor of 1000.
%%
%[text] ## Question 8: Recognise a Poorly Specified Pair of Equations
%[text] **Working exposure.** Consider the coefficient matrix `A_dependent=[3 -1; 6 -2]`. Without treating this as a Core requirement, explain what is suspicious about its two rows. Use MATLAB to inspect its rank, then state why two equations that are just scaled copies do not provide two independent constraints on two unknown currents.
A_dependent = [3 -1; 6 -2];
%[text] **Required evidence:** row relationship, `rank` output, and a plain-language interpretation. **Defence hook:** explain the difference between having two written equations and having two independent equations.
%%
%[text] ## Question 9: Transfer the Method to a Heater Circuit
%[text] A low-voltage heater controller is represented by two clockwise mesh currents. The left private resistor is 5 ohm, the right private resistor is 8 ohm, the shared resistor is 3 ohm, and the source rises are 18 V and 9 V. Derive, map, solve, reconstruct the shared current, and validate the original KVL equations. Then interpret the sign of each current.
heater_R1_ohm = 5;
heater_R2_ohm = 8;
heater_Rs_ohm = 3;
heater_V1_V = 18;
heater_V2_V = 9;
%[text] **Required evidence:** complete two-equation model, `A*x=b`, solved currents, shared current, direct-substitution check, and interpretation. **Defence hook:** trace one coefficient from the physical resistor network into the matrix.
%%
%[text] ## Question 10: Compare, Validate, and Declare AI Use
%[text] Compare the sensor mesh-current model, node-voltage model, and heater mesh-current model. Identify one feature that remains the same in every `A*x=b` workflow and one feature whose physical units or meaning changes with the choice of unknowns. State which validation evidence you trust most for one context and why. Record the AI tool used, the material request, what you accepted/modified/rejected, and the independent checks performed. If AI was not used, state that clearly.
%[text] **Required evidence:** cross-context comparison, validation judgement, concise AI decision record, and fresh-session run confirmation. **Defence hook:** explain why `A*x=b` is a representation of the physical equations rather than a replacement for them.
%%
%[text] ## Submission and Individual Defence
%[text] Submit one completed group file through the Week 3 Google Classroom practical assignment only after running it from the top in a fresh MATLAB session. After submissions are locked, the instructor assigns a question slot and, where needed, a parameter/sign variant; one selected group member explains the model, code/output, validation, and physical conclusion.
%[text] Do not submit complete chat histories. Your concise AI decision record and independent checks are the required evidence.
%%
%[text] ## Reproducibility Record
%[text] This baseline requires MATLAB R2025a or later and base MATLAB only. Run it from a fresh session, top to bottom, before adding group code and again before submission. All supplied resistances and voltages are declared in the relevant challenge sections.

%[appendix]{"version":"1.0"}
