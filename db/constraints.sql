
alter table platform
    add unique(name);

alter table app
    add unique(name);

alter table app_version
    add unique(appid, platformid, version_num);

-- alter table category
--     add unique langID (lang, orderID);

-- alter table forum
--     add unique orderID (orderID, category);

-- alter table post
--     add fulltext content (content);
    
alter table user
    add unique(email_addr),
    add unique(authenticator),
    add index ind_tid (teamid),
    add index user_tot (total_credit desc),
    add index user_avg (expavg_credit desc),
    add unique user_seti_inx (seti_id);

alter table team
    add unique(name),
    add index team_avg (expavg_credit desc),
    add index team_tot (total_credit desc),
    add unique team_seti_inx (seti_id);

alter table workunit
    add unique(name),
    add index wu_val (appid, need_validate),
    add index wu_timeout (transition_time),
    add index wu_filedel (file_delete_state),
    add index wu_assim (appid, assimilate_state);

alter table result
    add unique(name),
    add index res_wuid (workunitid),
    add index ind_res_st (server_state, random),
    add index res_filedel (file_delete_state),
    add index res_hostid (hostid),
    add index res_wu_user (workunitid, userid),
    add index received_time (received_time);

alter table host
    add index host_user (userid),
    add index host_avg (expavg_credit desc),
    add index host_tot (total_credit desc);

alter table profile
    add unique profile_userid(userid);
