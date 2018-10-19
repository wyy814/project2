package com.project2.controller;

import com.alibaba.fastjson.JSON;
import com.project2.entity.*;
import com.project2.entity.Card;
import com.project2.service.*;
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
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by Administrator on 2018/10/16 0016.
 */
@RequestMapping("emp")
@Controller
public class EmpController {
    @Autowired
    private UserResumeService userResumeService;
    @Autowired
    private OwnService ownService;
    @Autowired
    private DeptService deptService;
    @Autowired
    private PositionService positionService;
    @Autowired
    private ReAndPuService reAndPuService;
    @Autowired
    private CardService cardService;

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

    /**
     * 查看奖惩
     * @param session
     * @return
     */
    @RequestMapping("ud")
    public String ud(HttpSession session,Model model){
        User user = (User) session.getAttribute("user");
        UserResume userResume = userResumeService.queryResumeByUName(user.getName());
        List<ReAndPu> reAndPus = reAndPuService.queryReAndPuById(userResume.getId());
        model.addAttribute("reAndPus",reAndPus);
        return "emp/ud";
    }

    /**
     * 上班打卡
     * @param name
     * @return
     * @throws ParseException
     */
    @RequestMapping("up")
    @ResponseBody
    public String up(String name) throws ParseException {
        UserResume userResume = userResumeService.queryResumeByUName(name);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Card card = new Card();
        card.setrId(userResume.getId());
        card.setuTime(timestamp);
        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
        if (timestamp.compareTo(format.parse("09:00:00"))>0){
            System.out.println(format.parse("09:00:00"));
            System.out.println(timestamp.compareTo(format.parse("09:00:00")));
            card.setYnLate("否");
            cardService.insertCard(card);
        }else {
            card.setYnLate("迟到");
            cardService.insertCard(card);
        }
        return "ok";
    }

    /**
     * 下班打卡
     * @param name
     * @return
     * @throws ParseException
     */

    @RequestMapping("down")
    @ResponseBody
    public String down(String name) throws ParseException {
        UserResume userResume = userResumeService.queryResumeByUName(name);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Card card = new Card();
        card.setrId(userResume.getId());
        card.setuTime(timestamp);
        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
        if (timestamp.compareTo(format.parse("18:00:00"))>0){
            System.out.println(format.parse("18:00:00"));
            System.out.println(timestamp.compareTo(format.parse("18:00:00")));
            card.setYnLate("否");
            cardService.insertCard(card);
        }else {
            card.setYnLate("早退");
            cardService.insertCard(card);
        }
        return "ok";
    }

    @InitBinder
    public void initBinder(ServletRequestDataBinder binder){
        binder.registerCustomEditor(Date.class,
                new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }

    @InitBinder
    public void initBinder2(ServletRequestDataBinder binder){
        binder.registerCustomEditor(Date.class,
                new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
    }
}