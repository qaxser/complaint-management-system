package com.college.complaint;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ComplaintManagementApplication {
    
    public static void main(String[] args) {
        SpringApplication.run(ComplaintManagementApplication.class, args);
        System.out.println("Complaint Management System Started!");
        System.out.println("Access the application at: http://localhost:8080");
    }
}