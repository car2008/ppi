package com.ppi.search.mapper;

import com.ppi.search.pojo.Taxonomy;

public interface TaxonomyMapper {
    int deleteByPrimaryKey(String id);

    int insert(Taxonomy record);

    int insertSelective(Taxonomy record);

    Taxonomy selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Taxonomy record);

    int updateByPrimaryKey(Taxonomy record);
}