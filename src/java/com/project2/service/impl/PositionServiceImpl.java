package com.project2.service.impl;

import com.project2.dao.PositionDao;
import com.project2.entity.Position;
import com.project2.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/10/13 0013.
 */
@Service
public class PositionServiceImpl implements PositionService{
    @Autowired
    private PositionDao positionDao;

    @Override
    public void addPosition(Position position) {
        positionDao.insertPosition(position);
    }

    @Override
    public void deletePosition(String name) {
        positionDao.deletePosition(name);
    }

    @Override
    public void updatePosition(Position position) {
        positionDao.updatePosition(position);
    }

    @Override
    public List<Position> queryPositions(String dName) {
        return positionDao.queryPositions(dName);
    }
}