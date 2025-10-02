package com.college.complaint.service;

import com.college.complaint.model.Complaint;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;


@Service
public class ComplaintService {
    
    private final List<Complaint> complaints = new ArrayList<>();
    private final AtomicLong idCounter = new AtomicLong(1);
    
    public Complaint saveComplaint(Complaint complaint) {
        complaint.setId(idCounter.getAndIncrement());
        complaints.add(complaint);
        System.out.println("Complaint saved: " + complaint);
        return complaint;
    }
    
    public List<Complaint> getAllComplaints() {
        return new ArrayList<>(complaints);
    }
    
    public Complaint getComplaintById(Long id) {
        return complaints.stream()
                .filter(c -> c.getId().equals(id))
                .findFirst()
                .orElse(null);
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
    
    public boolean updateComplaintStatus(Long id, String status) {
        Complaint complaint = getComplaintById(id);
        if (complaint != null) {
            complaint.setStatus(status);
            return true;
        }
        return false;
    }
    
    public int getComplaintCount() {
        return complaints.size();
    }
}