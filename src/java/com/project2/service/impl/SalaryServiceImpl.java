package com.project2.service.impl;

import com.project2.dao.SalaryDao;
import com.project2.entity.Salary;
import com.project2.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/10/19 0019.
 */
@Service
public class SalaryServiceImpl implements SalaryService{
    @Autowired
    private SalaryDao salaryDao;

    @Override
    public void insertSalary(Salary salary) {
        salaryDao.insertSalary(salary);
    }

    @Override
    public Salary querySalaryByRId(Integer id) {
        return salaryDao.querySalaryByRId(id);
    }

    @Override
    public void updateSalary(Integer id, String rec) {
        salaryDao.updateSalary(id,rec);
    }

    @Override
    public List<Salary> queryAllSalary() {
        return salaryDao.queryAllSalary();
    }
}