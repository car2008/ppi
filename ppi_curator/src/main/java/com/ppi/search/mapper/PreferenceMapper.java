package com.ppi.search.mapper;

import java.util.List;

import com.ppi.search.pojo.Preference;

public interface PreferenceMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Preference record);

    int insertSelective(Preference record);

    Preference selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Preference record);

    int updateByPrimaryKeyWithBLOBs(Preference record);

    int updateByPrimaryKey(Preference record);
    
    List<Preference> findBypreferenceKey(String preferenceKey);
}