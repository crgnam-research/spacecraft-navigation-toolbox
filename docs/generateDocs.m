clear; matlabrc; clc; close all;
addpath(genpath('../'))

% Get all of the matlab files to publish:
docsdir = pwd;
rootdir = docsdir(1:end-4);
filelist = dir(fullfile(rootdir, '**\*.m'));

% Loop through all MATLAB documents and publish:
for ii = 2:length(filelist)
    % Publish the current .m file to html:
    mat_name = filelist(ii).name;
    html_name = [mat_name(1:end-2),'.html'];
    md_name = [mat_name(1:end-2),'.md'];
    doc_dir_path = erase(filelist(ii).folder,rootdir);
    html_path = [doc_dir_path,'\',html_name];
    md_path = [doc_dir_path,'\',md_name];
    publish(filelist(ii).name,'outputDir',doc_dir_path);
    
    % Convert the html to markdown via pandoc:
    cmd = sprintf('pandoc %s -f html -t markdown -o %s',html_path,md_path);
    system(cmd);
    delete(html_path)
    break
end