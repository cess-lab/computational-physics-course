% Run Week 07 hidden QA checks without depending on the current folder.
script_dir = fileparts(mfilename('fullpath'));
week_dir = fileparts(fileparts(script_dir));
run(fullfile(week_dir,'Week07_Lecture_Demonstration_Numerical_Integration_of_Decaying_Force.m'))
run(fullfile(week_dir,'Week07_Practical_AI_Enabled_Numerical_Integration_Challenge_Set.m'))
run(fullfile(week_dir,'.agent','practical','Week07_Practical_AI_Enabled_Numerical_Integration_Reference.m'))
run(fullfile(script_dir,'generate_week07_learning_note_figures.m'))
