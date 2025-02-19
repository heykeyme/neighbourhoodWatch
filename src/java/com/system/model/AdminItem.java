package com.system.model;

public class AdminItem {
    private String adminId;
    private String incidentId;
    private String phoneNumber;
    private String email;
    private String role;
    private String address;
    private String username;
    private String password;
    
    //getters
    public String getAdminId(){
        return adminId;
    }

    public String getIncidentId(){
        return incidentId;
    }
      
    public String getPhoneNumber(){
        return phoneNumber;
    }
    
    public String getEmail(){
        return email;
    }
    
    public String getRole(){
        return role;
    }
    
    public String getAddress(){
        return address;
    }
    
    public String getUsername(){
        return username;
    }
    
    public String getPassword(){
        return password;
    }
    
    //constructor
    public AdminItem(String adminId, String incidentId, String phoneNumber, String email, String role, String address,String username, String password){
        this.adminId = adminId;
        this.incidentId = incidentId;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.role = role;
        this.address = address;
        this.username = username;
        this.password = password;
    }
}
