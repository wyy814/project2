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
import java.util.ArrayList;
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
    @Autowired
    private CardService cardService;
    @Autowired
    private GradeService gradeService;
    @Autowired
    private SalaryService salaryService;

    /**
     * ����Ա���������Ƿ���ȷ
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
     * ����Ա��¼
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
     * �鿴����
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
     * ɾ��Ͷ����Ϣ
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
     * ����֪ͨ
     * @param rId
     * @param inTime
     * @return
     */
    @RequestMapping("time")
    public String time(Integer rId,Date inTime){
        Apply apply = applyService.queryApplyByRId(rId);
        applyService.updateApplyInState(apply.getId());
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
     * �鿴����,����
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
     * �οͳ�ΪԱ��
     * @param rId
     * @return
     */
    @RequestMapping("employed")
    public String employed(Integer rId){
        backService.updateBackIn(rId);
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
     * �鿴����ְ��
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
     * ��������ְλ
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
     * ɾ������
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
     * ɾ��ְλ
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
     * �鿴��ѵ
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
     * ������ѵ��Ŀ
     * @param train
     * @return
     */
    @RequestMapping("add")
    public String add(Train train){
        trainService.insertTrain(train);
        return "adm/base";
    }

    /**
     * �༭��ѵ��Ŀ
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
     * ������ѵ��Ŀ
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
        List<Own> owns = ownService.queryOwnByState("��ְ");
        model.addAttribute("owns",owns);
        return "adm/emp";
    }

    /**
     * ��������ְλ
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
     * ��������
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
     * ���µ���
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
     * ����Ա��
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
     * �鿴��ְ��Ա
     * @param model
     * @return
     */
    @RequestMapping("see")
    public String see(Model model){
        List<Own> owns = ownService.queryOwnByState("��ְ");
        model.addAttribute("owns",owns);
        return "adm/leave";
    }

    /**
     * ����Ա��
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
     * ���ӽ���
     * @param reAndPu
     * @return
     */
    @RequestMapping("up")
    public String up(ReAndPu reAndPu){
        reAndPuService.insertReAndPu(reAndPu);
        return "adm/base";
    }

    /**
     * ����Ա�鿴����
     * @param model
     * @return
     */
    @RequestMapping("ud")
    public String ud(Model model){
        List<ReAndPu> reAndPus = reAndPuService.queryAllReAndPu();
        model.addAttribute("reAndPus",reAndPus);
        return "adm/ud";
    }

    /**
     * ����Ա�鿴Ա������
     * @param rId
     * @param model
     * @return
     */
    @RequestMapping("card")
    public String card(Integer rId,Model model){
        List<Card> cards = cardService.queryCardByRId(rId);
        model.addAttribute("cards",cards);
        return "adm/card";
    }

    /**
     * ��Ч
     * @param model
     * @return
     */
    @RequestMapping("grade")
    public String grade(Model model){
        List<Own> owns = ownService.queryOwnByState("��ְ");
        model.addAttribute("owns",owns);
        return "adm/grade";
    }

    /**
     * ������Ч
     * @param rId
     * @param grade
     * @return
     */
    @RequestMapping("in")
    @ResponseBody
    public String in(Integer rId,Integer grade){
        Own own = ownService.queryOwn(rId);
        Grade grade1 = new Grade();
        grade1.setrId(own.getrId());
        grade1.setName(own.getName());
        grade1.setDept(own.getDept());
        grade1.setPosition(own.getPosition());
        grade1.setGrade(grade);
        gradeService.insertGrade(grade1);
        return "ok";
    }

    /**
     * ���Ź���
     * @param rId
     * @return
     */
    @RequestMapping("salary")
    @ResponseBody
    public String salary(Integer rId){
        List<ReAndPu> reAndPus = reAndPuService.queryReAndPuById(rId);
        int num = 0;
        if (reAndPus.size()!=0){
            for (int i=0;i<reAndPus.size();i++){
                num += reAndPus.get(i).getNum();
            }
        }
        Grade grade = gradeService.queryGradeByRId(rId);
        List<Card> cards = cardService.queryCardByRId(rId);
        int index = 0;
        if (cards.size()!=0){
            int i=0;
            while (i<cards.size()){
                if (cards.get(i).getYnLate().equals("�ٵ�")&&cards.get(i).getYnLeave().equals("����")){
                    index = index+8;
                }else if (cards.get(i).getYnLate().equals("�ٵ�")||cards.get(i).getYnLeave().equals("����")){
                    index = index+1;
                }
                i++;
            }
        }
        Salary salary = new Salary();
        salary.setId(rId);
        salary.setRpSalary(num);
        salary.setpSalary(grade.getGrade());
        salary.setsSalary(-1500);//�籣
        salary.setbSalary(cards.size()*800-index*100);
        salary.setTime(new Date(System.currentTimeMillis()));
        salaryService.insertSalary(salary);
        return "ok";
    }

    /**
     * �鿴��������
     * @param model
     * @return
     */
    @RequestMapping("money")
    public String money(Model model){
        List<Salary> salaries = salaryService.queryAllSalary();
        model.addAttribute("salaries",salaries);
        return "adm/salary";
    }

    /**
     * ��������
     * @param model
     * @return
     */
    @RequestMapping("wrong")
    public String wrong(Model model){
        List<Salary> salaries = new ArrayList<>();
        List<Salary> salaries1 = salaryService.queryAllSalary();
        int i = 0;
        while (i<salaries1.size()){
            if (!salaries1.get(i).getRec().equals("��")){
                salaries.add(salaries1.get(i));
            }
            i++;
        }
        model.addAttribute("salaries",salaries);
        return "adm/rec";
    }

    /**
     * ���ع�������
     * @param id
     * @return
     */
    @RequestMapping("back")
    public String back(Integer id){
        salaryService.updateSalary(id,"��");
        return "adm/base";
    }

    @InitBinder
    public void initBinder(ServletRequestDataBinder binder){
        binder.registerCustomEditor(Date.class,
                new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }
}