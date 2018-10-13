package com.project2.service.impl;

import com.project2.dao.AdmDao;
import com.project2.entity.Adm;
import com.project2.service.AdmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/10/13 0013.
 */
@Service
public class AdmServiceImpl implements AdmService{
    @Autowired
    private AdmDao admDao;

    @Override
    public Adm queryAdm(Adm adm) {
        return admDao.queryAdm(adm);
    }
}