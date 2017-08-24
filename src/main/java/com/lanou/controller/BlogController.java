package com.lanou.controller;

import com.lanou.bean.Blog;
import com.lanou.bean.User;
import com.lanou.service.BlogService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by dllo on 2017/8/23.
 */
@Controller
public class BlogController {

    @Resource
    private BlogService blogService;

    @RequestMapping(value = "/shwoBlogs")
    @ResponseBody
    public List<Blog> showBlogs(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("account");
        List<Blog> blogs = blogService.findByUId(user.getId());
        return blogs;
    }

    @RequestMapping(value = "/deleteBlog")
    public String delete(@Param("blogId") Integer id) {
        blogService.deleteBlog(id);
        return "users/index";
    }

    @RequestMapping(value = "/updateBlog")
    public String updateBlog(Blog blog, HttpServletRequest request) {
        if (blog.getId() == null) {
            User user = (User) request.getSession().getAttribute("account");
            blog.setUser(user);
            blogService.addBlog(blog);
        } else {
            return blogService.update(blog);
        }
        return "users/index";
    }
    @RequestMapping(value = "/search")
    @ResponseBody
    public List<Blog> findByInfo(@RequestParam("search")String str,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("account");
        List<Blog> blogs = blogService.findByInfo(user.getId(), str);
        return blogs;
    }


}
