package com.ppi.search.pojo;

import java.util.Date;

public class UpdateRecord {
    private Long id;

    private Long version;

    private Date dateCreated;

    private Date lastUpdated;

    private String paramEndDate;

    private String paramStartDate;

    private Integer progress;

    private String status;

    private Date updateFinish;

    private Date updateStart;

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

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    public String getParamEndDate() {
        return paramEndDate;
    }

    public void setParamEndDate(String paramEndDate) {
        this.paramEndDate = paramEndDate == null ? null : paramEndDate.trim();
    }

    public String getParamStartDate() {
        return paramStartDate;
    }

    public void setParamStartDate(String paramStartDate) {
        this.paramStartDate = paramStartDate == null ? null : paramStartDate.trim();
    }

    public Integer getProgress() {
        return progress;
    }

    public void setProgress(Integer progress) {
        this.progress = progress;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Date getUpdateFinish() {
        return updateFinish;
    }

    public void setUpdateFinish(Date updateFinish) {
        this.updateFinish = updateFinish;
    }

    public Date getUpdateStart() {
        return updateStart;
    }

    public void setUpdateStart(Date updateStart) {
        this.updateStart = updateStart;
    }
}