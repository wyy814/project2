package com.project2.controller;

import com.alibaba.fastjson.JSON;
import com.project2.entity.*;
import com.project2.service.DeptService;
import com.project2.service.OwnService;
import com.project2.service.PositionService;
import com.project2.service.UserResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2018/10/16 0016.
 */
@RequestMapping("emp")
@Controller
public class empController {
    @Autowired
    private UserResumeService userResumeService;
    @Autowired
    private OwnService ownService;
    @Autowired
    private DeptService deptService;
    @Autowired
    private PositionService positionService;

    /**
     * 显示个人信息
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("own")
    public String own(HttpSession session, Model model){
        User user = (User) session.getAttribute("user");
        UserResume userResume = userResumeService.queryResumeByUName(user.getName());
        Own own = ownService.queryOwn(userResume.getId());
        model.addAttribute("own",own);
        return "emp/own";
    }

    /**
     * 修改个人信息
     * @param own
     * @return
     */
    @RequestMapping("update")
    public String update(Own own){
        ownService.updateOwn(own);
        return "emp/base";
    }

    /**
     * 查看部门职位
     * @param model
     * @return
     */
    @RequestMapping("see")
    public String see(Model model){
        List<Dept> depts = deptService.queryAllDept();
        List<Position> positions=positionService.queryAllPositions();
        model.addAttribute("depts",depts);
        model.addAttribute("positions",positions);
        return "emp/see";
    }

    /**
     * 联动
     * @param dName
     * @return
     */
    @RequestMapping("dept")
    @ResponseBody
    public String dept(String dName){
        List<Position> positions=positionService.queryPositions(dName);
        String json = JSON.toJSONString(positions);
        return json;
    }


}