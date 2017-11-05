package com.ppi.search.controller;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ppi.search.pojo.Pubmed;
import com.ppi.search.service.SearchService;


@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;

    /**
     * 通过关键字搜索
     * 
     * @param keyWords
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "search", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView search(@RequestParam("keyWords") String keyWords, @RequestParam("page") Integer page,
            @RequestParam("rows") Integer rows) throws Exception {
    	System.out.println(this.searchService.search(keyWords, page, rows));
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("list", this.searchService.search(keyWords, page, rows));
    	mv.setViewName("jsp/result");        
    	return mv;
        //return this.searchService.search(keyWords, page, rows);
    }
    
    //@Test
    public void testSearch() throws Exception {
    	System.out.println("456");
    	System.out.println(this.searchService);
        List<Pubmed> foos = this.searchService.search("aaaa", 1, 10);
        for (Pubmed foo : foos) {
            System.out.println(foo);
        }
    }
    
}
