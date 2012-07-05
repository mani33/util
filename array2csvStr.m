function vs = array2csvStr(val)

if iscell(val)
    if ischar(val{1})
        v = sprintf(',"%s"',val{:});
    else
        error('only cell array of strings is supported');
    end
elseif isnumeric(val)
    v = arrayfun(@(x) sprintf(',%s',num2str(x)),val,'UniformOutput',false);
    v = [v{:}];
else
    error('unsupported input type');
end
vs = ['(' v(2:end) ')'];
