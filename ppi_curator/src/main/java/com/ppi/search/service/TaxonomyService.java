package com.ppi.search.service;

import java.util.List;

import com.ppi.search.pojo.News;
import com.ppi.search.pojo.Taxonomy;

public interface TaxonomyService {
	Taxonomy selectByPrimaryKey(String id);
	List<Taxonomy> findAll();
}
