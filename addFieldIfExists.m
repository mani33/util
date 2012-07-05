function targetStruct = addFieldIfExists(targetStruct,sourceStruct,sourceFieldName,targetFieldName)

if nargin < 4
    targetFieldName = sourceFieldName;
end
if isfield(sourceStruct,sourceFieldName)
    targetStruct.(targetFieldName) = sourceStruct.(sourceFieldName);
end