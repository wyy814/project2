package com.project2.service.impl;

import com.project2.dao.TrainDao;
import com.project2.entity.Train;
import com.project2.service.TrainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/10/16 0016.
 */
@Service
public class TrainServiceImpl implements TrainService{
    @Autowired
    private TrainDao trainDao;

    @Override
    public void insertTrain(Train train) {
        trainDao.insertTrain(train);
    }

    @Override
    public void updateTrain(Train train) {
        trainDao.updateTrain(train);
    }

    @Override
    public Train queryTrainById(Integer id) {
        return trainDao.queryTrainById(id);
    }

    @Override
    public List<Train> queryTrain(String dept) {
        return trainDao.queryTrain(dept);
    }

    @Override
    public List<Train> queryAllTrain() {
        return trainDao.queryAllTrain();
    }
}