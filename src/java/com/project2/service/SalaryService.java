package com.project2.service;

import com.project2.entity.Salary;

import java.util.List;

/**
 * Created by Administrator on 2018/10/19 0019.
 */
public interface SalaryService {
    void insertSalary(Salary salary);
    Salary querySalaryByRId(Integer id);
    void updateSalary(Integer id, String rec);
    List<Salary> queryAllSalary();
}
