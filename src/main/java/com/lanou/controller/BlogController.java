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
    //查找全部
    @RequestMapping(value = "/shwoBlogs")
    @ResponseBody
    public List<Blog> showBlogs(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("account");
        return blogService.findByUId(user.getId());
    }
    //删除
    @RequestMapping(value = "/deleteBlog")
    @ResponseBody
    public Blog delete(@RequestParam("id") Integer id) {
        System.out.println(id);
        blogService.deleteBlog(id);
        return null;
    }
    //修改
    @RequestMapping(value = "/updateBlog")
    public String updateBlog(Blog blog, HttpServletRequest request) {
        if (blog.getId() == null) {
            User user = (User) request.getSession().getAttribute("account");
            blog.setUser(user);
            blogService.addBlog(blog);
        } else {
            return blogService.update(blog);
        }
        return "blogs/showblogs";
    }
    //高级搜索
    @RequestMapping(value = "/search")
    @ResponseBody
    public List<Blog> findByInfo(@RequestParam("search")String str,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("account");
        List<Blog> blogs = blogService.findByInfo(user.getId(), str);
        return blogs;
    }
    //去添加
    @RequestMapping(value = "/toAddBlogs")
    public String toAddBlogs(){
        return "blogs/addblogs";
    }
    //返回跳转
    @RequestMapping(value = "/toBlogs")
    public String toBlogs(){
        return "blogs/showblogs";
    }



}
