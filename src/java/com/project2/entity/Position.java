package com.project2.entity;

import java.sql.Timestamp;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
public class Position {
    private Integer id;
    private String name;
    private Integer dId;
    private Timestamp pTime;

    public Position() {
    }

    public Position(Integer id, String name, Integer dId, Timestamp pTime) {
        this.id = id;
        this.name = name;
        this.dId = dId;
        this.pTime = pTime;
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

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
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
                "id=" + id +
                ", name='" + name + '\'' +
                ", dId=" + dId +
                ", pTime=" + pTime +
                '}';
    }
}