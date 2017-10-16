package com.ppi.search.mapper;

import java.util.List;

import com.ppi.search.pojo.Link;

public interface LinkMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Link record);

    int insertSelective(Link record);

    Link selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Link record);

    int updateByPrimaryKey(Link record);

	List<Link> findAll();
}