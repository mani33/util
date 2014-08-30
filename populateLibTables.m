function [fk es] = populateLibTables(sessKey)

dp = fetch(detect.Params(sessKey) * sort.Methods('sort_method_name=''MultiUnit'''),'sort_method_num');
%%
inserti(sort.Params,dp)
spkey = dp;
%% now populate sort.Sets table
populate(sort.Sets,spkey)

%% Populate sort.MultiUnit
populate(sort.MultiUnit,spkey)
%%
populate(sort.SetsCompleted,spkey)

%% populate ephys.SpikeSet which will populate ephys.Spikes
populate(ephys.SpikeSet,spkey)
%%
stimSessKeys = fetch((acq.Stimulation - acq.StimulationIgnore) & ...
    (acq.Sessions(sessKey)-acq.SessionsIgnore));
%%
[fk es] = populate(stimulation.StimTrialGroup,stimSessKeys);
