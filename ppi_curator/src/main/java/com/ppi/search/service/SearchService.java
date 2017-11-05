package com.ppi.search.service;

import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.commons.lang3.StringUtils;

import com.ppi.common.SysResult;
import com.ppi.search.pojo.Pubmed;

public interface SearchService {
   public void add(Pubmed pubmedInstance) throws Exception;

   public void delete(List<String> ids)throws Exception;

   public List<Pubmed> search(String keywords, Integer page, Integer rows) throws Exception;

}
