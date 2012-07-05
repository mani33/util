function c = tabcol(djtab)
%  s = util.tabcol(fle.SpikeWinParams) - gives a structure containing all the fields of
%  the given table.

x = djtab;
cf = [x.primaryKey x.nonKeyFields];
n = length(cf);
for i = 1:n
    c.(cf{i}) = [];
end
