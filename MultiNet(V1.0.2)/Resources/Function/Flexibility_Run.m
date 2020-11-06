function [  ] = Flexibility_Run( Data,Mask,Winlen,Step,Option,Save)
%FLEXIBILITY_RUN constuct the varargins for Flexibility_Bold
% Author:  zhishui 
% Data:  2020/5/3 21:49
Files=dir(Data);
Files=Files(3:end);
Sublist=cell(length(Files),1);
for loop=1:length(Files)
    Sublist{loop,1}=Files(loop).name;
end
Data_Mask=y_Read(Mask);
Roinumber=max(Data_Mask(:));
Save=[Save,'\Multilayer_Flexibility'];
Flexibilityrun_Bold(Sublist,Data,Save,Mask,Roinumber,Winlen,Step,Option);
