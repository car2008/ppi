package com.ppi.search.controller;

import com.ppi.annotation.Log;
import com.ppi.common.ServiceParam;
import com.ppi.search.pojo.User;
import com.ppi.search.service.UserService;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {
	private final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService userService;

	@RequestMapping("/home") //url
	@Log(oper="user login")
	public String dologin(User user, Model model){
		logger.info("login ....");
		return "/jsp/success";
	}

	//@RequestMapping("/logout.do")
	@Log(oper="user logout")
	public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			try{
				subject.logout();
			}catch(Exception ex){
			}
		}
		response.sendRedirect("/index.jsp");
	}

//@RequestMapping(value="/list", method=RequestMethod.GET)
//@ResponseBody
//public List<User> listData() {
//    return userService.queryAll();
//}
//@RequestMapping(value="/list/{username}", method=RequestMethod.GET)
//@ResponseBody
//public User findUserByUserName2(@PathVariable(value="username") String username) {
//	return userService.findByUserName(username);
//}

	private String loginUser(User user) {
		if (isRelogin(user)) return "SUCC"; 

		return shiroLogin(user); 
	}
	private String shiroLogin(User user) {
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword().toCharArray(), null);
		token.setRememberMe(true);

		try {
			SecurityUtils.getSubject().login(token);
		} catch (UnknownAccountException ex) {
			return "User does not exist or password error!";
		} catch (IncorrectCredentialsException ex) {
			return "User does not exist or password error!";
		} catch (AuthenticationException ex) {
			ex.printStackTrace();
			return ex.getMessage(); 
		} catch (Exception ex) {
			ex.printStackTrace();
			return "Internal error, please try again!";
		}
		return "SUCC";
	}

	private boolean isRelogin(User user) {
		Subject us = SecurityUtils.getSubject();
		if (us.isAuthenticated()) {
			return true; 
		}
		return false; 
	}
	@RequestMapping("/register.do")
	@Log(oper="user register")
	@ResponseBody
	public ServiceParam register(User user, Model model){
		if(!StringUtils.isEmpty(user.getUsername())){
			//user.setRole("user");
			User userDb = userService.findByUserName(user.getUsername());
			if (userDb != null)return new ServiceParam("user exist!");
			return new ServiceParam(null,"register Succ!",true);
		}
		return new ServiceParam("paramErr!");
	}
}
