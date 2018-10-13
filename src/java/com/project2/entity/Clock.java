package com.project2.entity;

import java.sql.Timestamp;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
public class Clock {
    private Timestamp uTime;//上班时间
    private Timestamp dTime;//下班时间
    private String ynLate;//是否迟到
    private String ynLeave;//是否早退

    public Clock() {
    }

    public Clock(Timestamp uTime, Timestamp dTime, String ynLate, String ynLeave) {
        this.uTime = uTime;
        this.dTime = dTime;
        this.ynLate = ynLate;
        this.ynLeave = ynLeave;
    }

    public Timestamp getuTime() {
        return uTime;
    }

    public void setuTime(Timestamp uTime) {
        this.uTime = uTime;
    }

    public Timestamp getdTime() {
        return dTime;
    }

    public void setdTime(Timestamp dTime) {
        this.dTime = dTime;
    }

    public String getYnLate() {
        return ynLate;
    }

    public void setYnLate(String ynLate) {
        this.ynLate = ynLate;
    }

    public String getYnLeave() {
        return ynLeave;
    }

    public void setYnLeave(String ynLeave) {
        this.ynLeave = ynLeave;
    }

    @Override
    public String toString() {
        return "Clock{" +
                "uTime=" + uTime +
                ", dTime=" + dTime +
                ", ynLate='" + ynLate + '\'' +
                ", ynLeave='" + ynLeave + '\'' +
                '}';
    }
}