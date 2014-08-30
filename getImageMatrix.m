function imageToLoad = getImageMatrix(imageFileFs,imageDir,folderName)

% We currently have six digit ID for non-ambiguous image files:
% eg. 100002
imageTag = imageFileFs(1);
switch imageTag
    case {'1','2','3'}
        imageFileNdigits = 6;
    case {'4','5','6'}
        imageFileNdigits = 5;
end
imageId = imageFileFs(1:imageFileNdigits);

imageFullFile = getLocalPath([fullfile(folderName,imageDir,imageId) '.mat']);
data = load(imageFullFile);
% Parse the ID and get the right image
childStartDigit = imageFileNdigits + 1;
available = imageFileFs(childStartDigit:end);
switch length(available)
    case 1 % only grayScale is available
        imageToLoad = data.d.originalImage.derivedImages(str2double(available(1))).cdata;
    case 2 % Gray-derived images such as ambiguous images
        imageToLoad = data.d.originalImage.derivedImages(str2double(available(1))).derivedImages(str2double(available(2))).cdata;
    case 3 % Gray-derived-derived images such as modified ambiguous images
        imageToLoad = data.d.originalImage.derivedImages(str2double(available(1))).derivedImages(str2double(available(2))).derivedImages(str2double(available(3))).cdata;
    case 4 % Gray-derived-derived-derived images such as modified ambiguous images
        imageToLoad = data.d.originalImage.derivedImages(...
            str2double(available(1))).derivedImages(str2double(available(2))).derivedImages(str2double(available(3))).derivedImages(str2double(available(4))).cdata;
end
if ~length(imageToLoad)>0, error('no image matrix in %s',imageId);end

if ~isempty(imageToLoad)
    if numel(imageToLoad)~=(300*400)
        fprintf('imageSize %s is not allowed\n',mat2str(size(imageToLoad)));
        error('Incorrect image size');
    end
    if iscell(imageToLoad)
        error('image cdata is a cell instead of a matrix');
    end
end
