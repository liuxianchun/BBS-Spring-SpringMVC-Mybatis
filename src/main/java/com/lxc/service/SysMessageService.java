package com.lxc.service;

import org.springframework.stereotype.Repository;

@Repository
public interface SysMessageService {
    public String getSysMessage(int messageid);
}
