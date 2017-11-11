package com.ppi.search.mapper;

import com.ppi.search.pojo.UpdateRecord;

public interface UpdateRecordMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UpdateRecord record);

    int insertSelective(UpdateRecord record);

    UpdateRecord selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UpdateRecord record);

    int updateByPrimaryKey(UpdateRecord record);
}