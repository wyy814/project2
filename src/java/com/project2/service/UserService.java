package com.project2.service;

import com.project2.entity.User;

/**
 * Created by Administrator on 2018/10/11 0011.
 */
public interface UserService {
    User queryUserByName(String name);
    void register(User user);
    boolean login(User user);
    void updatePassword(String name,String password);
}
