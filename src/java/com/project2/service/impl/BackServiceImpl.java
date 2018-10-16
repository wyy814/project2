package com.project2.service.impl;

import com.project2.dao.BackDao;
import com.project2.entity.Back;
import com.project2.service.BackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/10/15 0015.
 */
@Service
public class BackServiceImpl implements BackService{
    @Autowired
    private BackDao backDao;

    @Override
    public void insertBack(Back back) {
        backDao.insertBack(back);
    }

    @Override
    public void updateBackSee(String uName) {
        backDao.updateBackSee(uName);
    }

    @Override
    public void updateBackIn(String uName) {
        backDao.updateBackIn(uName);
    }

    @Override
    public Back queryBackByRId(Integer rId) {
        return backDao.queryBackByRId(rId);
    }
}