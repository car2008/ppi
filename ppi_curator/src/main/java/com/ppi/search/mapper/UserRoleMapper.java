package com.ppi.search.mapper;

import java.util.List;

import com.ppi.search.pojo.UserRole;

public interface UserRoleMapper {
    int deleteByPrimaryKey(UserRole key);

    int insert(UserRole record);

    int insertSelective(UserRole record);
    
    List<UserRole> findByUsername(String username);
}