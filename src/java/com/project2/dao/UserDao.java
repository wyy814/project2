package com.project2.dao;

import com.project2.entity.User;

/**
 * Created by Administrator on 2018/10/11 0011.
 */
public interface UserDao {
    void insertUser(User user);
    void updateUser(User user);
    User queryUserByName(String name);
    User queryUser(User user);
}