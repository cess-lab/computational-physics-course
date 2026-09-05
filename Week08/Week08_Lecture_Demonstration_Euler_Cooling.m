%[text] # Week 8 Lecture Demonstration: Simulating Cooling with Euler's Method
%[text] **LECTURE DEMONSTRATION**
%[text] PHY4605 Physics-First Reproducible MATLAB Notebook
%%
%[text] ## Physical Question and Learning Outcomes
%[text] A warm object cools in a room held at a constant temperature. How can a rule for its cooling rate predict its temperature later? We will identify a state and initial condition, trace an Euler loop, and judge the result by changing the timestep and comparing with a supplied exact solution.
%%
%[text] ## Predict Before Computing
%[text] The object starts at 80 degrees Celsius in a room at 20 degrees Celsius. Predict whether it cools by the same amount in every equal time interval. The temperature should decrease toward room temperature, and cooling should slow as the temperature difference shrinks.
%%
%[text] ## Model, Assumptions, and Units
%[text] Assume the object has a uniform temperature, the room remains at 20 degrees Celsius, and the cooling time is constant. In words: the cooling rate is minus the temperature excess divided by the cooling time. The state is $T$ in degrees Celsius; time $t$ and cooling time $\\tau$ are in seconds. The rate $dT/dt$ is in degrees Celsius per second. Temperature differences in degrees Celsius have the same numerical size as differences in kelvin.
%[text] The supplied model is $dT/dt=-(T-T\_a)/\\tau$, with initial condition $T(0)=80$. It is a model of uniform cooling, not a description of internal temperature gradients or changing room conditions.
T_room_C = 20;       % fixed room temperature (degrees Celsius)
T_initial_C = 80;    % known temperature at t = 0 (degrees Celsius)
tau_s = 100;         % cooling time (s)
t_final_s = 300;     % final simulation time (s)
dt_s = 50;           % first timestep (s)
%%
%[text] ## From a Rate to a Next Value
%[text] Euler's method holds the current rate fixed for one short step. In words: next temperature equals current temperature plus timestep times current cooling rate. Multiplying seconds by degrees Celsius per second gives a temperature change, so the update has consistent units.
%[text] The rule is $T\_{n+1}=T\_n+\\Delta t\\left[-(T\_n-T\_a)/\\tau\\right]$. A smaller timestep uses the updated cooling rate sooner.
rate_initial_Cps = -(T_initial_C-T_room_C)/tau_s
T_after_one_step_C = T_initial_C + dt_s*rate_initial_Cps
rate_second_Cps = -(T_after_one_step_C-T_room_C)/tau_s
T_after_two_steps_C = T_after_one_step_C + dt_s*rate_second_Cps
%[text] At 50 s the Euler temperature is 50 degrees Celsius; at 100 s it is 35 degrees Celsius. The second decrease is smaller because the rate is recomputed from the new temperature. These are numerical estimates, not exact temperatures.
%%
%[text] ## Algorithm Before Code
%[text] - Choose the initial temperature, room temperature, cooling time, final time, and timestep.
%[text] - Make a time array including zero and the final time; reserve one temperature value for each time.
%[text] - Store the initial condition in the first array element.
%[text] - For each interval, calculate the rate from the current temperature and store the next temperature.
%[text] - Plot the trajectory; repeat with a smaller timestep and compare against the reference. \
%%
%[text] ## Build the Time and State Arrays
%[text] The colon expression creates times separated by 50 s. Six intervals require seven stored values. MATLAB index 1 represents time zero; zeros reserves space and does not set the physical initial condition.
t_s = 0:dt_s:t_final_s;
T_C = zeros(size(t_s));
T_C(1) = T_initial_C;
number_of_values = numel(t_s)
number_of_updates = numel(t_s)-1
%%
%[text] ## Trace the Euler Loop
%[text] Each pass reads the current value at index n and writes the next at n+1. Stopping at one less than the array length keeps the last update inside the array. The minus sign makes the rate negative while the object is warmer than the room.
for n = 1:numel(t_s)-1
    rate_Cps = -(T_C(n)-T_room_C)/tau_s;
    T_C(n+1) = T_C(n) + dt_s*rate_Cps;
end
first_three_values = table(t_s(1:3)',T_C(1:3)', ...
    'VariableNames',{'Time_s','EulerTemperature_C'})
%[text] Pause and trace: when n=2, which time and temperature are read, and which element receives the answer? Reading index 1 again on every pass would incorrectly reuse the initial cooling rate.
%%
%[text] ## Read the Simulated Trajectory
%[text] The markers show computed values; straight joining lines aid reading and do not make the method exact between samples. Check the initial value, trend, and room-temperature bound before trusting the curve.
plot(t_s,T_C,'o-','Color',[0.12 0.28 0.46],'LineWidth',1.6)
hold on
yline(T_room_C,'--','Room temperature','Color',[0.25 0.45 0.34]);
hold off
xlabel('Time, t (s)')
ylabel('Temperature, T (degrees Celsius)')
title('Euler Cooling with a 50 s Timestep')
grid on
assert(T_C(1)==T_initial_C && all(T_C>=T_room_C) && all(diff(T_C)<=0), ...
    'Check the initial condition, cooling sign, and room-temperature bound.')
