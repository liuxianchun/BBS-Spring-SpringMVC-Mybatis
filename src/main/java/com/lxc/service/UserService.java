package com.lxc.service;

import com.lxc.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserService {

    void saveUser(User user);

    int verifyUser(String userid, String password);

    int verifyUserId(String userid);

    User findUserById(String userid);

    public void updateUser(User user);

    public void updateUserNoImg(User user);

    //���ͼƬ����ֵ
    public String getImgNum();

}
