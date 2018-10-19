package com.project2.service;

import com.project2.entity.ReAndPu;

import java.util.List;

/**
 * Created by Administrator on 2018/10/18 0018.
 */
public interface ReAndPuService {
    void insertReAndPu(ReAndPu reAndPu);
    List<ReAndPu> queryReAndPuById(Integer id);
    List<ReAndPu> queryAllReAndPu();
}
