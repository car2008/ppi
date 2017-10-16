package com.ppi.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ppi.common.SysResult;
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
     */
    @RequestMapping(value = "search", method = RequestMethod.POST)
    @ResponseBody
    public SysResult search(@RequestParam("keyWords") String keyWords, @RequestParam("page") Integer page,
            @RequestParam("rows") Integer rows) {
        return this.searchService.search(keyWords, page, rows);
    }
    
}
