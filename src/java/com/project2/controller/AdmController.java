package com.project2.controller;

import com.project2.entity.Adm;
import com.project2.entity.Apply;
import com.project2.entity.Back;
import com.project2.entity.UserResume;
import com.project2.service.AdmService;
import com.project2.service.ApplyService;
import com.project2.service.BackService;
import com.project2.service.UserResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
@RequestMapping("adm")
@Controller
public class AdmController {
    @Autowired
    private AdmService admService;
    @Autowired
    private ApplyService applyService;
    @Autowired
    private UserResumeService userResumeService;
    @Autowired
    private BackService backService;

    /**
     * 管理员名和密码是否正确
     * @param adm
     * @return
     */
    @RequestMapping("login")
    @ResponseBody
    public String login(Adm adm){
        Adm adm1 = admService.queryAdm(adm);
        if (adm1!=null){
            return "true";
        }else {
            return "false";
        }
    }

    /**
     * 管理员登录
     * @return
     */
    @RequestMapping("login2")
    public String login2(Adm adm, HttpSession session){
        session.setAttribute("adm",adm);
        return "adm/base";
    }

    /**
     * jsp--controller
     * @return
     */
    @RequestMapping("show1")
    public String show1(Model model){
        List<Apply> applies = applyService.queryAllApplys();
        model.addAttribute("applies",applies);
        return "adm/apply";
    }

    /**
     * 查看简历
     * @param rId
     * @param model
     * @return
     */
    @RequestMapping("showResume")
    public String showResume(Integer rId,Model model){
        Apply apply = applyService.queryApplyByRId(rId);
        applyService.updateApplyCState(apply.getId());
        UserResume userResume = userResumeService.queryResume(rId);
        model.addAttribute("userResume",userResume);
        return "adm/showResume";
    }

    /**
     * 删除投递信息
     * @param id
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public String delete(Integer id){
        applyService.deleteApply(id);
        return "ok";
    }

    /**
     * 面试通知
     * @param rId
     * @param inTime
     * @return
     */
    @RequestMapping("time")
    public String time(Integer rId,Date inTime){
        Apply apply = applyService.queryApplyByRId(rId);
        Back back = new Back();
        back.setrId(rId);
        back.settTime(apply.getdTime());
        back.setInTime(inTime);
        backService.insertBack(back);
        return "adm/base";
    }

    @InitBinder
    public void initBinder(ServletRequestDataBinder binder){
        binder.registerCustomEditor(Date.class,
                new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }
}