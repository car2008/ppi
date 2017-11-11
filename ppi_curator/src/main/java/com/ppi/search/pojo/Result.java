package com.ppi.search.pojo;

import java.util.ArrayList;
import java.util.Date;

import org.apache.solr.client.solrj.beans.Field;
/**
 * 封装solr查询结果的pojo
 * @author Administrator
 * 注意：如果字段和solr中的field相同，就只加@Field。如果不一致，加@Field(“abstract”)
 */
public class Result {
	@Field
	String pmid;
	@Field
	String title;
	@Field("abstract")
	String abstractContent;
	@Field("date")
	Date date;
	@Field("year")
	String year;
	@Field("taxonomy")
	String taxonomy;
	@Field("journal")
	String journal;
	@Field("ref")
	String ref;
	@Field("proteinnames")
	ArrayList proteinnames;
	@Field("text")
	String text;
	public String getPmid() {
		return pmid;
	}
	public void setPmid(String pmid) {
		this.pmid = pmid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAbstractContent() {
		return abstractContent;
	}
	public void setAbstractContent(String abstractContent) {
		this.abstractContent = abstractContent;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getTaxonomy() {
		return taxonomy;
	}
	public void setTaxonomy(String taxonomy) {
		this.taxonomy = taxonomy;
	}
	public String getJournal() {
		return journal;
	}
	public void setJournal(String journal) {
		this.journal = journal;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public ArrayList getProteinnames() {
		return proteinnames;
	}
	public void setProteinnames(ArrayList proteinnames) {
		this.proteinnames = proteinnames;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	
	
}
