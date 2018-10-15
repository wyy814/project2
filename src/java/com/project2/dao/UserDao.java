package com.project2.dao;

import com.project2.entity.User;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Administrator on 2018/10/11 0011.
 */
public interface UserDao {
    void insertUser(User user);
    void updateUser(User user);
    void updatePassword(@Param("name") String name, @Param("password") String password);
    User queryUserByName(String name);
    User queryUser(User user);
}