package com.ppi.search.pojo;

public class Taxonomy {
    private String id;

    private Long version;

    private String commonName;

    private String genbankCommonName;

    private String scientificName;

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

    public String getCommonName() {
        return commonName;
    }

    public void setCommonName(String commonName) {
        this.commonName = commonName == null ? null : commonName.trim();
    }

    public String getGenbankCommonName() {
        return genbankCommonName;
    }

    public void setGenbankCommonName(String genbankCommonName) {
        this.genbankCommonName = genbankCommonName == null ? null : genbankCommonName.trim();
    }

    public String getScientificName() {
        return scientificName;
    }

    public void setScientificName(String scientificName) {
        this.scientificName = scientificName == null ? null : scientificName.trim();
    }
}