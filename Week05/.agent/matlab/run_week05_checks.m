% Run Week 05 hidden QA checks without depending on the current folder.
script_dir = fileparts(mfilename('fullpath'));
week_dir = fileparts(fileparts(script_dir));
run(fullfile(week_dir,'Week05_Lecture_Demonstration_Root_Finding_for_Projectile_Range.m'))
run(fullfile(week_dir,'.agent','practical','Week05_Practical_AI_Enabled_Root_Finding_Reference.m'))
run(fullfile(script_dir,'generate_week05_learning_note_plot.m'))
