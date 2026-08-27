%[text] # Image embed syntax test
%[text] The following output is intended to remain embedded in the Live Script.
modelImage = imread(fullfile('..','assets','radioactive_decay_model.png'));
image(modelImage)
axis image off
title('Embedded radioactive decay model')
disp('IMAGE_TEST_OK')
%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
