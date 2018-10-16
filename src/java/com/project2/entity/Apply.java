package com.project2.entity;

import java.sql.Date;

/**
 * Created by Administrator on 2018/10/15 0015.
 */
public class Apply {
    private Integer id;
    private Integer rId;//����id
    private String aName;//ӦƸ����
    private Date dTime;//Ͷ��ʱ��
    private String cState;//�鿴״̬
    private String inState;//����״̬

    public Apply() {
    }

    public Apply(Integer id, Integer rId, String aName, Date dTime, String cState, String inState) {
        this.id = id;
        this.rId = rId;
        this.aName = aName;
        this.dTime = dTime;
        this.cState = cState;
        this.inState = inState;
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

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public Date getdTime() {
        return dTime;
    }

    public void setdTime(Date dTime) {
        this.dTime = dTime;
    }

    public String getcState() {
        return cState;
    }

    public void setcState(String cState) {
        this.cState = cState;
    }

    public String getInState() {
        return inState;
    }

    public void setInState(String inState) {
        this.inState = inState;
    }

    @Override
    public String toString() {
        return "Apply{" +
                "id=" + id +
                ", rId=" + rId +
                ", aName='" + aName + '\'' +
                ", dTime=" + dTime +
                ", cState='" + cState + '\'' +
                ", inState='" + inState + '\'' +
                '}';
    }
}