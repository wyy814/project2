package com.project2.controller;

import com.alibaba.fastjson.JSON;
import com.project2.entity.*;
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
    @Autowired
    private UserService userService;
    @Autowired
    private OwnService ownService;
    @Autowired
    private DeptService deptService;
    @Autowired
    private PositionService positionService;
    @Autowired
    private TrainService trainService;
    @Autowired
    private ReAndPuService reAndPuService;

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

    /**
     * jsp--controller
     * @return
     */
    @RequestMapping("show2")
    public String show2(Model model){
        List<Back> backs = backService.queryAllBack();
        model.addAttribute("backs",backs);
        return "adm/interview";
    }

    /**
     * 查看简历,面试
     * @param rId
     * @param model
     * @return
     */
    @RequestMapping("showResume2")
    public String showResume2(Integer rId,Model model){
        UserResume userResume = userResumeService.queryResume(rId);
        model.addAttribute("userResume",userResume);
        return "adm/showResume2";
    }

    /**
     * 游客成为员工
     * @param rId
     * @return
     */
    @RequestMapping("employed")
    public String employed(Integer rId){
        UserResume userResume = userResumeService.queryResume(rId);
        userService.updateUser(userResume.getuName());
        Own own = new Own();
        own.setrId(userResume.getId());
        own.setName(userResume.getName());
        own.setSex(userResume.getSex());
        own.setAge(userResume.getAge());
        own.setEduBg(userResume.getEduBg());
        own.setPhone(userResume.getPhone());
        own.setEmail(userResume.getEmail());
        own.setDept(userResume.getDept());
        own.setPosition(userResume.getPosition());
        own.setPolitical(userResume.getPolitical());
        own.setHobby(userResume.getHobby());
        Back back = backService.queryBackByRId(rId);
        own.setInTime(back.getInTime());
        ownService.insertOwn(own);
        return "adm/base";
    }

    /**
     * 查看部门职能
     * @param model
     * @return
     */
    @RequestMapping("dept")
    public String dept(Model model){
        List<Dept> depts = deptService.queryAllDept();
        List<Position> positions=positionService.queryAllPositions();
        model.addAttribute("depts",depts);
        model.addAttribute("positions",positions);
        return "adm/dept";
    }

    /**
     * 新增部门职位
     * @param dept
     * @param positionForDept
     * @param position
     * @return
     */
    @RequestMapping("dp")
    public String dp(String dept,String positionForDept,String position){
        if (!dept.equals("")){
            Dept dept1 = new Dept();
            dept1.setName(dept);
            dept1.setdTime(new Timestamp(System.currentTimeMillis()));
            deptService.addDept(dept1);
        }
        if ((!positionForDept.equals(""))&&(!position.equals(""))){
            Position position1 = new Position();
            position1.setName(position);
            position1.setdName(positionForDept);
            position1.setpTime(new Timestamp(System.currentTimeMillis()));
            positionService.addPosition(position1);
        }
        return "adm/base";
    }

    /**
     * 删除部门
     * @param dept
     * @return
     */
    @RequestMapping("deleteDept")
    @ResponseBody
    public String deleteDept(String dept){
        List<Own> owns = ownService.queryOwnByDept(dept);
        if (owns.size()==0){
            deptService.deleteDept(dept);
            return "ok";
        }else {
            return "no";
        }
    }

    /**
     * 删除职位
     * @param dept
     * @param position
     * @return
     */
    @RequestMapping("deletePosition")
    @ResponseBody
    public String deletePosition(String dept,String position){
        List<Own> owns = ownService.queryOwnByPosition(dept,position);
        if (owns.size()==0){
            positionService.deletePosition(dept,position);
            return "ok";
        }else {
            return "no";
        }
    }

    /**
     * 查看培训
     * @param model
     * @return
     */
    @RequestMapping("train")
    public String train(Model model){
        List<Train> trains = trainService.queryAllTrain();
        List<Dept> depts = deptService.queryAllDept();
        model.addAttribute("trains",trains);
        model.addAttribute("depts",depts);
        return "adm/train";
    }

    /**
     * 增加培训项目
     * @param train
     * @return
     */
    @RequestMapping("add")
    public String add(Train train){
        trainService.insertTrain(train);
        return "adm/base";
    }

    /**
     * 编辑培训项目
     * @param id
     * @return
     */
    @RequestMapping("edit")
    public String edit(Integer id,Model model){
        Train train = trainService.queryTrainById(id);
        List<Dept> depts = deptService.queryAllDept();
        model.addAttribute("train",train);
        model.addAttribute("depts",depts);
        return "adm/edit";
    }

    /**
     * 更改培训项目
     * @param train
     * @return
     */
    @RequestMapping("update")
    public String update(Train train){
        trainService.updateTrain(train);
        return "adm/base";
    }

    /**
     * jsp--controller
     * @return
     */
    @RequestMapping("own")
    public String own(Model model){
        List<Own> owns = ownService.queryOwnByState("在职");
        model.addAttribute("owns",owns);
        return "adm/emp";
    }

    /**
     * 调动部门职位
     * @param rId
     * @param model
     * @return
     */
    @RequestMapping("move")
    public String move(Integer rId,Model model){
        List<Dept> depts = deptService.queryAllDept();
        List<Position> positions=positionService.queryAllPositions();
        model.addAttribute("depts",depts);
        model.addAttribute("positions",positions);
        Own own = ownService.queryOwn(rId);
        model.addAttribute("own",own);
        return "adm/move";
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
     * 人事调动
     * @param rId
     * @param dept
     * @param position
     * @return
     */
    @RequestMapping("updateDp")
    public String updateDp(Integer rId,String dept,String position){
        ownService.updateOwnDp(rId, dept, position);
        return "adm/base";
    }

    /**
     * 开除员工
     * @param rId
     * @return
     */
    @RequestMapping("deleteOwn")
    @ResponseBody
    public String deleteOwn(Integer rId){
        ownService.updateOwnByRId(rId);
        return "ok";
    }

    /**
     * 查看离职人员
     * @param model
     * @return
     */
    @RequestMapping("see")
    public String see(Model model){
        List<Own> owns = ownService.queryOwnByState("离职");
        model.addAttribute("owns",owns);
        return "adm/leave";
    }

    /**
     * 奖惩员工
     * @param rId
     * @param model
     * @return
     */
    @RequestMapping("name")
    public String name(Integer rId,Model model){
        Own own = ownService.queryOwn(rId);
        model.addAttribute("own",own);
        return "adm/up";
    }

    /**
     * 增加奖惩
     * @param reAndPu
     * @return
     */
    @RequestMapping("up")
    public String up(ReAndPu reAndPu){
        reAndPuService.insertReAndPu(reAndPu);
        return "adm/base";
    }

    /**
     * 管理员查看奖惩
     * @param model
     * @return
     */
    @RequestMapping("ud")
    public String ud(Model model){
        List<ReAndPu> reAndPus = reAndPuService.queryAllReAndPu();
        model.addAttribute("reAndPus",reAndPus);
        return "adm/ud";
    }

    @InitBinder
    public void initBinder(ServletRequestDataBinder binder){
        binder.registerCustomEditor(Date.class,
                new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }
}