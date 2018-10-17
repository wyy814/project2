package com.project2.service;

import com.project2.entity.Train;

import java.util.List;

/**
 * Created by Administrator on 2018/10/16 0016.
 */
public interface TrainService {
    void insertTrain(Train train);
    void updateTrain(Train train);
    Train queryTrainById(Integer id);
    List<Train> queryTrain(String dept);
    List<Train> queryAllTrain();
}
