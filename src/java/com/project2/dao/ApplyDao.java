package com.project2.dao;

import com.project2.entity.Apply;

import java.util.List;

/**
 * Created by Administrator on 2018/10/15 0015.
 */
public interface ApplyDao {
    void insertApply(Apply apply);
    void deleteApply(Integer id);
    void updateApplyCState(Integer id);
    void updateApplyInState(Integer id);
    Apply queryApplyByRId(Integer rId);
    List<Apply> queryAllApplys();
}