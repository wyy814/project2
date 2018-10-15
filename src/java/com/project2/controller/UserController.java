package com.project2.controller;

import com.alibaba.fastjson.JSON;
import com.project2.entity.Dept;
import com.project2.entity.Position;
import com.project2.entity.User;
import com.project2.entity.UserResume;
import com.project2.service.DeptService;
import com.project2.service.PositionService;
import com.project2.service.UserResumeService;
import com.project2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
@RequestMapping("user")
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserResumeService userResumeService;
    @Autowired
    private DeptService deptService;
    @Autowired
    private PositionService positionService;

    /**
     * 用户名是否存在
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
     * 用户名和密码是否正确
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
     * 用户登录
     * @return
     */
    @RequestMapping("login2")
    public String login2(String name, HttpSession session){
        User user = userService.queryUserByName(name);
        session.setAttribute("user",user);
        return "user/base";
    }

    /**
     * 用户注册
     * @param user
     * @return
     */
    @RequestMapping("register")
    public String register(User user){
        userService.register(user);
        return "user/base";
    }

    /**
     * jsp--controller
     * @return
     */
    @RequestMapping("addUser")
    public String addUser(HttpSession session){
        User user = (User) session.getAttribute("user");
        UserResume userResume = userResumeService.queryResumeByUName(user.getName());
        if (userResume==null){
            return "forward:add";
        }else {
            return "forward:edit";
        }
    }

    /**
     * 传入部门职位
     * @param model
     * @return
     */
    @RequestMapping("add")
    public String add(ModelMap model){
        List<Dept> depts = deptService.queryAllDept();
        List<Position> positions=positionService.queryAllPositions();
        model.addAttribute("depts",depts);
        model.addAttribute("positions",positions);
        return "user/addUser";
    }

    /**
     * 二级联动
     * @param dName
     * @return
     */
    @RequestMapping("two")
    @ResponseBody
    public String two(String dName){
        List<Position> positions=positionService.queryPositions(dName);
        String json = JSON.toJSONString(positions);
        return json;
    }

    /**
     * 添加简历
     * @param userResume
     * @return
     */
    @RequestMapping("insert")
    public String insert(UserResume userResume){
        userResumeService.addResume(userResume);
        return "user/base";
    }

    /**
     *编辑简历
     * @param model
     * @return
     */
    @RequestMapping("edit")
    public String edit(HttpSession session,ModelMap model){
        List<Dept> depts = deptService.queryAllDept();
        List<Position> positions=positionService.queryAllPositions();
        model.addAttribute("depts",depts);
        model.addAttribute("positions",positions);

        User user = (User) session.getAttribute("user");
        UserResume ur = userResumeService.queryResumeByUName(user.getName());
        UserResume userResume = userResumeService.queryResume(ur.getId());
        model.addAttribute("userResume",userResume);
        return "user/addUser";
    }

    /**
     * 修改简历
     * @param userResume
     * @return
     */
    @RequestMapping("update")
    public String update(UserResume userResume){
        userResumeService.updateResume(userResume);
        return "user/base";
    }

    /**
     * jsp--controller
     * @return
     */
    @RequestMapping("up")
    public String up(){
        return "user/password";
    }

    /**
     * 验证密码是否正确
     * @param name
     * @param password
     * @return
     */
    @RequestMapping("password")
    @ResponseBody
    public String password(String name,String password){
        User user = userService.queryUserByName(name);
        if (!user.getPassword().equals(password)){
            return "no";
        }else {
            return "yes";
        }
    }

    @RequestMapping("updatePassword")
    public String updatePassword(String name,String password){
        userService.updatePassword(name,password);
        return "user/base";
    }
}