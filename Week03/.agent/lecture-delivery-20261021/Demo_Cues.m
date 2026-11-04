%% Instructor cue sheet — use after the corresponding canonical sections
% Run in a fresh MATLAB session or an unsaved instructor scratch copy.
% This is an instructor rehearsal aid, not a replacement student Live Script.
%% A — build and solve
R1_ohm=2; R2_ohm=3; Rs_ohm=1; V1_V=5; V2_V=2;
A_ohm=[R1_ohm+Rs_ohm,-Rs_ohm;-Rs_ohm,R2_ohm+Rs_ohm];
b_V=[V1_V;V2_V];
x_A=A_ohm\b_V
assert(max(abs(x_A-[2;1]))<1e-12)
%% B — shared branch
I1_A=x_A(1); I2_A=x_A(2);
Ishared_A=I1_A-I2_A
%% C — original physical equations
left_reconstructed_V=(R1_ohm+Rs_ohm)*I1_A-Rs_ohm*I2_A;
right_reconstructed_V=-Rs_ohm*I1_A+(R2_ohm+Rs_ohm)*I2_A;
validation_difference_V=[left_reconstructed_V-V1_V;right_reconstructed_V-V2_V]
assert(max(abs(validation_difference_V))<1e-12)
%% D — wrong-sign diagnosis and minimum repair
A_wrong_sign_ohm=[3,1;-1,4];
x_wrong_sign_A=A_wrong_sign_ohm\b_V
wrong_model_difference_V=A_ohm*x_wrong_sign_A-b_V
assert(max(abs(wrong_model_difference_V-[-22/13;0]))<1e-12)
A_repaired_ohm=A_wrong_sign_ohm;
A_repaired_ohm(1,2)=-Rs_ohm;
x_repaired_A=A_repaired_ohm\b_V;
assert(max(abs(A_ohm*x_repaired_A-b_V))<1e-12)
%% E — representation and one controlled input change
x_reordered_A=A_ohm([2 1],:)\b_V([2 1]);
assert(max(abs(x_reordered_A-x_A))<1e-12)
b_perturbed_V=[V1_V;2.1];
x_perturbed_A=A_ohm\b_perturbed_V
assert(max(abs(x_perturbed_A-[221/110;113/110]))<1e-12)
% One student modification. Validate against the NEW source vector.
b_student_V=[V1_V;2.2];
x_student_A=A_ohm\b_student_V
student_difference_V=A_ohm*x_student_A-b_student_V
assert(max(abs(x_student_A-[111/55;58/55]))<1e-12)
assert(max(abs(student_difference_V))<1e-12)
