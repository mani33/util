function s = addFieldIfNotNan(s,fieldName,fieldValue)

if ~isnan(fieldValue)
    s.(fieldName) = fieldValue;
end