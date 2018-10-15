package com.project2.entity;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
public class UserResume {
    private Integer id;
    private String name;
    private String sex;
    private Integer age;
    private String eduBg;//学历
    private String phone;//联系方式
    private String email;
    private String dept;//应聘部门
    private String position;//应聘职位
    private String political;//政治面貌
    private String onJob;//上份工作
    private String workExp;//工作经验
    private String salary;//期望薪水
    private String hobby;//兴趣爱好
    private String uName;//用户名

    public UserResume() {
    }

    public UserResume(Integer id, String name, String sex, Integer age, String eduBg, String phone, String email, String dept, String position, String political, String onJob, String workExp, String salary, String hobby, String uName) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.eduBg = eduBg;
        this.phone = phone;
        this.email = email;
        this.dept = dept;
        this.position = position;
        this.political = political;
        this.onJob = onJob;
        this.workExp = workExp;
        this.salary = salary;
        this.hobby = hobby;
        this.uName = uName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getEduBg() {
        return eduBg;
    }

    public void setEduBg(String eduBg) {
        this.eduBg = eduBg;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPolitical() {
        return political;
    }

    public void setPolitical(String political) {
        this.political = political;
    }

    public String getOnJob() {
        return onJob;
    }

    public void setOnJob(String onJob) {
        this.onJob = onJob;
    }

    public String getWorkExp() {
        return workExp;
    }

    public void setWorkExp(String workExp) {
        this.workExp = workExp;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    @Override
    public String toString() {
        return "UserResume{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", eduBg='" + eduBg + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", dept='" + dept + '\'' +
                ", position='" + position + '\'' +
                ", political='" + political + '\'' +
                ", onJob='" + onJob + '\'' +
                ", workExp='" + workExp + '\'' +
                ", salary='" + salary + '\'' +
                ", hobby='" + hobby + '\'' +
                ", uName='" + uName + '\'' +
                '}';
    }
}