package com.lanou.mapper;

import com.lanou.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by dllo on 2017/8/18.
 */
@Repository
public interface UserMapper {

    User findById(@Param("id") Integer id);
    User findBypassword(User user);
    void addUser(User user);

}
