function [] = fixBrokenMd(md_path)
    % Read in the broken markdown file as string:
    markdown = fileread(md_path);
    
    % Fix broken links:
    markdown = strrep(markdown,'.html','.md'); 
    
    % Remove clutter:
    markdown = erase(markdown,'[]{#_top}');
    markdown = erase(markdown,'<div>');
    markdown = erase(markdown,'</div>');
    markdown = erase(markdown,'{.box}');
    markdown = erase(markdown,'{.comment}');
    markdown = erase(markdown,'{.code}');
    markdown = erase(markdown,'```');
    
    % Modify sub-index headers:
    doc_home_link  = '[![\<](../../../left.png) Master documentation index](../../../../documentation.html)';
    doc_home_link2 = '[![\<](../../../../left.png) Master documentation index](../../../../../documentation.html)';
    markdown = strrep(markdown,'[Index for ..\\src\\actuators ![\>](../../../right.png)](index.md)',...
                               doc_home_link);
    markdown = strrep(markdown,'..\\src\\actuators','Actuators Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\environment ![\>](../../../right.png)](index.md)',...
                               doc_home_link);
    markdown = strrep(markdown,'..\\src\\environment','Environment Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\filtering\\classes ![\>](../../../../right.png)](index.md)',...
                               doc_home_link2);
    markdown = strrep(markdown,'..\\src\\filtering\\classes','Filtering Classes Sub-Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\filtering\\functions\\ukf ![\>](../../../../../right.png)](index.md)',...
                               doc_home_link2);
    markdown = strrep(markdown,'..\\src\\filtering\\functions\\ukf','Filtering Functions UKF Sub-Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\measurement ![\>](../../../right.png)](index.md)',...
                               doc_home_link);
    markdown = strrep(markdown,'..\\src\\measurement','Measurement Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\utilities\\simple_models ![\>](../../../../right.png)](index.md)',...
                               doc_home_link2);
    markdown = strrep(markdown,' ..\\src\\simple_models','Simple Models Utilities Sub-Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\utilities\\attitude ![\>](../../../../right.png)](index.md)',...
                               doc_home_link2);
    markdown = strrep(markdown,'..\\src\\utilities\\attitude','Attitude Utilities Sub-Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\utilities\\earth_utils ![\>](../../../../right.png)](index.md)',...
                               doc_home_link2);
    markdown = strrep(markdown,'..\\src\\utilities\\earth_utils','Earth Utilities Sub-Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\utilities\\geometry ![\>](../../../../right.png)](index.md)',...
                               doc_home_link2);
    markdown = strrep(markdown,'..\\src\\utilities\\geometry','Geometry Utilities Sub-Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\utilities\\math ![\>](../../../../right.png)](index.md)',...
                               doc_home_link2);
    markdown = strrep(markdown,'..\\src\\utilities\\math','Math Utilities Sub-Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\utilities\\misc ![\>](../../../../right.png)](index.md)',...
                               doc_home_link2);
    markdown = strrep(markdown,'..\\src\\utilities\\misc','Miscellaneous Utilities Sub-Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\utilities\\orbits ![\>](../../../../right.png)](index.md)',...
                               doc_home_link2);
    markdown = strrep(markdown,'..\\src\\utilities\\orbits','Orbit Utilities Sub-Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\utilities\\time ![\>](../../../../right.png)](index.md)',...
                               doc_home_link2);
    markdown = strrep(markdown,'..\\src\\utilities\\time','Time Utilities Sub-Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\utilities\\visualization ![\>](../../../../right.png)](index.md)',...
                               doc_home_link2);
    markdown = strrep(markdown,'.\\src\\utilities\\visualization','Visualization Utilities Sub-Module');
    
    markdown = strrep(markdown,'[Index for ..\\src\\vehicles ![\>](../../../right.png)](index.md)',...
                               doc_home_link);
    markdown = strrep(markdown,'..\\src\\vehicles','Vehicle Module');
    
    
    % Fix links to home:
    markdown = strrep(markdown,'Master index','Home');
    markdown = strrep(markdown,'../../../index.md','../../../../index.md');
    
    % Line removes:
    markdown = erase(markdown,'------------------------------------------------------------------');
    markdown = erase(markdown,'-------------------------------------------------------------- ------');
    markdown = erase(markdown,'-------------------------------------------------------------- ----');
    markdown = erase(markdown,'  ---------------------------------------------------- --');
    markdown = erase(markdown,'  ------------------------------------------------- --');
    markdown = erase(markdown,'  ------------------------------------------');
    markdown = erase(markdown,'-- ----------------');
    markdown = erase(markdown,'----------------');
    markdown = erase(markdown,'   --');
    markdown = erase(markdown,'  --');
    markdown = erase(markdown,'--');
    markdown = erase(markdown,'-');
    
    % Fix formatting:
    markdown = strrep(markdown,'::: {.fragment}','```');
    markdown = strrep(markdown,':::','```');
    
    % Remove side button for section headings:
    markdown = erase(markdown,'[![\^](../../up.png)](#_top)');
    markdown = erase(markdown,'[![\^](../../../up.png)](#_top)');
    markdown = erase(markdown,'[![\^](../../../../up.png)](#_top)');
    markdown = erase(markdown,'[![\^](../../../../../up.png)](#_top)');
    markdown = erase(markdown,'[![\^](../../../../../../up.png)](#_top)');
    
    % Fix section headings:
    markdown = strrep(markdown,'[]{#_name}PURPOSE','Purpose');
    markdown = strrep(markdown,'[]{#_synopsis}SYNOPSIS','Overview');
    markdown = strrep(markdown,'[]{#_description}DESCRIPTION','Description');
    markdown = strrep(markdown,'[]{#_cross}CROSS-REFERENCE INFORMATION','Cross-Reference Information');
    markdown = strrep(markdown,'[]{#_subfunctions}SUBFUNCTIONS','Sub-functions');
    markdown = strrep(markdown,'[]{#_source}SOURCE CODE','Source Code');
   
    % Remove leading and trailing whitespace:
    markdown = strip(markdown);
    
    % Save the fixed markdown string back to the markdown file:
    fid = fopen(md_path,'w');
    fprintf(fid,'%s',markdown);
    fclose(fid);
end