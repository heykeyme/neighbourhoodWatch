package com.system.model;

public class IncidentStatusItem {
    private String incidentStatusId;
    private String incidentId;
    private String statusDescription;
    private String priority;
    private String assignedTo;
    private String updatedBy;
    private String resolutionDetails;
    
    // getters
    public String getIncidentStatusId(){
        return incidentStatusId;
    }
    
    public String getIncidentId(){
        return incidentId;
    }
    
    public String getStatusDescription(){
        return statusDescription;
    }
    
    public String getPriority(){
        return priority;
    }
    
    public String getAssignedTo(){
        return assignedTo;
    }
    
    public String getUpdatedBy(){
        return updatedBy;
    }
    
    public String getResolutionDetails(){
        return resolutionDetails;
    }
    
    //constructor
    public IncidentStatusItem(String incidentStatusId, String incidentId, String statusDescription, String priority, String assignedTo, String updatedBy, String resolutionDetails){
        this.incidentStatusId = incidentStatusId;
        this.incidentId = incidentId;
        this.statusDescription = statusDescription;
        this.priority = priority;
        this.assignedTo = assignedTo;
        this.updatedBy = updatedBy;
        this.resolutionDetails = resolutionDetails;
    }
}
