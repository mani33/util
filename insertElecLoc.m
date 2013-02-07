function insertElecLoc(sessKeys)
% Populate the manual table sess.ElecLoc

nSess = length(sessKeys);
ref(1).sub_id = 4;
ref(1).session_datetime = '2012-01-27 12:52:08';
ref(2).sub_id = 5;
ref(2).session_datetime = '2012-01-26 13:07:28';

for iSess = 1:nSess
    % Get the last session and copy the electrode location to new sessions, assuming the
    % electrodes have not moved to a different location.
    key = sessKeys(iSess);
    if count(sess.ElecLoc(key))==0
        ref_sess_datetime = ref([ref.sub_id]==key.subject_id).session_datetime;
        ad = fetch(sess.ElecLoc(sprintf('session_datetime="%s"',ref_sess_datetime)),'*');
        elec = [ad.electrode_num];
        sessElec = fetchn(detect.Electrodes(key),'electrode_num');
        nElec = length(sessElec);
        
        tuple = util.tabcol(sess.ElecLoc);
        tuple.subject_id = key.subject_id;
        tuple.setup = key.setup;
        tuple.session_start_time = key.session_start_time;
        tuple.ephys_start_time = fetch1(acq.Ephys(key),'ephys_start_time');
        tuple.hemisphere = 'left';
        tuple.session_datetime = fetch1(acq.Sessions(key),'session_datetime');
        
        for iElec = 1:nElec
            elec_num = sessElec(iElec);
            sd = ad(elec==elec_num);
            % update fields
            tuple.electrode_num = elec_num;
            tuple.vis_area_num = sd.vis_area_num;
            insert(sess.ElecLoc,tuple)
        end
    end
end


