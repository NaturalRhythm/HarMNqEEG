

%======================================================
% organized data: 
% 1-collect meta information; 
% 2-extract country, age, sex, EEGmachine, filepath;
% 3-this tabel is teh input of step1
% write by: YingWang(Rigel), MinLi
% date: 2/19/2021
%===================================================


path_data='.\result\The Netherlands';     % cross-spectrum tensor path
metatable_name='metatable';               % metatable name
path_out='.\result';
pathology='';                            % pathology of the dataset

T=genMetaDataTable(path_data,pathology);
writetable(T,[path_out,filesep,metatable_name,'.xlsx']);











