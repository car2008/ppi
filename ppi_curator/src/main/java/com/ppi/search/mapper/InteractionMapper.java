package com.ppi.search.mapper;

import com.ppi.search.pojo.Interaction;

public interface InteractionMapper {
    int deleteByPrimaryKey(String id);

    int insert(Interaction record);

    int insertSelective(Interaction record);

    Interaction selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Interaction record);

    int updateByPrimaryKeyWithBLOBs(Interaction record);

    int updateByPrimaryKey(Interaction record);
}