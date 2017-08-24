package com.lanou.service;

import com.lanou.bean.User;

/**
 * Created by dllo on 2017/8/19.
 */
public interface UserService {


    User findBypassword(User user);
    boolean addUser(User user);


}
