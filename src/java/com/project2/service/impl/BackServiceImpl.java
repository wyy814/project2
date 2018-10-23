package com.project2.service.impl;

import com.project2.dao.BackDao;
import com.project2.entity.Back;
import com.project2.service.BackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public void updateBackIn(Integer rId) {
        backDao.updateBackIn(rId);
    }

    @Override
    public Back queryBackByRId(Integer rId) {
        return backDao.queryBackByRId(rId);
    }

    @Override
    public List<Back> queryAllBack() {
        return backDao.queryAllBack();
    }
}