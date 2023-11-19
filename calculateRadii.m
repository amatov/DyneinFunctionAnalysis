function [distTrackEndToPole,indx] = calculateRadii

% % get centers of pole for each image
% [fileName,dirName] = uigetfile('*.tif','Choose a .tif file');
% s = 3;
% strg=sprintf('%%.%dd',s);
% for i = 1:100
%     indxStr=sprintf(strg,i);
%     I = imread([dirName,fileName(1:end-7),indxStr,'.tif']);
%     imshow(I,[]);
%     [x(i),y(i)] = ginput(1)   
% end
% save x y
% % check if pole coordinates are correct
% x =[368 368 369 370 370 371 372 372 372 371 370 368 366 364 361 361 361 358 356 354 354 351 351 350 350 350 348 346 347 345 345 342 342 342 340 337 337 335 331 332 332 332 329 329 329 331 331 332 332 332 328 329 330 330 330 329 333 332 335 337 340 340 339 345 347 348 348 351 351 351 353 355 357 357 358 358 358 362 369 372 372 375 376 380 382 387 388 391 393 397 400 406 410 414 419 424 426 428 429 431];
% y =[221 218 213 212 210 209 206 204 200 197 194 191 190 187 187 183 181 176 176 174 174 171 170 214 214 212 252 250 250 248 250 249 249 249 246 248 248 247 247 247 247 245 244 244 242 242 245 243 243 243 247 247 247 248 251 250 256 256 261 261 267 266 268 270 272 276 277 275 278 281 281 288 288 290 289 289 290 290 296 298 300 302 299 301 301 302 298 299 299 299 301 301 301 300 304 305 305 308 308 313];
% [fileName,dirName] = uigetfile('*.tif','Choose a .tif file');
s = 3;
strg=sprintf('%%.%dd',s);
% for i = 1:100
%     indxStr=sprintf(strg,i);
%     I = imread([dirName,fileName(1:end-7),indxStr,'.tif']);
%     figure,imshow(I,[]);
%     hold on
%     plot(x(1:i),y(1:i),'b-')
%     plot(x(i),y(i),'b*')
% end
% SWAP X AND Y
y =[368 368 369 370 370 371 372 372 372 371 370 368 366 364 361 361 361 358 356 354 354 351 351 350 350 350 348 346 347 345 345 342 342 342 340 337 337 335 331 332 332 332 329 329 329 331 331 332 332 332 328 329 330 330 330 329 333 332 335 337 340 340 339 345 347 348 348 351 351 351 353 355 357 357 358 358 358 362 369 372 372 375 376 380 382 387 388 391 393 397 400 406 410 414 419 424 426 428 429 431];
x =[221 218 213 212 210 209 206 204 200 197 194 191 190 187 187 183 181 176 176 174 174 171 170 214 214 212 252 250 250 248 250 249 249 249 246 248 248 247 247 247 247 245 244 244 242 242 245 243 243 243 247 247 247 248 251 250 256 256 261 261 267 266 268 270 272 276 277 275 278 281 281 288 288 290 289 289 290 290 296 298 300 302 299 301 301 302 298 299 299 299 301 301 301 300 304 305 305 308 308 313];
% read all tracks from disk - like for grouiping
[fileName,dirName] = uigetfile('*.tif','Choose a .tif file');
I = imread([dirName,filesep,fileName]);
[xmax,ymax] = size(I);
load([dirName(1:end-8),'\point_files\config001_5p00_track_bidir.mat']);
LifeTime = 4; % min lifetime for tracks considered
indx = find( [tracks.len] >= LifeTime);
traj = tracks(indx);
leIndx = length(indx);
% find indeces of tracks ending in eaech frame as of nb 7
for i = 1:leIndx
    traj(i).endID = traj(i).startID + traj(i).len - 1;
end
% compute distance to each pole at each step/frame
pixelSize = 0.215; % (microns)
indx=struct('list',[],'poleDist',[]);% track list
for i = LifeTime:100
    indx(i).list = find([traj.endID]==i);
    if ~isempty(indx(i).list)
        for j = 1:length(indx(i).list)
            dY = traj(indx(i).list(j)).points(end,1) - y(i);
            dX = traj(indx(i).list(j)).points(end,2) - x(i);
            indx(i).poleDist(j) = sqrt(dY^2+dX^2) * pixelSize; % from pixels per frame to microns  
        end
        % debug figure- check if traj ends and pole location are correct
%         indxStr=sprintf(strg,i);
%         I = imread([dirName,fileName(1:end-7),indxStr,'.tif']);
%         figure,imshow(I,[]);
%         hold on
%         for j = 1:length(indx(i).list)
%             plot(traj(indx(i).list(j)).points(end,1),traj(indx(i).list(j)).points(end,2),'r*') % WHY ARE X AND Y SWAPED?
%             plot([traj(indx(i).list(j)).points(end,1),y(i)],[traj(indx(i).list(j)).points(end,2),x(i)],'g-')
%         end
%         plot(y(i),x(i),'b*')
    end
end
distTrackEndToPole = [indx.poleDist];
hist(distTrackEndToPole)
x