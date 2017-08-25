package com.lanou.service.impl;

import com.lanou.bean.User;
import com.lanou.mapper.UserMapper;
import com.lanou.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by dllo on 2017/8/23.
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper mapper;



    public User findBypassword(User user) {
        return mapper.findBypassword(user);
    }

    public boolean addUser(User user) {
        user.setLevel(1);
        user.setDes("无");
        mapper.addUser(user);
        if (mapper.findById(user.getId())==null){
            return false;
        }else {
            return true;
        }
    }
}
