package com.ppi.search.service;

import java.util.List;

import com.ppi.search.pojo.News;

public interface NewsService {
	List<News> findByCategory(String category);
	News selectByPrimaryKey(Long id);
}
