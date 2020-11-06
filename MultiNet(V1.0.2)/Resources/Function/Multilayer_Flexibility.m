function [Flexibility,Allegiance,Volatility,Transition,Quatity,Iterations,Corr_Matrix,Promiscuity] = Multilayer_Flexibility(Timematrix,Winlen,Step,varargin)
% Multilayer_Flexibility
% Version: 1.1.0 beta
% Date: 2020/4/28
% Copyright (C) 2020-2021 zhishui All Rights Reserved
% Input
%       Timematrix:ROI Timeseries matrix(row*column), row:timepoints, column:ROIs¡£
%       Winlen:Window length(tr)
%       Step:step
% Optional varargin:
%       Cotype: choose 'wavlvelet coherence' or' Pearson correlation
% coefficient' to construct the functional connectivity network,
% 0:wavlvelet coherence ,1:Pearson correlation defautl:1
%       Omega:Parameter of  GenLouvain algorithm£¬default:1
%       Gamma: Parameter of  GenLouvain algorithm£¬default:1
%       deterministic ,To force deterministic behavior,1:deterministic,0:random,default:1
%       FDR:perform flase discovery rate correction to correlation matrix.
%       Threshold: Threshold of the correlation matrix (default:0)
%       itertimes: Optimization repetition times of algorithm(because under default options, 
% this routine can return different results from run to run because it considers nodes in pseudorandom (randperm)
% Example:
% [Flexibility,Allegiance,Volatility,Transition,Quatity,Iterations] = Multilayer_Flexibility(Timematrix,50,50,'itertimes',1,'FDR',1);
%the multilayer community detection algorithm requires the selection
% of two different parameters¡ª¦Ø and ¦Ã¡ªthat tune the resolution
% of the community structure (¦Ã) and the strength of interlayer
% coupling (¦Ø). As a standard and in absence of an a priori hypothesis,
% those parameters are normally set to 1.
% Algorithm II to perform iterated_genlouvain 
%     N=length(A{1});
%     T=length(A);
%     [B,mm]=multiord(A,gamma,omega);
%     PP = @(S) postprocess_ordinal_multilayer(S,T);
%     %random: iterated_genlouvain(B,[],[],[],[],[], PP);
%     % deterministic: iterated_genlouvain(B,[],[],0,[],[], PP);
%     [S,Q,Iterations(iter,1)] = iterated_genlouvain(B,[],[],Args.deterministic,[],[], PP);
%     % [S,Q]= genlouvain(B);
%     Q=Q/mm;
%     S=reshape(S,N,T);
%     %
%     Quatity(iter,1)=Q;
%     Transition{iter,1}=S;

% When using the multilayer quality function in Mucha et al. 2010, 
% we recommend using iterated_genlouvain with 'moverandw' and the appropriate post-processing function 
% (i.e., postprocess_ordinal_multilayer for an ordered multilayer network 
% and postprocess_categorical_multilayer for an unordered multilayer network) for better results.

%----------default arguments for the Multilayer_Flexibility-----------
DefaultOpts=struct('Omega',1, ...
    'Gamma',1,...
    'Zerodiag',1,...
    'Algorithm',0,...
    'FDR',0,...
    'Threshold',0,...
    'itertimes',100,...
    'Fisherz',1);
Args=parseInOpts(DefaultOpts,varargin);
Timepoints=size(Timematrix,1);
% Calculate the total number of Windows, at least 1 window
Windownum=1;
if Step>0 && round(Step)==Step
    while 1
        if (Winlen+(Windownum-1)*Step)>Timepoints
            Windownum=Windownum-1;
            break;
        end
        Windownum=Windownum+1;
    end
else
    error('Step selection error !')
end
Corr_Matrix =cell(Windownum,1);
% multilayer correlation matrix
for Num=1:Windownum
    Data_Discrete=Timematrix(1+Step*(Num-1):Winlen+Step*(Num-1),:);
    [R_Matrix,P_Matrix]=corr(Data_Discrete);
    % zero diag
    if Args.Zerodiag
        R_Matrix(logical(eye(size(R_Matrix)))) = 0;
    end
    % Estimate positive false discovery rate(BHFDR) for multiple hypothesis
    % testing of correlation matrix(p<0.05)
    if Args.FDR
        P_Column=reshape(P_Matrix,[size(P_Matrix,1)*size(P_Matrix,2),1]);
        P_Fdr=mafdr(P_Column,'BHFDR', true);
        P_Fdr=reshape(P_Fdr,size(P_Matrix,1),size(P_Matrix,2));
        R_Matrix(P_Fdr<0.05)=0;
    end
    %Set negative Numbers to zero
    R_Matrix(R_Matrix<Args.Threshold)=0;
    % fisherz
    if Args.Fisherz
        R_Matrix=atanh(R_Matrix);
    end
    Corr_Matrix{Num,1}=R_Matrix;
end
% genlouvain iteration times:default:100
A = Corr_Matrix;
omega = Args.Omega;
gamma = Args.Gamma;
Quatity = zeros(Args.itertimes,1);
Transition = cell(Args.itertimes,1);
Iterations = zeros(Args.itertimes,1);
Flexibility=zeros(size(Timematrix,2),1);
Allegiance=zeros(size(Timematrix,2),size(Timematrix,2),Args.itertimes);
Volatility=zeros(size(Timematrix,2),1);
Promiscuity=zeros(size(Timematrix,2),1);
for iter=1:Args.itertimes
    N=length(A{1});
    T=length(A);
    B=spalloc(N*T,N*T,N*N*T+2*N*T);
    twomu=0;
    for s=1:T
        k=sum(A{s});
        twom=sum(k);
        twomu=twomu+twom;
        indx=[1:N]+(s-1)*N;
        B(indx,indx)=A{s}-gamma*k'*k/twom;
    end
    twomu=twomu+2*omega*N*(T-1);
    B = B + omega*spdiags(ones(N*T,2),[-N,N],N*T,N*T);
    if Args.Algorithm
        % iterated_genlouvain
        PP = @(S) postprocess_ordinal_multilayer(S,T);
        [S,Q,Iterations(iter,1)] = iterated_genlouvain(B,[],[],[],'moverandw',[], PP);
    else
        % classic 
        [S,Q] = genlouvain(B);
        Iterations(iter,1)=1;
    end
    Q = Q/twomu;
    S = reshape(S,N,T);
    %
    Quatity(iter,1)=Q;
    Transition{iter,1}=S;
    % Flexibility
    Flexibility =Flexibility+flexibility(S');
    % caculate promiscuity 
    Promiscuity_Iter = promiscuity(S');
    Promiscuity=Promiscuity+Promiscuity_Iter;
    % caculate the 'Allegiance'matrix
    Conn_Oneiter=zeros(size(Timematrix,2),size(Timematrix,2));
    for Num_Iter=1:Windownum
        Conn_Onelayer=zeros(size(Timematrix,2),size(Timematrix,2));
        for Num_Region_out=1:size(Timematrix,2)
            for Num_Region_in=Num_Region_out:size(Timematrix,2)
                if S(Num_Region_out,Num_Iter)==S(Num_Region_in,Num_Iter)
                    Conn_Onelayer(Num_Region_out,Num_Region_in)=1;
                end
            end
        end
        Conn_Onelayer=Conn_Onelayer+Conn_Onelayer';
        Conn_Onelayer=Conn_Onelayer-eye(size(Conn_Onelayer));
        Conn_Oneiter=Conn_Oneiter+Conn_Onelayer;
    end
    Conn_Oneiter=Conn_Oneiter/Windownum;
    Allegiance(:,:,iter)=Conn_Oneiter;
    % caculate the volatility
    Volatility_Iter=zeros(size(Timematrix,2),1);
    for Num_Region=1:size(Timematrix,2)
        Volatility_Iter(Num_Region,1)=length(unique(S(Num_Region,:)))/Windownum;
    end
    Volatility=Volatility+Volatility_Iter;
end
Flexibility=Flexibility/Args.itertimes;
Allegiance=mean(Allegiance,3);
Volatility=Volatility/Args.itertimes;
Promiscuity=Promiscuity/Args.itertimes;
end

