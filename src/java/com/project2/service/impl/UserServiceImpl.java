package com.project2.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project2.dao.UserDao;
import com.project2.entity.User;
import com.project2.service.UserService;

/**
 * Created by Administrator on 2018/10/11 0011.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User queryUserByName(String name) {
        return userDao.queryUserByName(name);
    }

    public void register(User user) {
        User user1 = userDao.queryUserByName(user.getName());
        if (user1==null){
            userDao.insertUser(user);
        }
    }

    public boolean login(User user) {
        User user1 = userDao.queryUser(user);
        return user1!=null;
    }

    @Override
    public void updatePassword(String name, String password) {
        userDao.updatePassword(name,password);
    }
}