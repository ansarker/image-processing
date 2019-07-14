%% Anis Sarker
%  Date: 1/08/2017

%% Assignment 4
%% Background subtraction, median filtering, image averaging
%  Input: 3-channel or 1-channel video or images
%  Output: detection of object and filtered images

%% clear workspace
clear all;
clear;
clc;
% 
[file, path] = uigetfile({'*.mp4'; '*.webm'});
video_path = fullfile(path, file);
readerObj = VideoReader(video_path, 'tag', 'myreader1');
vidFrames = read(readerObj);
numFrames = get(readerObj, 'NumberOfFrames');
figure;
for k = 1 : numFrames - 1
    frame = vidFrames(:,:,:,k);
    subplot(1,2,1); imshow(frame); title('Lets');
    hold on;
    subplot(1,2,2); imshow(frame); title('see');
    hold on;
end

N1=rand(121,20e3);
X1=rand(1,121);
Y1=rand(1,121);
Z1=rand(1,121);
N2=rand(121,20e3);
X2=rand(1,121);
Y2=rand(1,121);
Z2=rand(1,121);
dt=100;

FigH = figure;
ax1 = subplot(1, 2, 1, 'NextPlot', 'add');  % as: hold on
colorbar;
caxis(ax1,[0 1]);
t1 = title('dummy');
view(ax1, 3);
ax2 = subplot(1, 2, 2, 'NextPlot', 'add');  % as: hold on
colorbar;
caxis(ax2,[0 1]);
t2 = title('dummy');
view(ax2, 3);
dt = 100;
nFrame = numel(1:dt:length(N1));  % [EDITED]
F(nFrame) = struct('cdata',[],'colormap',[]);
ScatterH1 = [];
ScatterH2 = [];
iFrame = 0;
for i = 1:dt:length(N1)
  if ~isempty(ScatterH1)  % Clean up former objects
     delete(ScatterH1);   % Alternative: Update the 'CData' only
     delete(ScatterH2);
  end
    cmap=N1(:,i)';
    ScatterH1 = scatter3(X1,Y1,Z1,50,cmap,'filled', 'Parent', ax1);
    set(t1, 'String', sprintf('Time = %.1f ms', i*0.1));  % [EDITED]
    cmap2=N2(:,i)';
    ScatterH2 = scatter3(X2,Y2,Z2,50,cmap2,'filled', 'Parent', ax2);
    set(t2, 'String', sprintf('Time = %.1f ms', i*0.1));  % [EDITED]
    drawnow
    iFrame = iFrame + 1;
    F(iFrame) = getframe(FigH);  % Not i, because this steps in dt
  end
figure;
MovieSize = [size(F(1).cdata, 2), size(F(1).cdata, 1)];
AxesH = axes('Visible', 'off', 'Units', 'pixels', ...
           'Position', [10, 10, MovieSize]);
movie(AxesH, F);