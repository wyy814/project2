package com.project2.entity;

import java.sql.Date;

/**
 * Created by Administrator on 2018/10/16 0016.
 */
public class Own {
    private Integer rId;
    private String name;
    private String sex;
    private Integer age;
    private String eduBg;//学历
    private String phone;//联系方式
    private String email;
    private String dept;//部门
    private String position;//职位
    private String political;//政治面貌
    private Date inTime;//入职时间
    private String hobby;//兴趣爱好

    public Own() {
    }

    public Own(Integer rId, String name, String sex, Integer age, String eduBg, String phone, String email, String dept, String position, String political, Date inTime, String hobby) {
        this.rId = rId;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.eduBg = eduBg;
        this.phone = phone;
        this.email = email;
        this.dept = dept;
        this.position = position;
        this.political = political;
        this.inTime = inTime;
        this.hobby = hobby;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
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

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
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

    public Date getInTime() {
        return inTime;
    }

    public void setInTime(Date inTime) {
        this.inTime = inTime;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    @Override
    public String toString() {
        return "Own{" +
                "rId=" + rId +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", eduBg='" + eduBg + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", dept='" + dept + '\'' +
                ", position='" + position + '\'' +
                ", political='" + political + '\'' +
                ", inTime=" + inTime +
                ", hobby='" + hobby + '\'' +
                '}';
    }
}