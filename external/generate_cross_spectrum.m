% take care of the format of the raw data;
%                         the input type of metadata
%                         the electrodes name and order
%                         the sex used, better use F/M
% encrypt the subject name before this script
clear;clc;
country='The Netherlands';
inform_path='';
file_path='D:\EEG\EEG-electrode-interpolation\result\shaped'; 
germ = dir([file_path,'/*.mat']);
%load([inform_path,'cname.mat']);
% metadata=readtable([inform_path,'Participants_LEMON.csv'],'ReadVariableNames',true);
eeg_device='Deymed';
savepath='.\result2\';
rename_chan={'T3','T4','T5','T6'};

%% load ste and calculate crossSpec Using code form Bosch
for i=1:size(germ,1)
           
        matpath = fullfile(file_path,germ(i).name);
        EEG = load(matpath);
        %chan = struct2table(EEG.chanlocs); chan = chan.labels;
        %ind=find_char(chan,{'T7','T8','P7','P8'});
        %chan(ind)=rename_chan;
        %indx=find_char(cname,chan);
        %data=EEG.data(indx,:,:);
        data_code=germ(i).name;
        %info=metadata(strncmp(metadata.ID, data_code,10),:);
        age=EEG.age;
        sex=EEG.sex;
        data = EEG.data;
   
        [data_struct, error_msg] = data_gatherer(data, double(EEG.strate), EEG.cnames,data_code , ...
            EEG.ref, EEG.age, EEG.sex, country, eeg_device);
        
        test_folder([savepath,country]);
        save([savepath,country,'\',data_code,'\temp'],'data_struct','error_msg');
    
end

%T = struct2table(data_struct);
% xlsxname = 'MultiDataInfo998.xlsx';
% writetable(T,[copy_path,xlsxname],'Sheet','subsInfor','Range','A1');
%xlsxname = ['MultiDataInfo_',countryname,'.csv'];
%writetable(T,[copy_path,filesep,xlsxname])




