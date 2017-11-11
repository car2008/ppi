package com.ppi.search.mapper;

import com.ppi.search.pojo.SentenceGoKey;

public interface SentenceGoMapper {
    int deleteByPrimaryKey(SentenceGoKey key);

    int insert(SentenceGoKey record);

    int insertSelective(SentenceGoKey record);
}