package com.ppi.search.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView search(@RequestParam("q") String q,@RequestParam("taxonomy") String taxonomy, @RequestParam("start") String start,@RequestParam("end") String end,@RequestParam("offset") Integer offset, @RequestParam("max") Integer max, @RequestParam("ab") Boolean ab, @RequestParam("hl") Boolean hl,@RequestParam("sort") String sort,@RequestParam("order") String order){
    	if(taxonomy==null||"".equals(taxonomy)){
    		taxonomy="*";
    	}
    	if(ab==null){
    		ab=true;
    	}
    	if(hl==null){
    		hl=true;
    	}
    	if(sort==null){
    		sort="score";
    	}
    	if(order==null){
    		order="desc";
    	}
    	Map<String,Object> resultMap = this.searchService.querySolr(q,taxonomy,start,end,offset,max,hl,sort,order);
    	Map<String,Object> otherTaxonomies = new LinkedHashMap<String,Object>();
    	List<Taxonomy> popularTaxonomies = new ArrayList<Taxonomy>();
    	String[] taxArray = new String[]{"9606","10090","10116","9913","7955"};
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("9606"));
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("10090"));
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("10116"));
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("9913"));
    	popularTaxonomies.add(taxonomyService.selectByPrimaryKey("7955"));
    	Map<String,Object> taxonomyStat = (Map) resultMap.get("taxonomyStat");
		if(taxonomyStat!=null){
	    	for(Map.Entry e:taxonomyStat.entrySet()){
				if(!Arrays.asList(taxArray).contains(e.getKey())){
					LinkedHashMap m = new LinkedHashMap();
					m.put("taxonomy", taxonomyService.selectByPrimaryKey((String)e.getKey()).getScientificName());
					m.put("count", e.getValue());
					otherTaxonomies.put((String)e.getKey(), m);
				}
			}
		}
    	Long[] array = new Long[]{10l,20l,50l,100l};
    	String[] yearArray = new String[]{"2017","2016","2015","2014","2013"};
    	//System.out.println("resultMap:"+resultMap);
    	ModelAndView mv = new ModelAndView();
    	int totals = (int)resultMap.get("recordsTotal");
    	mv.addObject("page",1);
    	mv.addObject("totalPages",totals % max == 0 ? totals / max : totals / max + 1);
    	mv.addObject("q",q);
    	mv.addObject("taxonomy",taxonomy);
    	mv.addObject("start",start);
    	mv.addObject("end",end);
    	mv.addObject("offset",offset);
    	mv.addObject("max",max);
    	mv.addObject("batch",false);
    	mv.addObject("success",true);
    	mv.addObject("ab",ab);
    	mv.addObject("hl",hl);
    	mv.addObject("sort",sort);
    	mv.addObject("order",order);
    	mv.addObject("numFound",totals);
    	mv.addObject("records", resultMap.get("records"));
    	mv.addObject("taxonomyStat", resultMap.get("taxonomyStat"));
    	mv.addObject("yearStat", resultMap.get("yearStat"));
    	mv.addObject("popularTaxonomies", popularTaxonomies);
    	mv.addObject("yearArray", yearArray);
    	mv.addObject("array", array);
    	mv.addObject("otherTaxonomies",otherTaxonomies);
    	mv.setViewName("jsp/search/pubmed1");    
        return mv;
    }
    
    @RequestMapping("/pubmed/{q}/{taxonomy}/{start}/{end}/{offset}/{max}/{flag}/{highlight}/{sorts}/{orders}")
    public ModelAndView pubmed(@PathVariable("q") String q,@PathVariable("taxonomy") String taxonomy,@PathVariable("start") String start ,@PathVariable("end") String end,@PathVariable("offset") Integer offset,@PathVariable("max") Integer max,@PathVariable("flag") Boolean flag,@PathVariable("highlight") Boolean highlight,@PathVariable("sorts") String sorts,@PathVariable("orders") String orders) {
    	//System.out.println(ab+"\\\\\\\\\\\\");
    	return search(q,taxonomy,start,end,offset,max,flag,highlight,sorts,orders);
    }
    @RequestMapping("/getpage/{q}/{taxonomy}/{start}/{end}/{offset}/{max}/{flag}/{highlight}/{sorts}/{orders}/{currentPages}/{totals}")
    public ModelAndView getPage(@PathVariable("q") String q,@PathVariable("taxonomy") String taxonomy,@PathVariable("start") String start ,@PathVariable("end") String end,@PathVariable("offset") Integer offset,@PathVariable("max") Integer max,@PathVariable("flag") Boolean flag,@PathVariable("highlight") Boolean highlight,@PathVariable("sorts") String sorts,@PathVariable("orders") String orders,@PathVariable("currentPages") String currentPages,@PathVariable("totals")int totals){
    	int page;
        try {
            //当前页数
            page = Integer.valueOf(currentPages);
        } catch (NumberFormatException e) {
            page = 1;
        }
        //总数
        int totalRecords = totals;
        //每页数
        int recordPerPage = max;
        //总页数
        int totalPages = totalRecords % recordPerPage == 0 ? totalRecords / recordPerPage : totalRecords / recordPerPage + 1;
        //本页起始序号
        int beginIndex = (page - 1) * recordPerPage;
        //本页末尾序号的下一个
        int endIndex = beginIndex + recordPerPage;
        if (endIndex > totalRecords)endIndex = totalRecords;
        ModelAndView mv =search(q,taxonomy,start,end,beginIndex,max,flag,highlight,sorts,orders);
        mv.addObject("page",page);
        return mv;
    }
    
}
