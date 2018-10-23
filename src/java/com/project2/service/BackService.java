package com.project2.service;

import com.project2.entity.Back;

import java.util.List;

/**
 * Created by Administrator on 2018/10/15 0015.
 */
public interface BackService {
    void insertBack(Back back);
    void updateBackIn(Integer rId);
    Back queryBackByRId(Integer rId);
    List<Back> queryAllBack();
}
