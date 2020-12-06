package com.lxc.service.impl;

import com.lxc.dao.SysMessageDao;
import com.lxc.service.SysMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("sysMessageService")
public class SysMessageServiceImpl implements SysMessageService {

    @Resource
    private SysMessageDao dao;

    @Override
    public String getSysMessage(int messageid) {
        return dao.getSysMessage(messageid);
    }
}
