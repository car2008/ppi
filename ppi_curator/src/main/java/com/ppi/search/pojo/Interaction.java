package com.ppi.search.pojo;

public class Interaction {
    private String id;

    private Long version;

    private String direction;

    private String effect;

    private String normalizedVerb;

    private String protein1;

    private String protein2;

    private String pubmedId;

    private Double score;

    private String sentenceId;

    private String verb;

    private String info;

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

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction == null ? null : direction.trim();
    }

    public String getEffect() {
        return effect;
    }

    public void setEffect(String effect) {
        this.effect = effect == null ? null : effect.trim();
    }

    public String getNormalizedVerb() {
        return normalizedVerb;
    }

    public void setNormalizedVerb(String normalizedVerb) {
        this.normalizedVerb = normalizedVerb == null ? null : normalizedVerb.trim();
    }

    public String getProtein1() {
        return protein1;
    }

    public void setProtein1(String protein1) {
        this.protein1 = protein1 == null ? null : protein1.trim();
    }

    public String getProtein2() {
        return protein2;
    }

    public void setProtein2(String protein2) {
        this.protein2 = protein2 == null ? null : protein2.trim();
    }

    public String getPubmedId() {
        return pubmedId;
    }

    public void setPubmedId(String pubmedId) {
        this.pubmedId = pubmedId == null ? null : pubmedId.trim();
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public String getSentenceId() {
        return sentenceId;
    }

    public void setSentenceId(String sentenceId) {
        this.sentenceId = sentenceId == null ? null : sentenceId.trim();
    }

    public String getVerb() {
        return verb;
    }

    public void setVerb(String verb) {
        this.verb = verb == null ? null : verb.trim();
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info == null ? null : info.trim();
    }
}