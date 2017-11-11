package com.ppi.search.pojo;

public class SentenceGoKey {
    private String sentenceId;

    private String goId;

    public String getSentenceId() {
        return sentenceId;
    }

    public void setSentenceId(String sentenceId) {
        this.sentenceId = sentenceId == null ? null : sentenceId.trim();
    }

    public String getGoId() {
        return goId;
    }

    public void setGoId(String goId) {
        this.goId = goId == null ? null : goId.trim();
    }
}