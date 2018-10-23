package com.project2.service;

import com.project2.entity.Own;

import java.util.List;

/**
 * Created by Administrator on 2018/10/16 0016.
 */
public interface OwnService {
    void insertOwn(Own own);
    void updateOwn(Own own);
    void updateOwnDp(Integer rId,String dept,String position);
    void updateOwnByRId(Integer rId);
    Own queryOwn(Integer rId);
    List<Own> queryOwnByState(String state);
    List<Own> queryOwnByDept(String dept);
    List<Own> queryOwnByPosition(String dept,String position);
}
