function [  ] = CreateRoimask(Manualindex,Radius,RefFile,SavePath,Type,varargin)
%CREATEROIMASK create roi mask
%  Author: zhishui
%  Date: 2020/5/7
DefaultOpts=struct('Indexpath','',...
    'Sheetname','');
Args=parseInOpts(DefaultOpts,varargin);
[Mask,Header] = y_Read(RefFile);
if Type==1
    Index = xlsread(Args.Indexpath,Args.Sheetname);
elseif Type==2
    Index = Manualindex;
end
% Node
Node = zeros(size(Index,1),6);
Node(:,1:3)=Index(:,2:4);
Node(:,4:5)=3;
Node(:,6)=Index(:,1);
Mask_Create = zeros(size(Mask));
for loop=1:length(Index)
    Index_Roi=Index(loop,2:4);
    Mask_Roi = y_Sphere(Index_Roi,Radius,Header);
    if  sum(Mask_Create(Mask_Roi==1))
        cprintf([1,0.5,0],'Warning: There is an intersection between different brain regions:\n\tOverlap voxels: %d\n',length(Mask_Create(Mask_Roi==1&Mask_Create~=0)))
    end
    Mask_Create(Mask_Roi==1) = Index(loop,1);
end
y_Write(Mask_Create,Header,[SavePath,'.nii']);
save([SavePath,'.node'],'Node','-ascii');

