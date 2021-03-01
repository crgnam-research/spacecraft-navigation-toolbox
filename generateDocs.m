clear; matlabrc; clc; close all;
addpath(genpath('lib/m2md'))

% First test:
output1 = m2md({'src/'},'docs','Template',@defaultTemplate,...
                'MakeMainIndex',true,'MainIndexName','docs.md','MakeSubIndices',true,'SubIndexName','DIRNAME',...
                'MainIndexTemplate',@defaultIndexTemplate,'SubIndexTemplate',@defaultIndexTemplate);