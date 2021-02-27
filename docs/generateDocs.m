clear; matlabrc; clc; close all;
addpath(genpath('../'))

mat_rootdirStruct = dir('..');
mat_rootdir = mat_rootdirStruct.folder;

% Get all of the matlab files to publish:
d = dir('../src/**');
matfolders  = d([d(:).isdir]);
matfolders  = matfolders(~ismember({matfolders(:).name},{'.','..'}));

% Run m2html to autogenerate documentation:
m2html('mfiles','../src','htmldir','m2html_out','recursive','on');

% Create a new markdown document for documentation index:
fid = fopen('documentation.md', 'wt');
fprintf(fid, '## Documentation\n\n -src/\n');
    
% Convert all html files to markdown:
html_files = dir('src/**/*.html');
for ii = 1:length(html_files)
    html_path = fullfile(html_files(ii).folder,html_files(ii).name);
    md_path   = [html_path(1:end-5),'.md'];
    cmd = sprintf('pandoc %s -f html -t markdown -o %s',html_path,md_path);
    system(cmd);
    delete(html_path)
    
    % Write to markdown file:
    rel_path = relativepath(md_path,pwd);
    rel_path = rel_path(3:end-1);
    fprintf(fid, '%s- [%s](%s)\n', blanks(2*(length(strfind(rel_path,'\'))-1)),...
                                   html_files(ii).name(1:end-5), strrep(rel_path,'\','/'));
end
fclose(fid);