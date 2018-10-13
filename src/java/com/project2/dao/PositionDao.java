package com.project2.dao;

import com.project2.entity.Position;

import java.util.List;

/**
 * Created by Administrator on 2018/10/13 0013.
 */
public interface PositionDao {
    void insertPosition(Position position);
    void deletePosition(String name);
    void updatePosition(Position position);
    List<Position> queryPositions(String dName);
}
