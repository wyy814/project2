package com.project2.service.impl;

import com.project2.dao.ApplyDao;
import com.project2.entity.Apply;
import com.project2.service.ApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/10/15 0015.
 */
@Service
public class ApplyServiceImpl implements ApplyService{
    @Autowired
    private ApplyDao applyDao;

    @Override
    public void insertApply(Apply apply) {
        applyDao.insertApply(apply);
    }

    @Override
    public void deleteApply(Integer id) {
        applyDao.deleteApply(id);
    }

    @Override
    public void updateApplyCState(Integer id) {
        applyDao.updateApplyCState(id);
    }

    @Override
    public void updateApplyInState(Integer id) {
        applyDao.updateApplyInState(id);
    }

    @Override
    public Apply queryApplyByRId(Integer rId) {
        return applyDao.queryApplyByRId(rId);
    }

    @Override
    public List<Apply> queryAllApplys() {
        return applyDao.queryAllApplys();
    }
}