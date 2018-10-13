package com.project2.entity;

import java.sql.Date;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
public class Salary {
    private Integer id;
    private Integer bSalary;//基本工资
    private Integer pSalary;//绩效工资
    private Integer rpSalary;//奖惩工资
    private Integer sSalary;//社保
    private Date time;//结算工资日期
    private String rec;//工资复议

    public Salary() {
    }

    public Salary(Integer id, Integer bSalary, Integer pSalary, Integer rpSalary, Integer sSalary, Date time, String rec) {
        this.id = id;
        this.bSalary = bSalary;
        this.pSalary = pSalary;
        this.rpSalary = rpSalary;
        this.sSalary = sSalary;
        this.time = time;
        this.rec = rec;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getbSalary() {
        return bSalary;
    }

    public void setbSalary(Integer bSalary) {
        this.bSalary = bSalary;
    }

    public Integer getpSalary() {
        return pSalary;
    }

    public void setpSalary(Integer pSalary) {
        this.pSalary = pSalary;
    }

    public Integer getRpSalary() {
        return rpSalary;
    }

    public void setRpSalary(Integer rpSalary) {
        this.rpSalary = rpSalary;
    }

    public Integer getsSalary() {
        return sSalary;
    }

    public void setsSalary(Integer sSalary) {
        this.sSalary = sSalary;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getRec() {
        return rec;
    }

    public void setRec(String rec) {
        this.rec = rec;
    }

    @Override
    public String toString() {
        return "Salary{" +
                "id=" + id +
                ", bSalary=" + bSalary +
                ", pSalary=" + pSalary +
                ", rpSalary=" + rpSalary +
                ", sSalary=" + sSalary +
                ", time=" + time +
                ", rec='" + rec + '\'' +
                '}';
    }
}