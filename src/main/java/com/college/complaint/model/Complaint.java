package com.college.complaint.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Complaint {
    
    private String studentName;
    private String department;
    private String category;
    private String description;
    private LocalDateTime submittedAt;
    
    public Complaint() {
        this.submittedAt = LocalDateTime.now();
    }
    
    public Complaint(String studentName, String department, 
                     String category, String description) {
        this.studentName = studentName;
        this.department = department;
        this.category = category;
        this.description = description;
        this.submittedAt = LocalDateTime.now();
    }
    
    public String getStudentName() {
        return studentName;
    }
    
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
    
    public String getDepartment() {
        return department;
    }
    
    public void setDepartment(String department) {
        this.department = department;
    }
    
    public String getCategory() {
        return category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public LocalDateTime getSubmittedAt() {
        return submittedAt;
    }
    
    public void setSubmittedAt(LocalDateTime submittedAt) {
        this.submittedAt = submittedAt;
    }
    
    public String getFormattedDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
        return submittedAt.format(formatter);
    }
    
    @Override
    public String toString() {
        return "Complaint{" +
                "studentName='" + studentName + '\'' +
                ", department='" + department + '\'' +
                ", category='" + category + '\'' +
                ", submittedAt=" + submittedAt +
                '}';
    }
}