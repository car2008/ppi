package com.ppi.search.mapper;

import java.util.List;

import com.ppi.search.pojo.News;

public interface NewsMapper {
    int deleteByPrimaryKey(Long id);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
    
    List<News> findByCategory(String category);
}