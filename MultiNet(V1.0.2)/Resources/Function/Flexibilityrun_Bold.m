function [  ] = Flexibilityrun_Bold(Sublist,Datapath,Savepath,Maskpath,Roinumber,Winlen,Step,Option)
%FLEXIBILITY_BOLD 分别对每个被试计算Multilayer_Flexibility
%   此处显示详细说明
Flexibility_All=zeros(length(Sublist),Roinumber);
Volatility_All=zeros(length(Sublist),Roinumber);
Allegiance_All=zeros(length(Sublist),Roinumber,Roinumber);
Promiscuity_All=zeros(length(Sublist),Roinumber);
mkdir([Savepath,'\Individual\Flexibility\']);
mkdir([Savepath,'\Individual\Allegiance\']);
mkdir([Savepath,'\Individual\Volatility\']);
mkdir([Savepath,'\Individual\Transition\']);
mkdir([Savepath,'\Individual\Quatity\']);
mkdir([Savepath,'\Individual\Iterations\']);
mkdir([Savepath,'\Individual\Timematrix\']);
mkdir([Savepath,'\Individual\Corr_Matrix\']);
mkdir([Savepath,'\Individual\Promiscuity\']);
% Integration
% network
if Option.ifnet
    [~,~,Roicate]=xlsread(Option.netpath);
    Roiinfo=Roicate(2:end,1:2);
    Netnumber=length(unique(Roiinfo(:,2)));
    Integration_All=zeros(length(Sublist),Roinumber);
    Recruitment_All=zeros(length(Sublist),Roinumber);
    Interaction_All=zeros(length(Sublist),Netnumber,Netnumber);
    mkdir([Savepath,'\Individual\Integration\']);
    mkdir([Savepath,'\Individual\Recruitment\']);
    mkdir([Savepath,'\Individual\Interaction\']);
    mkdir([Savepath,'\Individual\Details\']);
end
% group
mkdir([Savepath,'\Group\']);
% initialize
Timematrix_All = zeros(Option.Timepoints,Roinumber,length(Sublist));
for loop=1:length(Sublist)
    Finalfile=dir([Datapath,'\',Sublist{loop},'\']);
    Finalfile=Finalfile(3:end);
    Finalname=Finalfile(length(Finalfile)).name;
    Path=[Datapath,'\',Sublist{loop},'\',Finalname];
    switch Option.Datatype
        case 1
            Timematrix=TimesExtract_Faster(Path,Maskpath);
            Timematrix_All(:,:,loop) = Timematrix;
        case 2
            % Timematrix : timepoints * rois
            Timematrix=load(Path);
            fname = fieldnames(Timematrix);
            Timematrix = Timematrix.(fname{1});
        case 3
            Timematrix=ReadNPY(Path);
    end
    [Flexibility,Allegiance,Volatility,Transition,Quatity,Iterations,Corr_Matrix,Promiscuity]=...
    Multilayer_Flexibility(Timematrix,Winlen,Step,...
    'Omega',Option.Omega,'Gamma',Option.Gamma,'itertimes',Option.itertimes,...
    'Threshold',Option.Threshold,'FDR',Option.FDR,'Fisherz',Option.Fisherz,'Algorithm',Option.Algorithm);
    fprintf('%s: finished\n',Sublist{loop});
    Flexibility_All(loop,:)=Flexibility;
    Volatility_All(loop,:)=Volatility;
    Allegiance_All(loop,:,:)=Allegiance;
    Promiscuity_All(loop,:)=Promiscuity;
    % integration
    if Option.ifnet
        [Recruitment,Integration,Interaction,Details] = Integration_Network( Allegiance,Roiinfo );
        Recruitment_All(loop,:)=Recruitment;
        Integration_All(loop,:)=Integration;
        Interaction_All(loop,:,:)=Interaction;
        save([Savepath,'\Individual\Recruitment\',Sublist{loop},'.mat'],'Recruitment');
        save([Savepath,'\Individual\Integration\',Sublist{loop},'.mat'],'Integration');
        save([Savepath,'\Individual\Interaction\',Sublist{loop},'.mat'],'Interaction');
        save([Savepath,'\Individual\Details\',Sublist{loop},'.mat'],'Details');
    end
    % save
    save([Savepath,'\Individual\Flexibility\',Sublist{loop},'.mat'],'Flexibility');
    save([Savepath,'\Individual\Allegiance\',Sublist{loop},'.mat'],'Allegiance');
    save([Savepath,'\Individual\Volatility\',Sublist{loop},'.mat'],'Volatility');
    save([Savepath,'\Individual\Transition\',Sublist{loop},'.mat'],'Transition');
    save([Savepath,'\Individual\Quatity\',Sublist{loop},'.mat'],'Quatity');
    save([Savepath,'\Individual\Iterations\',Sublist{loop},'.mat'],'Iterations');
    save([Savepath,'\Individual\Timematrix\',Sublist{loop},'.mat'],'Timematrix');
    save([Savepath,'\Individual\Corr_Matrix\',Sublist{loop},'.mat'],'Corr_Matrix');
    save([Savepath,'\Individual\Promiscuity\',Sublist{loop},'.mat'],'Promiscuity');
end
save([Savepath,'\Group\Flexibility_All.mat'],'Flexibility_All');
save([Savepath,'\Group\Volatility_All.mat'],'Volatility_All');
save([Savepath,'\Group\Allegiance_All.mat'],'Allegiance_All');
save([Savepath,'\Group\Promiscuity_All.mat'],'Promiscuity_All');
% local and global
[ Local_All,Global_All,D_Group,CI_Group] = Z_H( Timematrix_All,Roinumber );
save([Savepath,'\Group\Local_All.mat'],'Local_All');
save([Savepath,'\Group\Global_All.mat'],'Global_All');
save([Savepath,'\Group\D_Group.mat'],'D_Group');
save([Savepath,'\Group\CI_Group.mat'],'CI_Group');
if Option.ifnet
    save([Savepath,'\Group\Integration_All.mat'],'Integration_All');
    save([Savepath,'\Group\Recruitment_All.mat'],'Recruitment_All');
    save([Savepath,'\Group\Interaction_All.mat'],'Interaction_All');
end
save([Savepath,'\Group\Sublist.mat'],'Sublist');
end

