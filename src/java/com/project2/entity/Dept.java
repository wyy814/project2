package com.project2.entity;

import java.sql.Timestamp;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
public class Dept {
    private String name;
    private Timestamp dTime;//部门创建时间

    public Dept() {
    }

    public Dept(String name, Timestamp dTime) {
        this.name = name;
        this.dTime = dTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getdTime() {
        return dTime;
    }

    public void setdTime(Timestamp dTime) {
        this.dTime = dTime;
    }

    @Override
    public String toString() {
        return "Dept{" +
                ", name='" + name + '\'' +
                ", dTime=" + dTime +
                '}';
    }
}