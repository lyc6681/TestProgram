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
    public List<Blog> findByInfo(@RequestParam("searchInfo")String str,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("account");
        System.out.println(user);
        List<Blog> blogs = blogService.findByInfo(user.getId(), str);
        System.out.println(blogs);
        return blogs;
    }
    //去添加
    @RequestMapping(value = "/toAddBlogs")
    public String toAddBlogs(){
        return "blogs/addblogs";
    }
    //跳转展示多个
    @RequestMapping(value = "/toBlogs")
    public String toBlogs(){
        return "blogs/showblogs";
    }
    //跳转展示一个
    @RequestMapping(value = "/toBlog")
    public String toBlog(){
        return "blogs/blogs";
    }
    //获取所选的一个
    @RequestMapping(value = "/findBlogById")
    @ResponseBody
    public Blog findById(@RequestParam("tid") Integer id){
        Blog blogs = blogService.findById(id);
        return blogs;
    }


}
