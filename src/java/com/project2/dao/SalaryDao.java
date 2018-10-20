package com.project2.dao;

import com.project2.entity.Salary;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/10/19 0019.
 */
public interface SalaryDao {
    void insertSalary(Salary salary);
    void updateSalary(@Param("id") Integer id, @Param("rec") String rec);
    Salary querySalaryByRId(Integer id);
    List<Salary> queryAllSalary();
}
