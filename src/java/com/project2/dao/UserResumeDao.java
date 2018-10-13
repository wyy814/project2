package com.project2.dao;

import com.project2.entity.UserResume;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
public interface UserResumeDao {
    void insertResume(UserResume userResume);
    void updateResume(UserResume userResume);
    UserResume queryResume(Integer id);
}
