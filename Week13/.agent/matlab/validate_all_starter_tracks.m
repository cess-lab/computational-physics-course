% Week 13 hidden validation harness.
% It creates derived track copies under .agent/matlab/track-runs so each supplied
% problem-space branch can be smoke-tested without editing the student-facing file.
qa_dir = fileparts(mfilename('fullpath'));
week_dir = fullfile(qa_dir,'..','..');
source_file = fullfile(week_dir,'Week13_Capstone_Starter_and_Validation.m');
track_dir = fullfile(qa_dir,'track-runs');
if ~isfolder(track_dir)
    mkdir(track_dir)
end
source_text = fileread(source_file);
default_line = 'selected_problem_space = "projectile_range";';
track_names = ["projectile_range";"rc_charging";"radioactive_decay";"cooling";"decaying_force_impulse"];
required_pass = false(size(track_names));
chosen_pass = false(size(track_names));
for index = 1:numel(track_names)
    replacement_line = 'selected_problem_space = "' + track_names(index) + '";';
    track_text = strrep(source_text,default_line,replacement_line);
    track_file = fullfile(track_dir,'Week13_track_' + track_names(index) + '.m');
    file_id = fopen(track_file,'w');
    fwrite(file_id,track_text);
    fclose(file_id);
    run(track_file)
    required_pass(index) = required_check_passed;
    chosen_pass(index) = chosen_check_passed;
    fprintf('TRACK %s REQUIRED=%d CHOSEN=%d\n',track_names(index),required_pass(index),chosen_pass(index))
    close all
end
assert(all(required_pass),'At least one supplied required validation branch failed.')
assert(all(chosen_pass),'At least one supplied chosen validation branch failed.')
disp('WEEK13_ALL_STARTER_TRACKS_PASSED')
