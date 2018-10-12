package com.project2.service;

import com.project2.entity.User;

/**
 * Created by Administrator on 2018/10/11 0011.
 */
public interface UserService {
    void register(User user);
    void login(User user);
}
