package com.system.model;

import java.time.LocalDate;

public class AdminIncidentItem {
    private String adminIncidentId;
    private String adminId;
    private String incidentId;
    private LocalDate assignedDate;
    private LocalDate resolutionDate;
    private String incidentCategory;
    private String severity;
    
    //getters
    public String getAdminIncidentId(){
        return adminIncidentId;
    }
    
    public String getAdminId(){
        return adminId;
    }
    
    public String getincidentId(){
        return incidentId;
    }
    
    public LocalDate getAssignedDate(){
        return assignedDate;
    }
    
    public LocalDate getResolutionDate(){
        return resolutionDate;
    } 
    
    public String getIncidentCategory(){
        return incidentCategory;
    }
    
    public String getSeverity(){
        return severity;
    }
    
    //constructor
    public AdminIncidentItem(String adminIncidentId, String adminId, String incidentId, LocalDate assignedDate, LocalDate resolutionDate, String incidentCategory, String severity){
        this.adminIncidentId = adminIncidentId;
        this.adminId = adminId;
        this.incidentId = incidentId;
        this.assignedDate = assignedDate;
        this.resolutionDate = resolutionDate;
        this.incidentCategory = incidentCategory;
        this.severity = severity;
    }
}
