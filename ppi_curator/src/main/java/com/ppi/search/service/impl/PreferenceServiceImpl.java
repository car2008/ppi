package com.ppi.search.service.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.ppi.search.mapper.PreferenceMapper;
import com.ppi.search.pojo.Preference;
import com.ppi.search.service.PreferenceService;
@Service
@EnableTransactionManagement
public class PreferenceServiceImpl implements PreferenceService {
	@Autowired
	private PreferenceMapper preferenceMapper;
	@Override
	public Preference findBypreferenceKey(String preferenceKey) {
		List<Preference> list = preferenceMapper.findBypreferenceKey(preferenceKey);
		if (!CollectionUtils.isEmpty(list)){
			return list.get(0);
		} else {
			return null;
		}
	}
	
}
