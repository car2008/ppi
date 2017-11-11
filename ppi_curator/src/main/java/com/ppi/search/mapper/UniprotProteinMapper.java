package com.ppi.search.mapper;

import com.ppi.search.pojo.UniprotProtein;

public interface UniprotProteinMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UniprotProtein record);

    int insertSelective(UniprotProtein record);

    UniprotProtein selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UniprotProtein record);

    int updateByPrimaryKey(UniprotProtein record);
}