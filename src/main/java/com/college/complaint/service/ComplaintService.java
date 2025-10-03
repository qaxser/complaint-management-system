package com.college.complaint.service;

import com.college.complaint.model.Complaint;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class ComplaintService {
    
    private final List<Complaint> complaints = new ArrayList<>();
    
    public Complaint saveComplaint(Complaint complaint) {
        complaints.add(complaint);
        System.out.println("Complaint saved: " + complaint);
        return complaint;
    }
    
    public List<Complaint> getAllComplaints() {
        return new ArrayList<>(complaints);
    }
    
    public List<Complaint> getComplaintsByCategory(String category) {
        List<Complaint> filtered = new ArrayList<>();
        for (Complaint c : complaints) {
            if (c.getCategory().equalsIgnoreCase(category)) {
                filtered.add(c);
            }
        }
        return filtered;
    }
    
    public List<Complaint> getComplaintsByDepartment(String department) {
        List<Complaint> filtered = new ArrayList<>();
        for (Complaint c : complaints) {
            if (c.getDepartment().equalsIgnoreCase(department)) {
                filtered.add(c);
            }
        }
        return filtered;
    }
    
    public int getComplaintCount() {
        return complaints.size();
    }
}