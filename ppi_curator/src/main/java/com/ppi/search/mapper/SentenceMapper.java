package com.ppi.search.mapper;

import com.ppi.search.pojo.Sentence;

public interface SentenceMapper {
    int deleteByPrimaryKey(String id);

    int insert(Sentence record);

    int insertSelective(Sentence record);

    Sentence selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Sentence record);

    int updateByPrimaryKeyWithBLOBs(Sentence record);

    int updateByPrimaryKey(Sentence record);
}