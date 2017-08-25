package com.lanou.controller;

import com.lanou.bean.User;
import com.lanou.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by dllo on 2017/8/23.
 */
@Controller
public class UserController {
    @Resource
    private UserService userService;
    @RequestMapping(value = "/login")
    public String login(User user, HttpServletRequest request){
        if (userService.findBypassword(user)==null){
            return "users/login";
        }else {
            User user1 = userService.findBypassword(user);
            request.getSession().setAttribute("account",user1);
            return "blogs/showblogs";
        }
    }

    @RequestMapping(value = "/toRegister")
    public String toRegister(){
        return "users/register";
    }

    @RequestMapping(value = "/register")
    public String register(User user){
       if (userService.addUser(user)){
           return "users/login";
       }
        return "blogs/showblogs";
    }

    @RequestMapping(value = "/checkout")
    public String checkout(HttpServletRequest request){
        request.getSession().invalidate();
        return "users/login";
    }





}
