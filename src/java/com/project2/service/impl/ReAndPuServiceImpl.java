package com.project2.service.impl;

import com.project2.dao.ReAndPuDao;
import com.project2.entity.ReAndPu;
import com.project2.service.ReAndPuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/10/18 0018.
 */
@Service
public class ReAndPuServiceImpl implements ReAndPuService{
    @Autowired
    private ReAndPuDao reAndPuDao;

    @Override
    public void insertReAndPu(ReAndPu reAndPu) {
        reAndPuDao.insertReAndPu(reAndPu);
    }

    @Override
    public List<ReAndPu> queryReAndPuById(Integer id) {
        return reAndPuDao.queryReAndPuById(id);
    }

    @Override
    public List<ReAndPu> queryAllReAndPu() {
        return reAndPuDao.queryAllReAndPu();
    }
}