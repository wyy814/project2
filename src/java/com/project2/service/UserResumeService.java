package com.project2.service;

import com.project2.entity.UserResume;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
public interface UserResumeService {
    void addResume(UserResume userResume);
    void updateResume(UserResume userResume);
    UserResume queryResume(Integer id);
    UserResume queryResumeByUName(String uName);
}
