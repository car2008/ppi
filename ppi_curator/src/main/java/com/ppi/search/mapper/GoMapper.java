package com.ppi.search.mapper;

import com.ppi.search.pojo.Go;

public interface GoMapper {
    int deleteByPrimaryKey(String id);

    int insert(Go record);

    int insertSelective(Go record);

    Go selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Go record);

    int updateByPrimaryKey(Go record);
}