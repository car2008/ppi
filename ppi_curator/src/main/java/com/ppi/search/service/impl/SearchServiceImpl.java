package com.ppi.search.service.impl;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.beans.DocumentObjectBinder;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.FacetField.Count;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.ppi.search.pojo.Result;
import com.ppi.search.service.SearchService;

@Service
@EnableTransactionManagement
public class SearchServiceImpl implements SearchService{
	
    private static Logger logger = Logger.getLogger(SearchServiceImpl.class);
    @Autowired
    private HttpSolrServer httpSolrServer;

   /**
    * 新增数据到solr服务
    * @param resultInstance
    * @throws Exception
    */
   @Override
   public void add(Result resultInstance) throws Exception {
       this.httpSolrServer.addBean(resultInstance); //添加数据到solr服务器
       this.httpSolrServer.commit(); //提交
   }
   @Override
   public void delete(List<String> ids) throws Exception {
       this.httpSolrServer.deleteById(ids);
       this.httpSolrServer.commit(); //提交
   }
   @Override
   public List<Result> search(String keywords, Integer page, Integer rows) throws Exception {
       SolrQuery solrQuery = new SolrQuery(); //构造搜索条件
       solrQuery.setQuery(keywords); //搜索关键词
       // 设置分页 start=0就是从0开始，，rows=5当前返回5条记录，第二页就是变化start这个值为5就可以了。
       solrQuery.setStart((Math.max(page, 1) - 1) * rows);
       solrQuery.setRows(rows);

       //是否需要高亮
       boolean isHighlighting = !StringUtils.equals("*", keywords) && StringUtils.isNotEmpty(keywords);

       if (isHighlighting) {
           // 设置高亮
           solrQuery.setHighlight(true); // 开启高亮组件
           solrQuery.addHighlightField("title");// 高亮字段
           solrQuery.setHighlightSimplePre("<em>");// 标记，高亮关键字前缀
           solrQuery.setHighlightSimplePost("</em>");// 后缀
       }

       // 执行查询
       QueryResponse queryResponse = this.httpSolrServer.query(solrQuery);
       //查询到的记录总数
       long totalRow = Long.valueOf(queryResponse.getResults().getNumFound()).intValue();
       System.out.println(totalRow);
       List<Result> resultInstances = queryResponse.getBeans(Result.class);
       if (isHighlighting) {
           // 将高亮的标题数据写回到数据对象中
           Map<String, Map<String, List<String>>> map = queryResponse.getHighlighting();
           for (Map.Entry<String, Map<String, List<String>>> highlighting : map.entrySet()) {
               for (Result resultInstance : resultInstances) {
                   if (!highlighting.getKey().equals(resultInstance.getPmid().toString())) {
                       continue;
                   }
                   resultInstance.setTitle(StringUtils.join(highlighting.getValue().get("title"), ""));
                   break;
               }
           }
       }

       return resultInstances;
   }
   
