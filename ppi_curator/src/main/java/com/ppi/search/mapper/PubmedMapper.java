package com.ppi.search.mapper;

import com.ppi.search.pojo.Pubmed;

public interface PubmedMapper {
    int deleteByPrimaryKey(String id);

    int insert(Pubmed record);

    int insertSelective(Pubmed record);

    Pubmed selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Pubmed record);

    int updateByPrimaryKey(Pubmed record);
}