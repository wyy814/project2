package com.project2.service;

import com.project2.entity.Position;

import java.util.List;

/**
 * Created by Administrator on 2018/10/13 0013.
 */
public interface PositionService {
    void addPosition(Position position);
    void deletePosition(String dept,String position);
    void updatePosition(Position position);
    List<Position> queryPositions(String dName);
    List<Position> queryAllPositions();
}
