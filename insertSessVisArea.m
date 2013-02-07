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
        key = fleStimSessKeys(iSess);
        if count(sess.VisArea(key))==0
            tuple = fetch(acq.Sessions(key));
            if const(iSess).bar_size_y < 140
                tuple.vis_area_num = 1;
            else
                tuple.vis_area_num = 2;
            end
            insert(sess.VisArea,tuple);
        end
    end
end