package com.project2.dao;

import com.project2.entity.Own;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/10/16 0016.
 */
public interface OwnDao {
    void insertOwn(Own own);
    void updateOwn(Own own);
    void updateOwnDp(@Param("rId")Integer rId,@Param("dept") String dept,@Param("position") String position);
    void updateOwnByRId(Integer rId);
    Own queryOwn(Integer rId);
    List<Own> queryOwnByDept(String dept);
    List<Own> queryOwnByState(String state);
    List<Own> queryOwnByPosition(@Param("dept") String dept, @Param("position") String position);
}