function [] = footer(t)
%                  
% FUNCTION:     footer -- Wavelet despiking footer function.
%                
% USAGE:        footer(t)
%
% Inputs:       t      -- Cputime at start of run.
%
% AUTHOR:       Ameera X Patel
% CREATED:      10-01-2014
%   
% CREATED IN:   MATLAB 7.13
%
% REVISION:     6 (06-09-2017)
%
% COPYRIGHT:    Ameera X Patel (2017), University of Cambridge
%
% TOOLBOX:      BrainWavelet Toolbox v2.0

% ID: footer.m 6 06-09-2017 BWTv2.0 axpatel

%% validate inputs

fname=mfilename;
if nargin<1
    help(fname); return
end

if chkninput(nargin,[1,1],nargout,[0,0],fname) + ...
        chkintype(t,'numeric',fname) >=1;
    return
end

%% print footer

fprintf('\nComplete\n')

runtime=num2str(round(cputime-t));
fprintf('\nCPU time: %s seconds\n',runtime)

cprintf([0.1,0.1,0.7],'\n============================================\n\n')

end