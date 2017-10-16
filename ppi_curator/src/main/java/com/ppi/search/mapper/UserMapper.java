package com.ppi.search.mapper;

import java.util.List;

import com.ppi.search.pojo.User;

public interface UserMapper<User> {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> findByUsername(String username);
}