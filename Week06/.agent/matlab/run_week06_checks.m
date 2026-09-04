% Run Week 06 hidden QA checks without depending on the current folder.
script_dir = fileparts(mfilename('fullpath'));
week_dir = fileparts(fileparts(script_dir));
run(fullfile(week_dir,'Week06_Lecture_Demonstration_Numerical_Differentiation_of_Vertical_Motion.m'))
run(fullfile(week_dir,'.agent','practical','Week06_Practical_AI_Enabled_Numerical_Differentiation_Reference.m'))
run(fullfile(script_dir,'generate_week06_learning_note_figures.m'))
