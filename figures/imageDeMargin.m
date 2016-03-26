%%  Image DeMargin
%   This file deletes the blank margins of all images that is in the same
%   folder. 

%   Author: Quan Wang, 02/22/2011
%   Email: wangq10@rpi.edu
%   Copyright (c) 2011 by Quan Wang
%   Signal Analysis and Machine Perception Laboratory (SAMPL)
%   ECSE, Rensselaer Polytechnic Institute 

clear;
clc;
files=dir;
for i=1:max(size(files))
    fname=files(i).name;
    if size(fname,2)-3>0
        ftype=fname(size(fname,2)-3:size(fname,2));
    else
        ftype='.';
    end
    ftype=lower(ftype);
    if strcmp(ftype,'.jpg')||strcmp(ftype,'.png')...
            ||strcmp(ftype,'.bmp')||strcmp(ftype,'.tif')
        im=imread(fname);
        if size(size(im),2)==2
            
            S=255-im(1:2,:);
            while sum(S(:))<1
                im=im(2:size(im,1),:);
                S=255-im(1:2,:);
            end
            
            S=255-im(:,1:2);
            while sum(S(:))<1
                im=im(:,2:size(im,2));
                S=255-im(:,1:2);
            end
            
            S=255-im(size(im,1)-1:size(im,1),:);
            while sum(S(:))<1
                im=im(1:size(im,1)-1,:);
                S=255-im(size(im,1)-1:size(im,1),:);
            end
            
            S=255-im(:,size(im,2)-1:size(im,2));
            while sum(S(:))<1
                im=im(:,1:size(im,2)-1);
                S=255-im(:,size(im,2)-1:size(im,2));
            end
            imwrite(im,fname);
        
        elseif size(size(im),2)==3
            
            S=255-im(1:2,:,:);
            while sum(S(:))<1
                im=im(2:size(im,1),:,:);
                S=255-im(1:2,:,:);
            end
            
            S=255-im(:,1:2,:);
            while sum(S(:))<1
                im=im(:,2:size(im,2),:);
                S=255-im(:,1:2,:);
            end
            
            S=255-im(size(im,1)-1:size(im,1),:,:);
            while sum(S(:))<1
                im=im(1:size(im,1)-1,:,:);
                S=255-im(size(im,1)-1:size(im,1),:,:);
            end
            
            S=255-im(:,size(im,2)-1:size(im,2),:);
            while sum(S(:))<1
                im=im(:,1:size(im,2)-1,:);
                S=255-im(:,size(im,2)-1:size(im,2),:);
            end
            imwrite(im,fname);
            
        end
    end
end
        