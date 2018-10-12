package com.project2.controller;

import com.project2.entity.User;
import com.project2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
@RequestMapping("user")
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("register")
    public String register(User user){
        userService.register(user);
        return "addEmployee";
    }
}