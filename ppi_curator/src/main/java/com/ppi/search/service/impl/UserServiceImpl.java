package com.ppi.search.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.ppi.search.mapper.RoleMapper;
import com.ppi.search.mapper.UserMapper;
import com.ppi.search.pojo.Role;
import com.ppi.search.pojo.User;
import com.ppi.search.pojo.UserRole;
import com.ppi.search.mapper.UserRoleMapper;
import com.ppi.search.service.UserService;

@Service
@EnableTransactionManagement
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper<User> usermapper;
	/*@Autowired
	private PermissionMapper permissionMapper;*/
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;

	public User findByUserName(String username) {
		List<User> list = usermapper.findByUsername(username);
		if (!CollectionUtils.isEmpty(list)){
			return list.get(0);
		} else {
			return null;
		}
	}
	/*** 
     * 通过用户名获取权限资源 
     *  
     * @param username 
     * @return 
     
    public Set<String> getPermissionsByUserName(String username) {  
        
        User user = findByUserName(username);  
        if (user == null) {  
            return null;  
        }  
        //List<String> list = new ArrayList<String>();  
        Set<String> list = new HashSet<String>();
        for (UserRole userRole : user.getUserRoles()) {  
            Long roleId = userRole.getRoleId(); 
            List<Permission> permissions = permissionMapper.findByRoleId(roleId);  
            for (Permission p : permissions) {  
                list.add(p.getUrl());  
            }  
        }  
        return list;  
    }*/  

	/**
     * 根据用户名查找其角色
     * @param username
     * @return
     */
    public Set<String> getRolesByUserName(String username) {
        List<UserRole> userRoles = userRoleMapper.findByUsername(username);  
        if (userRoles == null) {  
            return null;  
        }  
        //List<String> list = new ArrayList<String>();
        Set<String> list = new HashSet<String>();
        for (UserRole userRole : userRoles) {  
            Long roleId = userRole.getRoleId(); 
            List<Role> roles = roleMapper.selectByPrimaryKey(roleId);  
            for (Role r : roles) {  
                list.add(r.getAuthority());  
            }  
        }  
        return list;  
    }
    
	public List<User> queryAll() {
		return null;
	}
	
}
