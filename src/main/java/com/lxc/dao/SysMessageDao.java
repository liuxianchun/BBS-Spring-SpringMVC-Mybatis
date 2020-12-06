package com.lxc.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface SysMessageDao {

    @Select("select message from sys_message where messageid=#{messageid}")
    public String getSysMessage(int messageid);
}
