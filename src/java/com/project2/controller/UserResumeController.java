package com.project2.controller;

import com.project2.entity.UserResume;
import com.project2.service.UserResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
@RequestMapping("userResume")
public class UserResumeController {
    @Autowired
    private UserResumeService userResumeService;

    @RequestMapping("add")
    public String add(){

        return "addUser";
    }

    @RequestMapping("insert")
    public String insert(UserResume userResume){
        userResumeService.addResume(userResume);
        return "user/base";
    }

    @RequestMapping("edit")
    public String edit(int id,ModelMap model){
        UserResume userResume = userResumeService.queryResume(id);
        model.addAttribute("userResume",userResume);
        return "update";
    }

    @RequestMapping("update")
    public String update(UserResume userResume){
        userResumeService.updateResume(userResume);
        return "user/base";
    }
}