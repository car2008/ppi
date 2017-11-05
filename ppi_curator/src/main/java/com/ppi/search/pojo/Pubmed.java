package com.ppi.search.pojo;

import java.util.Date;

import org.apache.solr.client.solrj.beans.Field;

public class Pubmed {
	@Field("id")
    private String id;
	@Field("version")
    private Long version;
	@Field("abstract_")
    private String abstractContents;
	@Field("date")
    private Date date;
    @Field("journal")
    private String journal;
    @Field("score")
    private Double score;
    @Field("taxonomy_id")
    private String taxonomyId;
    @Field("title")
    private String title;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }

    public String getAbstractContents() {
        return abstractContents;
    }

    public void setAbstractContents(String abstractContents) {
        this.abstractContents = abstractContents == null ? null : abstractContents.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getJournal() {
        return journal;
    }

    public void setJournal(String journal) {
        this.journal = journal == null ? null : journal.trim();
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public String getTaxonomyId() {
        return taxonomyId;
    }

    public void setTaxonomyId(String taxonomyId) {
        this.taxonomyId = taxonomyId == null ? null : taxonomyId.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }
}