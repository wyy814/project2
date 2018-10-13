package com.project2.entity;

import java.sql.Date;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
public class Salary {
    private Integer bSalary;//��������
    private Integer pSalary;//��Ч����
    private Integer rpSalary;//���͹���
    private Integer sSalary;//�籣
    private Date time;//���㹤������
    private String rec;//���ʸ���

    public Salary() {
    }

    public Salary(Integer bSalary, Integer pSalary, Integer rpSalary, Integer sSalary, Date time, String rec) {
        this.bSalary = bSalary;
        this.pSalary = pSalary;
        this.rpSalary = rpSalary;
        this.sSalary = sSalary;
        this.time = time;
        this.rec = rec;
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
                "bSalary=" + bSalary +
                ", pSalary=" + pSalary +
                ", rpSalary=" + rpSalary +
                ", sSalary=" + sSalary +
                ", time=" + time +
                ", rec='" + rec + '\'' +
                '}';
    }
}