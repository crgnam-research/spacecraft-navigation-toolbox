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
movefile('src*','m2html_out/docs')
    
%% Convert all html files to markdown:
html_files = dir('m2html_out/docs/src/**/*.html');
for ii = 1:length(html_files)
    html_path = fullfile(html_files(ii).folder,html_files(ii).name);
    md_path   = [html_path(1:end-5),'.md'];
    
    % Convert the html to markdown:
    cmd = sprintf('pandoc %s -f html -t markdown -o %s',html_path,md_path);
    system(cmd);
    delete(html_path)
    
    % Fix broken markdown syntax:
    fixBrokenMd(md_path);
end

%%
index_md_files = dir('m2html_out/docs/src/**/index.md');
% Create a new markdown document for documentation index:
fid = fopen('documentation.md', 'wt');
fprintf(fid, '## Documentation\n\n- src/\n');

m2html_root = dir('m2html_out');
m2html_root = m2html_root(1).folder;

% Write to documentation markdown file tree:
for ii = 1:length(index_md_files)
    index_md_path = fullfile(index_md_files(ii).folder,index_md_files(ii).name);
    index_md_path = erase(index_md_path,m2html_root);
    mod_name = erase(index_md_path(11:end),'\index.md');
    fprintf(fid, '%s- [%s](%s)\n', blanks(2*(length(strfind(index_md_path,'\'))-3)),...
                                   [upper(mod_name(1)), mod_name(2:end)],...
                                   ['m2html_out/',strrep(index_md_path,'\','/')]);
end
    
fclose(fid);