import java.sql.Timestamp;

public class AnnouncementItem {
    private int id;
    private int adminId;
    private String title;
    private String content;
    private Timestamp date;
    private String urgency;

    // Constructor
    public AnnouncementItem(int id, int adminId, String title, String content, Timestamp date, String urgency) {
        this.id = id;
        this.adminId = adminId;
        this.title = title;
        this.content = content;
        this.date = date;
        this.urgency = urgency;
    }
    
    public AnnouncementItem(String title, String content){
        this.title = title;
        this.content = content;
    }

    // Getters
    public int getId() { 
        return id; 
    }
    
    public int getAdminId() {
        return adminId; 
    }
    
    public String getTitle() { 
        return title; 
    }
    
    public String getContent() { 
        return content; 
    }
    
    public Timestamp getDate() { 
        return date; 
    }
    
    public String getUrgency() { 
        return urgency; 
    }
    
}
