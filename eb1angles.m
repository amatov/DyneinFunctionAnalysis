function eb1angles
% try CONTROL 1

ori = [];
pos = [];
strg=sprintf('%%.%dd',2);  
[fileName,dirName] = uigetfile('*.tif','Choose a .tif file');
for i = 1:5
    indxStr=sprintf(strg,i);
    load([dirName(1:end-7),'\cands\feats',indxStr,'.mat']);
    or = feats.ori;
    po = feats.pos;
    ori = [ori;or];
    pos = [pos;po];
    clear feats; clear or; clear po
end

indx1 = find(ori==0 | ori == -45 | ori == 45 | ori == 90 | ori == -90);
ori(indx1) = 0;
indx = find(ori);

ori = ori(indx);
pos = pos(indx,:);

% X = fitVHL1(1,80,ori');
% 
% GAUSS_FIT = X
ANGLE = mean(ori)

for i = 1:10
    ind = [];
    ori = ori - mean(ori);
    ind = find(ori<=-90);
    ori(ind) = - (ori(ind)+90);
end

I = imread([dirName,filesep,fileName]);
aaux = 5;
If=Gauss2D(I,1);
figure, imshow(If(1+aaux:end-aaux,1+aaux:end-aaux),[]); 
hold on
% h1 = quiver(200,200,-cos(mean(ori)*pi/180),sin(mean(ori)*pi/180),100,'g');
% set(h1,'LineWidth',5)
for i = 1:length(ori)
    if ori(i)<0
        h = quiver(pos(i,1)-aaux,pos(i,2)-aaux,-cos(ori(i)*pi/180),sin(ori(i)*pi/180),3,'r');
        set(h,'LineWidth',2)
    elseif ori(i)>0
        h = quiver(pos(i,1)-aaux,pos(i,2)-aaux,-cos(ori(i)*pi/180),sin(ori(i)*pi/180),3,'r');% b
        set(h,'LineWidth',2)
    end
end

figure, hist(ori,20)
xlswrite('angles', ori)

feats
