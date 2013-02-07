function sizeInPixels = degrees2pixels(size_in_degrees,monitorDistance,monitorWidthPix,monitorWidthCm,varargin)
% function sizeInPixels = degrees2pixels(size_in_degrees,monitorDistance,monitorWidthPix,monitorWidthCm,varargin)
%-----------------------------------------------------------------------------------------
% DEGREES2PIXELS - Converts degrees to pixels.
%
% example: d = degrees2pixels([1 2 3],100,1600,41);
% This function is called by:
% This function calls:
% MAT-files required:
%
% See also: 

% Author: Mani Subramaniyan
% Date created: 2012-07-20
% Last revision: 2012-07-20
% Created in Matlab version: 7.14.0.739 (R2012a)
%-----------------------------------------------------------------------------------------

pixPerCm = monitorWidthPix ./ monitorWidthCm;
sizeInPixels = 2 * monitorDistance .* tan(size_in_degrees*pi/360) .* pixPerCm; 