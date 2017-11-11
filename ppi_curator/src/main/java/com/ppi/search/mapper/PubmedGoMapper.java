package com.ppi.search.mapper;

import com.ppi.search.pojo.PubmedGoKey;

public interface PubmedGoMapper {
    int deleteByPrimaryKey(PubmedGoKey key);

    int insert(PubmedGoKey record);

    int insertSelective(PubmedGoKey record);
}