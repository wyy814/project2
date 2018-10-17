package com.project2.dao;

import com.project2.entity.Position;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/10/13 0013.
 */
public interface PositionDao {
    void insertPosition(Position position);
    void deletePosition(@Param("dName") String dept, @Param("name") String position);
    void updatePosition(Position position);
    List<Position> queryPositions(String dName);
    List<Position> queryAllPositions();
}
