function [mcv,ind] = most_common_val(v)
% Find the most common value of the given vector
% MS 2014-08-28
uv = unique(v);
[vv,ind] = histc(v,uv);
mvi = find(vv==max(vv));
ind = ind==mvi;
mcv = uv(mvi);

