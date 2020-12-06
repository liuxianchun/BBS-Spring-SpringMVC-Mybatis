package com.lxc.service.impl;

import com.lxc.dao.UserDao;
import com.lxc.entity.User;
import com.lxc.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public void saveUser(User user) {
        System.out.println("service:save user");
        userDao.saveUser(user);
    }

    @Override
    public int verifyUser(String userid, String password) {
        return userDao.verifyUser(userid,password);
    }

    @Override
    public int verifyUserId(String userid) {
        return userDao.verifyUserId(userid);
    }

    @Override
    public User findUserById(String userid) {
        return userDao.findUserById(userid);
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public void updateUserNoImg(User user) {
        userDao.updateUserNoImg(user);
    }

    @Override
    public String getImgNum() {
        return userDao.getImgNum();
    }
}
