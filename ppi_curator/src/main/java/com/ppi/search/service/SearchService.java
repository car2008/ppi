package com.ppi.search.service;

import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppi.common.SysResult;

@Service
public class SearchService {

   /* @Autowired
    private HttpSolrServer httpSolrServer;

    public SysResult search(String keyWords, Integer page, Integer rows) {
        // 构造搜索对象
        SolrQuery solrQuery = new SolrQuery();
        solrQuery.setQuery(keyWords);

        // 分页数据
        solrQuery.setStart((Math.max(1, page) - 1) * rows);
        solrQuery.setRows(rows);

        // 设置高亮显示
        solrQuery.setHighlight(true);// 开启高亮
        solrQuery.setHighlightSimplePre("<span class=\"red\">");
        solrQuery.setHighlightSimplePost("</span>");
        solrQuery.addHighlightField("title");

        try {
            QueryResponse queryResponse = this.httpSolrServer.query(solrQuery);
            List<Item> items = queryResponse.getBeans(Item.class);
            if (items == null || items.isEmpty()) {
                return SysResult.build(200, "没有搜索到数据!");
            }
            // 将高亮的标题数据写回到数据对象中
            Map<String, Map<String, List<String>>> map = queryResponse.getHighlighting();
            for (Map.Entry<String, Map<String, List<String>>> highlighting : map.entrySet()) {
                for (Item item : items) {
                    if (!highlighting.getKey().equals(item.getId().toString())) {
                        continue;
                    }
                    item.setTitle(StringUtils.join(highlighting.getValue().get("title"), ""));
                    break;
                }
            }
            return SysResult.build(200, String.valueOf(queryResponse.getResults().getNumFound()), items);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SysResult.build(201, "搜索错误!");
    }*/

}
