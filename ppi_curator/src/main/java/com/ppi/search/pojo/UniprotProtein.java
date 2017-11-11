package com.ppi.search.pojo;

public class UniprotProtein {
    private Long id;

    private Long version;

    private String protein;

    private String uniprot;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }

    public String getProtein() {
        return protein;
    }

    public void setProtein(String protein) {
        this.protein = protein == null ? null : protein.trim();
    }

    public String getUniprot() {
        return uniprot;
    }

    public void setUniprot(String uniprot) {
        this.uniprot = uniprot == null ? null : uniprot.trim();
    }
}