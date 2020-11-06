function [ Timematrix ] = TimesExtract_Faster(Datapath ,Maskpath )
%TIMES �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%�������
% Datapath(����Bold�ź��ļ�λ��)
% Maskpath(��ȡʱ�����е�ģ���ļ�λ��)
% �������
%TimeMatrix(����ģ����ȡ��ÿ����ģ���ڵ�Boldʱ������ƽ��ֵ)
%2020\3\27 12:36 ��ˮ
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

