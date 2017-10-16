package com.ppi.search.mapper;

import java.util.List;

import com.ppi.search.pojo.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    int insertSelective(Role record);

    List<Role> selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    //List<Role> selectByPrimaryKey(String roleId);
}