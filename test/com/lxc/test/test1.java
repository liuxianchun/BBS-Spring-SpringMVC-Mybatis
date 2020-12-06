package com.lxc.test;

import com.lxc.service.SysMessageService;
import com.lxc.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class test1 {

    @Qualifier("sysMessageService")
    private SysMessageService service;
    @Autowired
    private UserService userDao;

    @Test
    public void test1(){
        String s1 = service.getSysMessage(1);
        String s2 = service.getSysMessage(2);
        System.out.println(s1+s2);
    }
    @Test
    public void test2(){
        int s1 = userDao.verifyUserId("liuxianchun");
        System.out.println(s1);
    }

}
