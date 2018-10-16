package com.project2.service;

import com.project2.entity.Back;

/**
 * Created by Administrator on 2018/10/15 0015.
 */
public interface BackService {
    void insertBack(Back back);
    void updateBackSee(String uName);
    void updateBackIn(String uName);
    Back queryBackByRId(Integer rId);
}
