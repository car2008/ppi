package com.ppi.search.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.ppi.search.mapper.TaxonomyMapper;
import com.ppi.search.pojo.Taxonomy;
import com.ppi.search.service.TaxonomyService;
@Service
@EnableTransactionManagement
public class TaxonomyServiceImpl implements TaxonomyService {
	@Autowired
	private TaxonomyMapper taxonomyMapper;
	@Override
	public Taxonomy selectByPrimaryKey(String id) {
		return taxonomyMapper.selectByPrimaryKey(id);
	}
	
}
