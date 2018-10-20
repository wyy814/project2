package com.project2.service.impl;

import com.project2.dao.GradeDao;
import com.project2.entity.Grade;
import com.project2.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/10/19 0019.
 */
@Service
public class GradeServiceImpl implements GradeService{
    @Autowired
    private GradeDao gradeDao;

    @Override
    public void insertGrade(Grade grade) {
        gradeDao.insertGrade(grade);
    }

    @Override
    public Grade queryGradeByRId(Integer rId) {
        return gradeDao.queryGradeByRId(rId);
    }
}