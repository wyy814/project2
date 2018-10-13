package com.project2.entity;

import java.sql.Timestamp;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
public class Position {
    private String name;
    private Integer dName;//部门名称
    private Timestamp pTime;//职位创建时间

    public Position() {
    }

    public Position(String name, Integer dName, Timestamp pTime) {
        this.name = name;
        this.dName = dName;
        this.pTime = pTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getdName() {
        return dName;
    }

    public void setdName(Integer dName) {
        this.dName = dName;
    }

    public Timestamp getpTime() {
        return pTime;
    }

    public void setpTime(Timestamp pTime) {
        this.pTime = pTime;
    }

    @Override
    public String toString() {
        return "Position{" +
                "name='" + name + '\'' +
                ", dName=" + dName +
                ", pTime=" + pTime +
                '}';
    }
}