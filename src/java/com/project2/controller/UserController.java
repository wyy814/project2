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

    /**
     * �û����Ƿ����
     * @param name
     * @return
     */
    @RequestMapping("name")
    @ResponseBody
    public String name(String name){
        User user = userService.queryUserByName(name);
        if (user==null){
            return "no";
        }else {
            return "yes";
        }
    }

    /**
     * �û����������Ƿ���ȷ
     * @param user
     * @return
     */
    @RequestMapping("login")
    @ResponseBody
    public String login(User user){
        boolean login = userService.login(user);
        if (login){
            return "true";
        }else {
            return "false";
        }
    }

    /**
     * �û���¼
     * @return
     */
    @RequestMapping("login2")
    public String login2(){
        return "user/base";
    }

    /**
     * �û�ע��
     * @param user
     * @return
     */
    @RequestMapping("register")
    public String register(User user){
        userService.register(user);
        return "user/base";
    }
}