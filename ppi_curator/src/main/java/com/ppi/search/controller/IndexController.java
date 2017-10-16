package com.ppi.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ppi.annotation.CurrentUser;
import com.ppi.search.pojo.Link;
import com.ppi.search.pojo.News;
import com.ppi.search.pojo.Preference;
import com.ppi.search.pojo.User;
import com.ppi.search.service.LinkService;
import com.ppi.search.service.NewsService;
import com.ppi.search.service.PreferenceService;
import com.ppi.search.service.UserService;

@Controller  
public class IndexController {  
	@Autowired  
    private PreferenceService preferenceService; 
    @Autowired  
    private NewsService newsService; 
    @Autowired  
    private LinkService linkService; 
    @Autowired  
    private UserService userService; 
    
    @RequestMapping("/")
    public ModelAndView index(@CurrentUser User loginUser, Model model) {
    	Set<String> permissions = userService.getRolesByUserName(loginUser.getUsername());
    	ModelAndView mav = new ModelAndView(); 
		Preference preference=preferenceService.findBypreferenceKey("NEWS_CATEGORIES");
		String values=preference.getPreferenceValue();
		String[] valArray=values.split(";");
		mav.addObject("categories", valArray);
		HashMap<String, List<News>> map=new HashMap<>();
		for (String string : valArray) {
			map.put(string, newsService.findByCategory(string));
		}
		mav.addObject("newses", map);
		List<Link> links = linkService.findAll();
		mav.addObject("links", links);
		mav.setViewName("jsp/index");
		return mav;
    }
    
    @RequestMapping("/index")
    public String toIndex() {  
        return "jsp/index";  
    }
    
    @RequestMapping("/newses/{category}")
    public String newses(@PathVariable("category") String category, Model model) {
    	List<News> newses = newsService.findByCategory(category);
    	model.addAttribute("newses", newses);
    	model.addAttribute("category", category);
        return "jsp/newses";  
    }
    
    @RequestMapping("/news/{id}")
    public String news(@PathVariable("id") Long id, Model model) {
    	News news = newsService.selectByPrimaryKey(id);
    	model.addAttribute("news", news);
        return "jsp/news";  
    }
}  