   @Override
   public Map<String,Object> querySolr(String key,String taxonomy,String startDate,String endDate,int start,int rows){  
       SolrQuery query = new SolrQuery();    
       SolrDocumentList list = new SolrDocumentList();  
       Map<String,Object> map = new HashMap<String, Object>(); 
       Map<String,Long> taxonomyStat = new HashMap<String, Long>();  
       Map<String,Long> yearStat = new HashMap<String, Long>();  
       Date now = new Date();  
       String dtStart = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(now);    
       System.out.println("开始时间：" + dtStart + "\n");   
       String params="";  
       
       if(StringUtils.isNotEmpty(key)){  
           //params=params+"title:"+key+" OR abstract:"+key+"";  
    	   params=params+key;  
       }  
          
       if(!StringUtils.isNotEmpty(params)){  
           params="*:*";   
       }
       //分片信息  
       query.setFacet(true)  
           .setFacetMinCount(1)  
           .setFacetLimit(1000)//段  
           .addFacetField("taxonomy","year");//分片字段
       
       query.setQuery(params);  
       query.setStart(start);  
       query.setRows(rows);    
       //query.addSort("timeStamp", ORDER.desc);
       Integer recordsTotal =null;
       try{
    	   QueryResponse response1 = httpSolrServer.query(query);     
           recordsTotal=(int) response1.getResults().getNumFound(); 
           Iterator taxits=response1.getFacetField("taxonomy").getValues().iterator();
           while(taxits.hasNext()){
        	   Count ct=(Count)taxits.next();
        	   taxonomyStat.put(ct.getName(), ct.getCount());
           }
           Iterator yearits=response1.getFacetField("year").getValues().iterator();
           while(yearits.hasNext()){
        	   Count ct=(Count)yearits.next();
        	   yearStat.put(ct.getName(), ct.getCount());
           }
           System.out.println(yearStat);
       }catch(Exception e){
    	   e.printStackTrace();
       }
       
       if(StringUtils.isNotEmpty(startDate)||StringUtils.isNotEmpty(endDate)){ 
   			String start1 = "*";
            if (!"*".equals(startDate)) {
                start1 = startDate+"T00:00:00Z";
            }
            
            String end1 = "*";
            if (!"*".equals(endDate)) {
                end1 = endDate+"T23:59:59Z";
            }
    	   query.setFilterQueries("date:"+start1+" To "+end1);
       }
       
       if(StringUtils.isNotEmpty(taxonomy)){ 
  		   String taxonomy1 = "*";
           if (!"*".equals(taxonomy)) {
               taxonomy1 = taxonomy+"*";
           }
   	   query.setFilterQueries("taxonomy:"+taxonomy1);
      }
       //设置高亮  
       query.setHighlight(true); // 开启高亮组件  
       query.set("hl.highlightMultiTerm","true");//启用多字段高亮  
       query.addHighlightField("abstract");// 高亮字段  
       query.addHighlightField("title");// 高亮字段  
       query.setHighlightSimplePre("<font color='red'>");//标记，高亮关键字前缀  
       query.setHighlightSimplePost("</font>");//后缀  
       query.setHighlightSnippets(2);//结果分片数，默认为1  
       query.setHighlightFragsize(1000);//每个分片的最大长度，默认为100  
       query.setQuery(params);  
       
       logger.info("-----------query="+query); 
       System.out.println("query="+query);
       
       try {  
           QueryResponse response = httpSolrServer.query(query);     
           list = response.getResults();  
           System.out.println("++++++++++++++" +list.toString()); 
           //Integer recordsTotal=(int) list.getNumFound();  
           logger.info("counts:"+recordsTotal);  
           //page.setCounts(counts);  
           //获取所有高亮的字段  
           Map<String,Map<String,List<String>>> highlightMap=response.getHighlighting();  
           for (SolrDocument sd : list) {  
               if(null!=highlightMap.get(sd.getFieldValue("pmid").toString()).get("title")){  
                   sd.setField("title",highlightMap.get(sd.getFieldValue("pmid").toString()).get("title").toString());                    
               }  
               if(null!=highlightMap.get(sd.getFieldValue("pmid").toString()).get("abstract")){  
                   sd.setField("abstract", highlightMap.get(sd.getFieldValue("pmid").toString()).get("abstract").toString());   
               }  
   
           }   
           DocumentObjectBinder binder = new DocumentObjectBinder();             
           List<Result> nlist = binder.getBeans(Result.class, list); 
           Map results = new HashMap<String,Object>(); 
           for(Result result:nlist){
        	   Map reMap = new HashMap<String,Object>(); 
        	   reMap.put("title",result.getTitle() );
        	   reMap.put("date",result.getDate() );
        	   reMap.put("year",result.getYear() );
        	   reMap.put("taxonomy",result.getTaxonomy() );
        	   reMap.put("journal",result.getJournal() );
        	   reMap.put("ref",result.getRef() );
        	   reMap.put("proteinnames",result.getProteinnames() );
        	   reMap.put("text",result.getText() );
        	   reMap.put("abstract",result.getAbstractContent() );
        	   reMap.put("pmid", result.getPmid());
        	   results.put(result.getPmid(), reMap);
           }
           map.put("recordsTotal", recordsTotal);  
           map.put("records", results);  
           map.put("taxonomyStat", taxonomyStat);
           map.put("yearStat",yearStat);
           System.out.println(recordsTotal);
           System.out.println("map.size----"+results.size());
           System.out.println("taxonomyStat"+taxonomyStat);
           //httpSolrServer.shutdown();     
       } catch (Exception e) {  
           e.printStackTrace();  
       }  
       return map;  
   } 

}
