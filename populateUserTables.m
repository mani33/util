function populateUserTables(sessKeys,varargin)
% populateUserTables(sessKeys,param1,paramVal1,param2,paramVal2,...)
%-----------------------------------------------------------------------------------------
% POPULATEUSERTABLES - Populate basic tables of user_schemas - mainly DotMapping and
% FlePhysEffExperiment related tables.
%
% example: [fk,es] = populateUserTables(sessKeys)
%
% This function is called by:
% This function calls:
% MAT-files required:
%
% See also: util.populateLibTables

% Author: Mani Subramaniyan
% Date created: 2012-07-06
% Last revision: 2012-07-06
% Created in Matlab version: 7.14.0.739 (R2012a)
%-----------------------------------------------------------------------------------------
populate(stim.PixPerDeg,sessKeys)
populate(stim.RefreshPeriod,sessKeys)

populate(fle.TrialGroup,sessKeys)
populate(fle.SpikeSets,sessKeys)
populate(fle.StimCenProxCond,sessKeys)
populate(fle.BinnedSpikeSets,sessKeys)
populate(fle.BarRf,sessKeys)

populate(rf.TrialGroup,sessKeys)
populate(rf.SpikeSets,sessKeys)
populate(rf.MapSets,sessKeys)







