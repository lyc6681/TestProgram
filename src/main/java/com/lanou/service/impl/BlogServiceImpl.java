package com.lanou.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
        return mapper.findByUId(id);
    }

    public PageInfo<Blog> TfindByUId(Integer id,Integer pageNum, Integer pageSize) {

        pageNum = pageNum == null ? 1 : pageNum;
        pageSize = pageSize == null ? 2 : pageSize;
        PageHelper.startPage(pageNum,pageSize);
        List<Blog> blogs = mapper.findByUId(id);
        PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogs);
        return pageInfo;
    }

    public void deleteBlog(Integer id) {
        mapper.deleteBlog(id);
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
        return mapper.findById(id);
    }
}
