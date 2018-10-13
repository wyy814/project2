package com.project2.entity;

import java.sql.Date;

/**
 * Created by Administrator on 2018/10/13 0013.
 */
public class ReAndPu {
    private Integer id;
    private String eName;
    private String why;
    private Date time;
    private Integer num;
    private String type;

    public ReAndPu() {
    }

    public ReAndPu(Integer id, String eName, String why, Date time, Integer num, String type) {
        this.id = id;
        this.eName = eName;
        this.why = why;
        this.time = time;
        this.num = num;
        this.type = type;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public String getWhy() {
        return why;
    }

    public void setWhy(String why) {
        this.why = why;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "ReAndPu{" +
                "id=" + id +
                ", eName='" + eName + '\'' +
                ", why='" + why + '\'' +
                ", time=" + time +
                ", num=" + num +
                ", type='" + type + '\'' +
                '}';
    }
}