package com.project2.dao;

import com.project2.entity.Own;

import java.util.List;

/**
 * Created by Administrator on 2018/10/16 0016.
 */
public interface OwnDao {
    void insertOwn(Own own);
    void updateOwn(Own own);
    Own queryOwn(Integer rId);
    List<Own> queryAllOwns();
}