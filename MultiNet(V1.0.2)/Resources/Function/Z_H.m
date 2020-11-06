function [ Z,H,D_Group,CI_Group ] = Z_H( Timematrix_Group,Roinumber )
%Z_H Calculating the Z & H index
%   author : zhishui
%   date : 2020/9/7
% local (z) versus global (h)
% nQ: number of repetition times
nQ = 100;
tau = 0.4;% Tau parameter for the consensus modularity analysis (Lancichinetti and Fortunato 2012)
rep = 100;% number of repetitions for the consensus modularity analysis
Subnum = size(Timematrix_Group,3);
CIU = nan(Roinumber,Subnum);% Individual module affiliation vectors
D = zeros(Roinumber,Roinumber,Subnum); % Individual co-classification matrices
for loop=1:size(Timematrix_Group,3)
    Timematrix_Indi = Timematrix_Group(:,:,loop);
    % correlation matrix
    [R_Matrix,~]=corr(Timematrix_Indi);
    R_Matrix(logical(eye(size(R_Matrix)))) = 0;
    R_Matrix(R_Matrix<0)=0;
    R_Matrix=atanh(R_Matrix);
    % 
    CI0=nan(Roinumber,nQ);
    for iQ=1:nQ
        [CI0(:,iQ), ~] = community_louvain(R_Matrix);
    end
    D0=agreement(CI0);
    D(:,:,loop)=D0./nQ;
    CIU(:,loop) = consensus_und(D(:,:,loop),tau,rep);
end
D_Group = agreement(CIU)/Subnum;
CI_Group = consensus_und(D_Group,tau,rep);
Z = module_degree_zscore(D_Group,CI_Group,0);
[H, ~] = diversity_coef_sign(D_Group,CI_Group);
end

