package com.ppi.search.pojo;

public class PubmedGoKey {
    private String pubmedId;

    private String goId;

    public String getPubmedId() {
        return pubmedId;
    }

    public void setPubmedId(String pubmedId) {
        this.pubmedId = pubmedId == null ? null : pubmedId.trim();
    }

    public String getGoId() {
        return goId;
    }

    public void setGoId(String goId) {
        this.goId = goId == null ? null : goId.trim();
    }
}