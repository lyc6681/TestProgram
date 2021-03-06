package com.lanou.service;

import com.github.pagehelper.PageInfo;
import com.lanou.bean.Blog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by dllo on 2017/8/23.
 */
public interface BlogService {

    List<Blog> findByUId(@Param("id")Integer id);
    PageInfo<Blog> TfindByUId(@Param("id")Integer id,Integer pageNum, Integer pageSize);
    void deleteBlog(@Param("blogId")Integer id);
    String update(Blog blog);
    void addBlog(Blog blog);
    List<Blog> findByInfo(@Param("id")Integer id,String string);
    Blog findById(@Param("id")Integer id);
}
