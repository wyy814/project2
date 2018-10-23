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
import java.util.Calendar;
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
    @Autowired
    private SalaryService salaryService;

    /**
     * 显示个人信息
     * @param name
     * @param model
     * @return
     */
    @RequestMapping("own")
    public String own(String name,Model model){
        UserResume userResume = userResumeService.queryResumeByUName(name);
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
     * @param name
     * @param model
     * @return
     */
    @RequestMapping("ud")
    public String ud(String name,Model model){
        UserResume userResume = userResumeService.queryResumeByUName(name);
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
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);//获取年份
        int month=cal.get(Calendar.MONTH)+1;//获取月份
        int day=cal.get(Calendar.DATE);//获取日
        UserResume userResume = userResumeService.queryResumeByUName(name);
        List<Card> cards = cardService.queryCardByRId(userResume.getId());
        int index = 0;
        if (cards.size()!=0){
            for (int i=0;i<cards.size();i++){
                if (day<10){
                    while (cards.get(i).getuTime().toString().substring(0,10).equals(year+"-"+month+"-"+"0"+day)){
                        index = cards.get(i).getId();
                        break;
                    }
                }else {
                    while (cards.get(i).getuTime().toString().substring(0,10).equals(year+"-"+month+"-"+day)){
                        index = cards.get(i).getId();
                        break;
                    }
                }
            }
        }
        if (index==0){
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            Card card = new Card();
            card.setrId(userResume.getId());
            card.setuTime(timestamp);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            if (timestamp.compareTo(format.parse(year+"-"+month+"-"+day+" "+"09:00:00"))<0){
                card.setYnLate("否");
                cardService.insertCard(card);
            }else if(timestamp.compareTo(format.parse(year+"-"+month+"-"+day+" "+"12:00:00"))>0){
                card.setYnLate("旷工");
                cardService.insertCard(card);
            }else {
                card.setYnLate("迟到");
                cardService.insertCard(card);
            }
            return "ok";
        }
        return "no";
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
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);//获取年份
        int month=cal.get(Calendar.MONTH)+1;//获取月份
        int day=cal.get(Calendar.DATE);//获取日
        UserResume userResume = userResumeService.queryResumeByUName(name);
        List<Card> cards = cardService.queryCardByRId(userResume.getId());
        int index = 0;
        if (cards.size()!=0){
            for (int i=0;i<cards.size();i++){
                if (day<10){
                    while (cards.get(i).getuTime().toString().substring(0,10).equals(year+"-"+month+"-"+"0"+day)){
                        index = cards.get(i).getId();
                        break;
                    }
                }else {
                    while (cards.get(i).getuTime().toString().substring(0,10).equals(year+"-"+month+"-"+day)){
                        index = cards.get(i).getId();
                        break;
                    }
                }
            }
        }
        Card card = cardService.queryCardById(index);
        if (card.getdTime()==null){
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            card.setdTime(timestamp);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            if(timestamp.compareTo(format.parse(year+"-"+month+"-"+day+" "+"14:00:00"))>0&&timestamp.compareTo(format.parse(year+"-"+month+"-"+day+" "+"17:00:00"))<0){
                card.setYnLeave("早退");
                cardService.updateCard(card);
            }else if(timestamp.compareTo(format.parse(year+"-"+month+"-"+day+" "+"14:00:00"))<0){
                card.setYnLeave("旷工");
                cardService.updateCard(card);
            }else{
                card.setYnLeave("否");
                cardService.updateCard(card);
            }
            return "ok";
        }
        return "no";
    }

    /**
     * 员工查看考勤
     * @param name
     * @param model
     * @return
     */
    @RequestMapping("card")
    public String card(String name,Model model){
        UserResume userResume = userResumeService.queryResumeByUName(name);
        List<Card> cards = cardService.queryCardByRId(userResume.getId());
        model.addAttribute("cards",cards);
        return "emp/card";
    }

    /**
     * 员工查看薪资
     * @param name
     * @param model
     * @return
     */
    @RequestMapping("salary")
    public String salary(String name,Model model){
        UserResume userResume = userResumeService.queryResumeByUName(name);
        Salary salary = salaryService.querySalaryByRId(userResume.getId());
        model.addAttribute("salary",salary);
        return "emp/salary";
    }

    /**
     * 工资异议
     * @param id
     * @param rec
     * @return
     */
    @RequestMapping("wrong")
    @ResponseBody
    public String wrong(Integer id,String rec){
        salaryService.updateSalary(id,rec);
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