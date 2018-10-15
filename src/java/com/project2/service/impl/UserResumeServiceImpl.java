package com.project2.service.impl;

import com.project2.dao.UserResumeDao;
import com.project2.entity.UserResume;
import com.project2.service.UserResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
@Service
public class UserResumeServiceImpl implements UserResumeService{
    @Autowired
    private UserResumeDao userResumeDao;

    @Override
    public void addResume(UserResume userResume) {
        userResumeDao.insertResume(userResume);
    }

    @Override
    public void updateResume(UserResume userResume) {
        userResumeDao.updateResume(userResume);
    }

    @Override
    public UserResume queryResume(Integer id) {
        return userResumeDao.queryResume(id);
    }

    @Override
    public UserResume queryResumeByUName(String uName) {
        return userResumeDao.queryResumeByUName(uName);
    }
}