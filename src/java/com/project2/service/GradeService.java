package com.project2.service;

import com.project2.entity.Grade;

/**
 * Created by Administrator on 2018/10/19 0019.
 */
public interface GradeService {
    void insertGrade(Grade grade);
    Grade queryGradeByRId(Integer rId);
}
