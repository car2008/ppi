package com.ppi.search.pojo;

import java.sql.Timestamp;

public abstract class BasePojo {
    
    private Timestamp dateCreated;
    private Timestamp dateUpdated;
	public Timestamp getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}
	public Timestamp getDateUpdated() {
		return dateUpdated;
	}
	public void setDateUpdated(Timestamp dateUpdated) {
		this.dateUpdated = dateUpdated;
	}
}
