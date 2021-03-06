package com.ppi.search.service;

import java.util.List;
import java.util.Map;

import com.ppi.search.pojo.Result;

public interface SearchService {
   public void add(Result resultInstance) throws Exception;

   public void delete(List<String> ids)throws Exception;

   public List<Result> search(String keywords, Integer page, Integer rows) throws Exception;
   
   public Map<String,Object> querySolr(String key,String taxonomy,String startDate,String endDate,int start,int size,Boolean hl,String sort,String order);

}
