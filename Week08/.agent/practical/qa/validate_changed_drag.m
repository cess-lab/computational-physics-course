cd('/Users/khairuladib/MATLAB-Drive/Kuliah/computational-physics-course');
fall_mass_kg = 0.50;
fall_drag_kg_per_s = 0.50;
fall_g_m_per_s2 = 9.81;
fall_v0_m_per_s = 0;
fall_final_time_s = 8;
fall_terminal_velocity_m_per_s = fall_mass_kg*fall_g_m_per_s2/fall_drag_kg_per_s;
fall_dt_choices_s = [0.5 0.25 0.125];
fall_final_error_m_per_s = zeros(size(fall_dt_choices_s));
for k = 1:numel(fall_dt_choices_s)
    dt_s = fall_dt_choices_s(k);
    time_s = 0:dt_s:fall_final_time_s;
    velocity_m_per_s = zeros(size(time_s));
    velocity_m_per_s(1) = fall_v0_m_per_s;
    for n = 1:numel(time_s)-1
        acceleration_m_per_s2 = fall_g_m_per_s2-(fall_drag_kg_per_s/fall_mass_kg)*velocity_m_per_s(n);
        velocity_m_per_s(n+1) = velocity_m_per_s(n)+dt_s*acceleration_m_per_s2;
    end
    velocity_exact_m_per_s = fall_terminal_velocity_m_per_s*(1-exp(-(fall_drag_kg_per_s/fall_mass_kg)*time_s));
    fall_final_error_m_per_s(k) = abs(velocity_m_per_s(end)-velocity_exact_m_per_s(end));
end
assert(abs(fall_terminal_velocity_m_per_s-9.81)<1e-12);
assert(all(diff(fall_final_error_m_per_s)<0));
assert(all(velocity_m_per_s>=0 & velocity_m_per_s<=fall_terminal_velocity_m_per_s));
disp(table(fall_dt_choices_s',fall_final_error_m_per_s','VariableNames',{'Timestep_s','ChangedDragAbsoluteError_m_per_s'}));
disp('WEEK08_CHANGED_DRAG_VALIDATION_PASSED');
