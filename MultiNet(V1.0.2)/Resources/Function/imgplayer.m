function imgplayer(delay_length)
for loop =0:9
    gif_image=[num2str(loop),'.png'];
    [S.im(:,:,:,loop+1),S.map(:,:,:,loop+1)] = imread(gif_image);
end
% [S.im,S.map] = imread(gif_image); %read all frames of an gif image
S.h1 = imshow(S.im(:,:,:,3),S.map);%loads the first image along with its colormap
S.len = size(S.im,4);
S.guifig = gca;
S.count = 1;% intialise counter to update the next frame
S.tmr = timer('TimerFcn', {@TmrFcn,S.guifig},'BusyMode','Queue',...
    'ExecutionMode','FixedRate','Period',delay_length); %form a Timer Object
guidata(S.guifig, S);
start(S.tmr); %starts Timer
set(gcf,'CloseRequestFcn',{@CloseFigure,S});

function TmrFcn(src,event,S)
%Timer Function to animate the GIF
S = guidata(S);
set(S.h1,'CData',S.im(:,:,:,S.count)); %update the frame in the axis
S.count = S.count + 1; %increment to next frame
if S.count > S.len %if the last frame is achieved intialise to first frame
    S.count = 1;
end
guidata(S.guifig, S);
function CloseFigure(src,event,S)
% Function CloseFigure(varargin)
stop(S.tmr);delete(S.tmr);%removes the timer from memory
closereq;
