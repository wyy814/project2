package com.project2.service;

import com.project2.entity.Dept;

import java.util.List;

/**
 * Created by Administrator on 2018/10/13 0013.
 */
public interface DeptService {
    void addDept(Dept dept);
    void deleteDept(String name);
    void updateDept(Dept dept);
    List<Dept> queryAllDept();
}
