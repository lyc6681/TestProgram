package com.lanou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;

/**
 * Created by dllo on 2017/8/18.
 */
@Controller
public class MainController {

    @RequestMapping(value = "/")
    public String frontPage(){


        return "user/login";
    }




}
