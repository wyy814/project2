package com.project2.controller;

import com.project2.entity.User;
import com.project2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
@RequestMapping("user")
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("name")
    @ResponseBody
    public String name(String name){
        User user = userService.queryUserByName(name);
        if (user!=null){
            return "exist";
        }else {
            return "no";
        }
    }

    @RequestMapping("register")
    public String register(User user){
        userService.register(user);
        return "user/addUser";
    }

    @RequestMapping("login")
    public String login(User user){
        boolean login = userService.login(user);
        if (login){
            return "user/addUser";
        }
        return "forward:/login.jsp";
    }
}