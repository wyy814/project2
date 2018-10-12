package com.project2.entity;

/**
 * Created by Administrator on 2018/10/11 0011.
 */
public class User {
    private String name;
    private String password;
    private Integer type;// 0为游客，1为员工

    public User() {
    }

    public User(String name, String password, Integer type) {
        this.name = name;
        this.password = password;
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", type=" + type +
                '}';
    }
}