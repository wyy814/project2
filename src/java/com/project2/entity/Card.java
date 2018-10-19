package com.project2.entity;

import java.sql.Timestamp;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
public class Card {
    private Integer id;
    private Integer rId;//Ա��id
    private Timestamp uTime;//�ϰ�ʱ��
    private Timestamp dTime;//�°�ʱ��
    private String ynLate;//�Ƿ�ٵ�
    private String ynLeave;//�Ƿ�����

    public Card() {
    }

    public Card(Integer id, Integer rId, Timestamp uTime, Timestamp dTime, String ynLate, String ynLeave) {
        this.id = id;
        this.rId = rId;
        this.uTime = uTime;
        this.dTime = dTime;
        this.ynLate = ynLate;
        this.ynLeave = ynLeave;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
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
        return "Card{" +
                "id=" + id +
                ", rId=" + rId +
                ", uTime=" + uTime +
                ", dTime=" + dTime +
                ", ynLate='" + ynLate + '\'' +
                ", ynLeave='" + ynLeave + '\'' +
                '}';
    }
}