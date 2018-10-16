package com.project2.service.impl;

import com.project2.dao.OwnDao;
import com.project2.entity.Own;
import com.project2.service.OwnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/10/16 0016.
 */
@Service
public class OwnServiceImpl implements OwnService{
    @Autowired
    private OwnDao ownDao;

    @Override
    public void insertOwn(Own own) {
        ownDao.insertOwn(own);
    }

    @Override
    public void updateOwn(Own own) {
        ownDao.updateOwn(own);
    }

    @Override
    public Own queryOwn(Integer rId) {
        return ownDao.queryOwn(rId);
    }

    @Override
    public List<Own> queryAllOwns() {
        return ownDao.queryAllOwns();
    }
}