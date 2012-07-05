function varargout = getConstantParams(key,varargin)
% Gets constant param(s) from stimulation.StimTrialGroup table for a single key.
% example: [val1, val2, ...] = getConstantParams(key,param1,param2,...);
%           allConstParamsStruct = getConstantParams(key);
% MS 2012-02-04

reqParams = varargin;
p = fetch1(stimulation.StimTrialGroup(key),'stim_constants');
if numel(reqParams)==0
    varargout{1} = p;
    return;
end
validParams = fieldnames(p);

% Check if given params are valid

mem = ismember(reqParams,validParams);
nonMem = reqParams(~mem);
ivp = sprintf(',%s',nonMem{:});
assert(numel(nonMem)==0, [ivp(2:end) 'were not valid']);

nParams = numel(reqParams);
varargout = cell(1,nParams);
for iParam = 1:nParams
    varargout{iParam} = p.(varargin{iParam});
end

