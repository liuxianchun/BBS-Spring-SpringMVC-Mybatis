package com.lxc.dao;

import com.lxc.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

    @Insert("insert into user(userid,password,phone,email,birthday,gender,registertime) values(#{userid},#{password},#{phone},#{email},#{birthday},#{gender},now())")
    public void saveUser(User user);

    @Select("select count(*) from user where userid=#{userid} and password=#{password}")
    public int verifyUser(@Param("userid") String userid, @Param("password") String password);

    @Select("select count(*) from user where userid=#{userid}")
    public int verifyUserId(String userid);

    @Select("select * from user where userid=#{userid}")
    public User findUserById(String userid);

    @Update("update user set phone=#{phone},email=#{email},birthday=#{birthday},gender=#{gender},image=#{image} where userid=#{userid}")
    public void updateUser(User user);

    @Update("update user set phone=#{phone},email=#{email},birthday=#{birthday},gender=#{gender} where userid=#{userid}")
    public void updateUserNoImg(User user);

    @Select("select get_trans_num('img')")
    public String getImgNum();
}
