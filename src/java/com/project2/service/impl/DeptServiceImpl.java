package com.project2.service.impl;

import com.project2.dao.DeptDao;
import com.project2.entity.Dept;
import com.project2.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/10/13 0013.
 */
@Service
public class DeptServiceImpl implements DeptService{
    @Autowired
    private DeptDao deptDao;

    @Override
    public void addDept(Dept dept) {
        deptDao.insertDept(dept);
    }

    @Override
    public void deleteDept(String name) {
        deptDao.deleteDept(name);
    }

    @Override
    public void updateDept(Dept dept) {
        deptDao.updateDept(dept);
    }

    @Override
    public List<Dept> queryAllDept() {
        return deptDao.queryAllDepts();
    }
}