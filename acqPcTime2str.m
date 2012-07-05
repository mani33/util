function ts = acqPcTime2str(pctimeMsec,dateFormat)

if nargin < 2
    dateFormat = 'yyyy-mm-dd';
end

ts = datestr((pctimeMsec/(1000*60*60*24) + datenum(1904,01,01)),dateFormat);