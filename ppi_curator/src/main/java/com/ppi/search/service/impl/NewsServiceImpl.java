package com.ppi.search.service.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.ppi.search.mapper.NewsMapper;
import com.ppi.search.mapper.PreferenceMapper;
import com.ppi.search.pojo.News;
import com.ppi.search.pojo.Preference;
import com.ppi.search.service.NewsService;
import com.ppi.search.service.PreferenceService;
@Service
@EnableTransactionManagement
public class NewsServiceImpl implements NewsService {
	@Autowired
	private NewsMapper newsMapper;
	@Override
	public List<News> findByCategory(String category) {
		List<News> list = newsMapper.findByCategory(category);
		if (!CollectionUtils.isEmpty(list)){
			return list;
		} else {
			return null;
		}
	}
	@Override
	public News selectByPrimaryKey(Long id) {
		return newsMapper.selectByPrimaryKey(id);
	}
	
}
