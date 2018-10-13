package com.project2.controller;

import com.project2.entity.Dept;
import com.project2.entity.Position;
import com.project2.entity.UserResume;
import com.project2.service.DeptService;
import com.project2.service.PositionService;
import com.project2.service.UserResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
@RequestMapping("userResume")
public class UserResumeController {
    @Autowired
    private UserResumeService userResumeService;
    @Autowired
    private DeptService deptService;
    @Autowired
    private PositionService positionService;

    @RequestMapping("add")
    public String add(ModelMap model){
        List<Dept> depts = deptService.queryAllDept();
        List<Position> positions=null;
        for (int i=0;i<depts.size();i++){
            positions = positionService.queryPositions(depts.get(i).getName());
        }
        model.addAttribute("depts",depts);
        model.addAttribute("positions",positions);
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