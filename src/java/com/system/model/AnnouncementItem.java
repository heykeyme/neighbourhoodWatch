package com.system.model;

import java.time.LocalDate;

public class AnnouncementItem {
    private String announcementId;
    private String adminId;
    private String title;
    private String status;
    private String content;
    private LocalDate announcementDate;
    private String urgencyLevel;   
    
    //getters
    public String getAnnouncementId(){
        return announcementId;
    }
    
    public String getAdminId(){
        return adminId;
    }
    
    public String getTitle(){
        return title;
    }
    
    public String getStatus(){
        return status;
    }
    
    public String getContent(){
        return content;
    }
    
    public LocalDate getAnnouncementDate(){
        return announcementDate;
    }
    
    public String getUrgencyLevel(){
        return urgencyLevel;
    }
    
    //constructor
    public AnnouncementItem(String announcementId, String adminId, String title, String status, String content, LocalDate announcementDate, String urgencyLevel){
        this.announcementId = announcementId;
        this.adminId = adminId;
        this.title = title;
        this.status = status;
        this.content = content;
        this.announcementDate = announcementDate;
        this.urgencyLevel = urgencyLevel;
    }
}
