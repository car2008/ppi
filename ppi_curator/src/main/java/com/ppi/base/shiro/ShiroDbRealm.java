package com.ppi.base.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.ppi.search.pojo.User;
import com.ppi.search.service.impl.UserServiceImpl;

/**
 * 自定义realm
 * @author czp
 *
 */
public class ShiroDbRealm extends AuthorizingRealm {
	@Autowired
	private UserServiceImpl userService;
	/**
	 * 获取授权信息 
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection pc) {
		System.out.println("调用授权"); 
		//根据自己系统规则的需要编写获取授权信息，这里为了快速入门只获取了用户对应角色的资源url信息  
		//User user = (User) SecurityUtils.getSubject().getSession().getAttribute(ShiroDbRealm.SESSION_USER_KEY);
		//String username = (String) pc.fromRealm(getName()).iterator().next();
		String username = (String)pc.getPrimaryPrincipal();
		if (username != null) {  
			 SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		     authorizationInfo.setRoles(userService.getRolesByUserName(username));
		     //authorizationInfo.setStringPermissions(userService.getPermissionsByUserName(username));
		     return authorizationInfo;
        }  
        return null;  
	}

	/**
	 * 获取认证信息
	 
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken at) throws AuthenticationException {
		//UsernamePasswordToken token = (UsernamePasswordToken) at;  
        //String username = token.getUsername();
		String username = (String)at.getPrincipal();
        if (username != null && !"".equals(username)) {  
            User user = userService.findByUserName(username);  
            if (user != null) {  
                return new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), getName());  
            }  
        }  
        return null; 
	}*/
	
	@Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		System.out.println("调用认证");  
        String username = (String)token.getPrincipal();

        User user = userService.findByUserName(username);

        if(user == null) {
            throw new UnknownAccountException();//没找到帐号
        }

        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user.getUsername(), //用户名
                user.getPassword(), //密码
                ByteSource.Util.bytes(user.getUsername()),//salt=user.getUsername()
                getName()  //realm name
        );
        return authenticationInfo;
    }

	public UserServiceImpl getUserService() {
		return userService;
	}

	public void setUserService(UserServiceImpl userService) {
		this.userService = userService;
	}

}