%[text] This physical check passes, but a plausible trend alone does not establish accuracy. We still need the timestep and reference comparison.
%%
%[text] ## Compare Timesteps at the Same Final Time
%[text] Hold the physical model fixed and change only the timestep. The outer loop repeats the already traced Euler calculation. Each chosen timestep divides 300 s exactly, so every run reaches the same final time.
dt_choices_s = [50 25 12.5];
endpoint_C = zeros(size(dt_choices_s));
for k = 1:numel(dt_choices_s)
    step_s = dt_choices_s(k);
    times_s = 0:step_s:t_final_s;
    temperatures_C = zeros(size(times_s));
    temperatures_C(1) = T_initial_C;
    for n = 1:numel(times_s)-1
        rate_Cps = -(temperatures_C(n)-T_room_C)/tau_s;
        temperatures_C(n+1) = temperatures_C(n)+step_s*rate_Cps;
    end
    endpoint_C(k) = temperatures_C(end);
end
%%
%[text] ## Supplied Exact Reference and Error
%[text] The exact solution for this model is $T(t)=T\_a+(T(0)-T\_a)\\exp(-t/\\tau)$. It satisfies the same initial condition and cooling law. Compare temperatures at 300 s, not different endpoints. Absolute temperature error is in degrees Celsius; avoid percentage errors based on Celsius temperature because its zero is arbitrary.
exact_endpoint_C = T_room_C+(T_initial_C-T_room_C)*exp(-t_final_s/tau_s);
absolute_error_C = abs(endpoint_C-exact_endpoint_C);
comparison = table(dt_choices_s',endpoint_C', ...
    repmat(exact_endpoint_C,3,1),absolute_error_C', ...
    'VariableNames',{'Timestep_s','EulerAt300s_C','ExactAt300s_C','AbsoluteError_C'})
assert(all(diff(absolute_error_C)<0), ...
    'For these runs, smaller timesteps should reduce endpoint error.')
%[text] The reference is about 22.9872 degrees Celsius. Smaller steps move the endpoint toward it. Euler cools too quickly here because each step holds a more negative starting rate while the true rate is already becoming less negative. This numerical error is separate from limitations of the cooling model.
%%
%[text] ## Lecturer-Led Parameter Change
%[text] Predict the result of doubling the cooling time to 200 s. The initial temperature is unchanged but the magnitude of the initial rate is halved. The lecturer can change tau_s above and rerun to compare the whole trajectory; the exact expression below shows the expected endpoint for this supplied change.
changed_tau_s = 200;
changed_exact_endpoint_C = T_room_C+(T_initial_C-T_room_C)*exp(-t_final_s/changed_tau_s)
%%
%[text] ## Diagnose a Clear Defect
%[text] If the Euler update omits dt_s, it adds a rate to a temperature. The code may run, but the units reveal the defect. The following calculation displays just that first wrong value for comparison; it is not used in the valid trajectory.
wrong_first_value_C = T_initial_C + rate_initial_Cps
correct_first_value_C = T_after_one_step_C
%[text] Repair the reasoning by restoring timestep times rate. A visually smooth line is not sufficient validation.
%%
%[text] ## Working Exposure: Read a Supplied ode45 Reference
%[text] ode45 is a supplied solver comparison, not a new Core implementation task. The anonymous function accepts time and temperature and returns the cooling rate; this model's rate does not explicitly depend on time. Request output at the coarse time coordinates to compare like with like. The solver selects internal steps itself.
cooling_rate = @(time_s,temp_C) -(temp_C-T_room_C)/tau_s;
[t_reference_s,T_reference_C] = ode45(cooling_rate,t_s,T_initial_C);
T_exact_at_reference_C = T_room_C+(T_initial_C-T_room_C)*exp(-t_reference_s/tau_s);
ode45_max_difference_C = max(abs(T_reference_C-T_exact_at_reference_C))
%%
%[text] ## Physical Interpretation and Reproducibility
%[text] A state evolves by repeated rate-based updates. The initial condition anchors the trajectory, and the timestep is a numerical choice rather than a physical cooling constant. For the supplied steps, the object approaches room temperature and the endpoint error falls under refinement. A smaller step cannot repair an unrealistic assumption about uniform temperature or constant surroundings.
%[text] Run from top to bottom in a fresh MATLAB session with MATLAB R2025a or later and base MATLAB. The locked model uses room temperature 20 degrees Celsius, initial temperature 80 degrees Celsius, cooling time 100 s, final time 300 s, and timesteps 50, 25, and 12.5 s. All parameters and arrays are created here.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
