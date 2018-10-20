package com.project2.entity;

/**
 * Created by Administrator on 2018/10/19 0019.
 */
public class Grade {
    private Integer rId;
    private String name;
    private String dept;
    private String position;
    private Integer grade;//¼¨Ð§½±½ð

    public Grade() {
    }

    public Grade(Integer rId, String name, String dept, String position, Integer grade) {
        this.rId = rId;
        this.name = name;
        this.dept = dept;
        this.position = position;
        this.grade = grade;
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

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "Grade{" +
                "rId=" + rId +
                ", name='" + name + '\'' +
                ", dept='" + dept + '\'' +
                ", position='" + position + '\'' +
                ", grade=" + grade +
                '}';
    }
}