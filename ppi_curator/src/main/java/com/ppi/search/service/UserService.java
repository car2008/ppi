package com.ppi.search.service;

import java.util.List;
import java.util.Set;

import com.ppi.search.pojo.User;

public interface UserService {
	public User findByUserName(String username);
	
    //public Set<String> getPermissionsByUserName(String username);

    public Set<String> getRolesByUserName(String username);
    
	public List<User> queryAll();

}
