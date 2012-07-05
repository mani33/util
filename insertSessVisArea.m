function insertSessVisArea(fleStimSessKeys,varargin)
% insertSessVisArea(fleSessKeys,param1,paramVal1,param2,paramVal2,...)
%-----------------------------------------------------------------------------------------
% INSERTSESSVISAREA - insert tuples into the manual talbe SessVisArea.
%
% example: insertSessVisArea(fleSessKeys)
%
% This function is called by:
% This function calls:
% MAT-files required:
%
% See also:

% Author: Mani Subramaniyan
% Date created: 2012-07-04
% Last revision: 2012-07-04
% Created in Matlab version: 7.14.0.739 (R2012a)
%-----------------------------------------------------------------------------------------

args.visualAreas = [];
args = parseVarArgs(args,varargin{:});

if isempty(args.visualAreas)
    % Use bar size as a tag to decide if v1 or v2 was the focus
    const = fetch(flevbl.StimConstants(fleStimSessKeys),'*');
    nSess = length(const);
    for iSess = 1:nSess
        tuple = fetch(acq.Sessions(fleStimSessKeys(iSess)));
        if const(iSess).bar_size_y < 140
            tuple.v1 = true;
        else
            tuple.v2 = true;
        end
        insert(sess.VisArea,tuple);
    end
end