package com.lanou.mapper;

import com.lanou.bean.Blog;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dllo on 2017/8/23.
 */
@Repository
public interface BlogMapper {

    List<Blog> findByUId(@Param("id")Integer id);
    Integer deleteBlog(Integer id);
    int update(Blog blog);
    void addBlog(Blog blog);
    List<Blog> findByInfo(@Param("id")Integer id,String string);

}
