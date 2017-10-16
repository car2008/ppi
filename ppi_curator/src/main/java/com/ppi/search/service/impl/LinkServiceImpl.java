package com.ppi.search.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.ppi.search.mapper.LinkMapper;
import com.ppi.search.pojo.Link;
import com.ppi.search.service.LinkService;
@Service
@EnableTransactionManagement
public class LinkServiceImpl implements LinkService {
	@Autowired
	private LinkMapper linkMapper;
	@Override
	public List<Link> findAll() {
		return linkMapper.findAll();
	}

}
