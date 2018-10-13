package com.project2.entity;

import java.sql.Date;

/**
 * Created by Administrator on 2018/10/13 0013.
 */
public class Train {
    private Integer id;
    private String name;
    private Date tTime;//培训时间
    private String tDept;//培训部门

    public Train() {
    }

    public Train(Integer id, String name, Date tTime, String tDept) {
        this.id = id;
        this.name = name;
        this.tTime = tTime;
        this.tDept = tDept;
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

    public Date gettTime() {
        return tTime;
    }

    public void settTime(Date tTime) {
        this.tTime = tTime;
    }

    public String gettDept() {
        return tDept;
    }

    public void settDept(String tDept) {
        this.tDept = tDept;
    }

    @Override
    public String toString() {
        return "Train{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", tTime=" + tTime +
                ", tDept='" + tDept + '\'' +
                '}';
    }
}