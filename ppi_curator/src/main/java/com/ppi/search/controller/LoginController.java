package com.ppi.search.controller;

import com.ppi.annotation.Log;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
    @RequestMapping(value = "/login")
    @Log(oper="login...")
    public String showLoginForm(HttpServletRequest req, Model model) {
    	String exceptionClassName = (String)req.getAttribute("shiroLoginFailure");
        String error = null;
        if(UnknownAccountException.class.getName().equals(exceptionClassName)) {
            error = "用户名/密码错误";
        } else if(IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
            error = "用户名/密码错误";
        } else if(exceptionClassName != null) {
            error = "其他错误：" + exceptionClassName;
        }
        System.out.println(error);
        model.addAttribute("error", error);
        //当输入账号和密码正确时，则跳转到配置文件中的successUrl=/**，不必管返回的“jsp/login”了
    	return "jsp/login";
    }
    
    @RequestMapping("/logout")
	@Log(oper="logout...")
	public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Subject subject = SecurityUtils.getSubject();
		if (subject != null) {
			try{
				subject.logout();
			}catch(Exception ex){
			}
		}
		response.sendRedirect("/ppi_curator");
	}
    
}
