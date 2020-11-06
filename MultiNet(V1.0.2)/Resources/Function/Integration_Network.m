function [Recruitment,Integration,Interaction,Details] = Integration_Network( Allegiance,Roiinfo )
%INTEGRATION caculate integration ,interaction and  recruitment coeficients
% Author: zhishui
% Date:   2020/4/29
%   Input:
% Path_Allegiance: path of Allegiance matrix
% Path_Maskinfo:path of Rois categories of according mask(.xls/.xlsx)
% Timematrix 
% form of Path_Maskinfo:Rios*2(the first column is roi number,the second column is typename and the first row is tittle)
% ROI	Type
% 1     SMN
% 2     DMN
% 3     SUB
% 4     SAN
% Because mask of power264 have undefined nodes ,these nodes are named 'undefined' when
% caculating integration, recruitment, divergence
% caculating global and local coefficients h & z
% Allegiance = load(Path_Allegiance);
% Allegiance = Allegiance.Allegiance;
if find(Allegiance~=Allegiance')
    cprintf([1,0.5,0],'Allegiance matrix must be symmmetric\n');
end
% [~,~,Roicate]=xlsread(Path_Maskinfo);
% Roiinfo=Roicate(2:end,1:2);
%Detail
Details=cell(length(Allegiance),3);
Details(:,1)=Roiinfo(:,1);
Restore=zeros(size(Roiinfo(:,1)));
% Roiinfo(cellfun(@(x) any(isnan(x)),Roiinfo(:,2)),:)={'undefined'};
Number = cell2mat(Roiinfo(:,1));
Allegiance=Allegiance(Number,Number);
Types=unique(Roiinfo(:,2));
% Initialize
% Temp=zeros(size(Allegiance));
% Regionnum=zeros(size(Allegiance,1),1);
% h & z
Interaction=zeros(length(Types),length(Types));
Order=1:length(Number);
Restore(Number)=Order;
Details(:,2)=num2cell(Restore);
Details(1:length(Types),3)=Types;
% Make sure the diagonal of the module allegiance is all nan
Allegiance(logical(eye(size(Allegiance)))) = nan;
% caculate the Interaction matrix
for Type_out=1:length(Types)
    Index_out = Order(strcmpi(Roiinfo(:,2),Types{Type_out}));
    outout=Allegiance(Index_out,Index_out);
    for Type_in=Type_out:length(Types)
        Index_in = Order(strcmpi(Roiinfo(:,2),Types{Type_in}));
        inin=Allegiance(Index_in,Index_in);
        Tempmatrix=Allegiance(Index_out,Index_in);
        if Type_in==Type_out
            Interaction(Type_in,Type_out)=nanmean(Tempmatrix(:));
        else
            Norcoe=sqrt(nanmean(outout(:))*nanmean(inin(:)));
            Interaction(Type_in,Type_out)=nanmean(Tempmatrix(:))/Norcoe;    
        end

    end
end
Interaction=Interaction+tril(Interaction,-1)';
systemByNode=Roiinfo(:,2);
Integration = integration(Allegiance,systemByNode);
Recruitment = recruitment(Allegiance,systemByNode);
end
