function c = getConditions(key)

 c = fetchn(stimulation.StimConditions(key,'condition_num > 0'),'condition_info');
 c = [c{:}];