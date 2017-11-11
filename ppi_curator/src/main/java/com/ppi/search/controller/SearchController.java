package com.ppi.search.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ppi.search.pojo.News;
import com.ppi.search.pojo.Pubmed;
import com.ppi.search.pojo.Taxonomy;
import com.ppi.search.service.SearchService;
import com.ppi.search.service.TaxonomyService;


@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;
    @Autowired
    private TaxonomyService taxonomyService;

    /**
     * 通过关键字搜索
     * 
     * @param keyWords
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "search", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView search(@RequestParam("key") String key,@RequestParam("time") Integer time,@RequestParam("taxonomy") String taxonomy, @RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,@RequestParam("wandCode") String wandCode,@RequestParam("start") Integer start, @RequestParam("rows") Integer rows) throws Exception {
    	Map<String,Object> resultMap = this.searchService.querySolr(key,time,taxonomy,startDate,endDate,wandCode,start,rows);
    	List popularTaxonomies = new ArrayList<Taxonomy>();
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("9606"));
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("10090"));
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("10116"));
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("9913"));
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("7955"));
    	Long[] array = new Long[]{10l,20l,50l,100l};
    	System.out.println("resultMap:"+resultMap);
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("q",key);
    	mv.addObject("time",time);
    	mv.addObject("taxonomy",taxonomy);
    	mv.addObject("start",startDate);
    	mv.addObject("end",endDate);
    	mv.addObject("wandCode",wandCode);
    	mv.addObject("offset",start);
    	mv.addObject("max",rows);
    	mv.addObject("batch",false);
    	mv.addObject("success",true);
    	mv.addObject("ab",true);
    	mv.addObject("hl",true);
    	mv.addObject("sort","score");
    	mv.addObject("order","desc");
    	mv.addObject("numFound",resultMap.get("recordsTotal"));
    	mv.addObject("records", resultMap.get("records"));
    	mv.addObject("popularTaxonomies", popularTaxonomies);
    	mv.setViewName("jsp/search/pubmed1");    
        return mv;
    }
    
    @RequestMapping("/search/{key}/{time}/{taxonomy}/{startDate}/{endDate}/{wandCode}/{start}/{rows}")
    public ModelAndView pubmed(@PathVariable("key") String key,@PathVariable("time") Integer time,@PathVariable("taxonomy") String taxonomy,@PathVariable("startDate") String startDate,@PathVariable("endDate") String endDate,@PathVariable("wandCode") String wandCode,@PathVariable("start") Integer start,@PathVariable("rows") Integer rows) {
    	Map<String,Object> resultMap = this.searchService.querySolr(key,time,taxonomy,startDate,endDate,wandCode,start,rows);
    	List popularTaxonomies = new ArrayList<Taxonomy>();
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("9606"));
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("10090"));
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("10116"));
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("9913"));
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("7955"));
    	Long[] array = new Long[]{10l,20l,50l,100l};
    	System.out.println("resultMap:"+resultMap);
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("q",key);
    	mv.addObject("time",time);
    	mv.addObject("taxonomy",taxonomy);
    	mv.addObject("start",startDate);
    	mv.addObject("end",endDate);
    	mv.addObject("wandCode",wandCode);
    	mv.addObject("offset",start);
    	mv.addObject("max",rows);
    	mv.addObject("batch",false);
    	mv.addObject("success",true);
    	mv.addObject("ab",true);
    	mv.addObject("hl",true);
    	mv.addObject("sort","score");
    	mv.addObject("order","desc");
    	mv.addObject("numFound",resultMap.get("recordsTotal"));
    	mv.addObject("records", resultMap.get("records"));
    	mv.addObject("popularTaxonomies", popularTaxonomies);
    	mv.setViewName("jsp/search/pubmed1");    
        return mv;
    }
    
    
}
