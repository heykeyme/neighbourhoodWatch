package com.system.model;

import java.time.LocalDateTime;

public class IncidentItem {
    private int incidentId;
    private String userId;
    private String title;
    private LocalDateTime incidentTimeStamp;
    private String description;
    private String incidentCategory;
    private String severity;
    
    public int getIncidentId(){
        return incidentId;
    }
    
    public String getUserId(){
        return userId;
    }
    
    public String getTitle(){
        return title;    
    }
    
    public LocalDateTime getLocalDateTime(){
        return incidentTimeStamp;
    }
    
    public String getDescription(){
        return description;
    }
    
    public String getIncidentCategory(){
        return incidentCategory;
    }
    
    public String getSeverity(){
        return severity;
    }
    
    public IncidentItem(int incidentId, String userId, String title, LocalDateTime incidentTimeStamp, String description, String incidentCategory, String severity){
        this.incidentId = incidentId;
        this.userId = userId;
        this.title = title;
        this.incidentTimeStamp = incidentTimeStamp;
        this.description = description;
        this.incidentCategory = incidentCategory;
        this.severity = severity;
    }
    
    public IncidentItem(int incidentId, String title, String description){
        this.incidentId = incidentId;
        this.title = title;
        this.description = description;
    }
}
