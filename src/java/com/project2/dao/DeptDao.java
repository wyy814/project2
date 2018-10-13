package com.project2.dao;

import com.project2.entity.Dept;

import java.util.List;

/**
 * Created by Administrator on 2018/10/13 0013.
 */
public interface DeptDao {
    void insertDept(Dept dept);
    void deleteDept(String name);
    void updateDept(Dept dept);
    List<Dept> queryAllDepts();
}
