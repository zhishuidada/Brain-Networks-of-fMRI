function [ Timematrix ] = TimesExtract_Faster(Datapath ,Maskpath )
%TIMES 此处显示有关此函数的摘要
%   此处显示详细说明
%输入变量
% Datapath(被试Bold信号文件位置)
% Maskpath(提取时间序列的模板文件位置)
% 输出变量
%TimeMatrix(按照模板提取的每个人模板内的Bold时间序列平均值)
%2020\3\27 12:36 治水
Matlab_version=version('-release');
Matlab_version=Matlab_version(1:end-1);
if str2num(Matlab_version)>2017
    Readfun='niftiread';
else
     Readfun='y_Read';
end
eval(['Mask=',Readfun,'(Maskpath);']);
eval(['Data = ',Readfun,'(Datapath);']);
Timematrix = zeros(size(Data,4),max(Mask(:)));
[N1,N2,N3,N4] = size(Data);
[M1,M2,M3] = size(Mask);
if N1 ~= M1 || N2 ~= M2 || N3 ~= M3
    error('The dimension of mask is NOT equal with dimension of data \n');
end
Reshdata = reshape(Data,N1*N2*N3,N4);
for loop=1:max(Mask(:))
    Regiondata = Reshdata(Mask==loop,:);
    Timematrix(:,loop)=mean(Regiondata);
end
end

