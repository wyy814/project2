package com.project2.entity;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
public class Emp {
    private Integer id;
    private String name;
    private String sex;
    private Integer age;
    private String eduBg;//ѧ��
    private String phone;//��ϵ��ʽ

    private Integer salary;//н��
    private String train;//��ѵ
    private String performance;//��Ч
    private String dept;//����
    private String position;//ְλ
    private String attendance;//����
    private String state;//״̬

    public Emp() {
    }

    public Emp(Integer id, String name, String sex, Integer age, String eduBg, String phone, Integer salary, String train, String performance, String dept, String position, String attendance, String state) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.eduBg = eduBg;
        this.phone = phone;
        this.salary = salary;
        this.train = train;
        this.performance = performance;
        this.dept = dept;
        this.position = position;
        this.attendance = attendance;
        this.state = state;
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

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public String getTrain() {
        return train;
    }

    public void setTrain(String train) {
        this.train = train;
    }

    public String getPerformance() {
        return performance;
    }

    public void setPerformance(String performance) {
        this.performance = performance;
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

    public String getAttendance() {
        return attendance;
    }

    public void setAttendance(String attendance) {
        this.attendance = attendance;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", eduBg='" + eduBg + '\'' +
                ", phone='" + phone + '\'' +
                ", salary=" + salary +
                ", train='" + train + '\'' +
                ", performance='" + performance + '\'' +
                ", dept='" + dept + '\'' +
                ", position='" + position + '\'' +
                ", attendance='" + attendance + '\'' +
                ", state='" + state + '\'' +
                '}';
    }
}