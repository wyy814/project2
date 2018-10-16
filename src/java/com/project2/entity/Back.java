package com.project2.entity;

import java.sql.Date;

/**
 * Created by Administrator on 2018/10/15 0015.
 */
public class Back {
    private Integer rId;//简历id
    private Date tTime;//投递时间
    private String see;//是否查看
    private String interview;//是否面试
    private Date inTime;//面试时间
    private String employed;//是否录用

    public Back() {
    }

    public Back(Integer rId, Date tTime, String see, String interview, Date inTime, String employed) {
        this.rId = rId;
        this.tTime = tTime;
        this.see = see;
        this.interview = interview;
        this.inTime = inTime;
        this.employed = employed;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public Date gettTime() {
        return tTime;
    }

    public void settTime(Date tTime) {
        this.tTime = tTime;
    }

    public String getSee() {
        return see;
    }

    public void setSee(String see) {
        this.see = see;
    }

    public String getInterview() {
        return interview;
    }

    public void setInterview(String interview) {
        this.interview = interview;
    }

    public Date getInTime() {
        return inTime;
    }

    public void setInTime(Date inTime) {
        this.inTime = inTime;
    }

    public String getEmployed() {
        return employed;
    }

    public void setEmployed(String employed) {
        this.employed = employed;
    }

    @Override
    public String toString() {
        return "Back{" +
                "rId='" + rId + '\'' +
                ", tTime=" + tTime +
                ", see='" + see + '\'' +
                ", interview='" + interview + '\'' +
                ", inTime=" + inTime +
                ", employed='" + employed + '\'' +
                '}';
    }
}