package com.ppi.search.service;

import java.util.List;

import com.ppi.search.pojo.Preference;

public interface PreferenceService {
	Preference findBypreferenceKey(String preferenceKey);
}
