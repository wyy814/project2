package com.project2.dao;

import com.project2.entity.Back;

/**
 * Created by Administrator on 2018/10/15 0015.
 */
public interface BackDao {
    void insertBack(Back back);
    void updateBackSee(String uName);
    void updateBackIn(String uName);
    Back queryBackByRId(Integer rId);
}