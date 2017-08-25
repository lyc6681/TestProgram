package com.lanou.service.impl;

import com.lanou.bean.Blog;
import com.lanou.mapper.BlogMapper;
import com.lanou.service.BlogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dllo on 2017/8/23.
 */
@Service
public class BlogServiceImpl implements BlogService {
    @Resource
    private BlogMapper mapper;


    public List<Blog> findByUId(Integer id) {
        List<Blog> byUId = mapper.findByUId(id);
        return byUId;
    }

    public Integer deleteBlog(Integer id) {
        mapper.deleteBlog(id);
        return id;
    }

    public String update(Blog blog) {
        int update = mapper.update(blog);
        if (update==0){
            return "blogs/error";
        }
        return "users/index";
    }

    public void addBlog(Blog blog) {
        mapper.addBlog(blog);
    }

    public List<Blog> findByInfo(Integer id, String string) {
        return mapper.findByInfo(id,string);
    }

    public Blog findById(Integer id) {
        Blog blogs = mapper.findById(id);
        return blogs;
    }
}
