package com.college.complaint.service;

import com.college.complaint.model.Complaint;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Service class for managing complaints
 * @Service annotation marks this as a service component for dependency injection
 */
@Service
public class ComplaintService {
    
    // In-memory storage for complaints
    private final List<Complaint> complaints = new ArrayList<>();
    private final AtomicLong idCounter = new AtomicLong(1);
    
    /**
     * Save a new complaint
     */
    public Complaint saveComplaint(Complaint complaint) {
        complaint.setId(idCounter.getAndIncrement());
        complaints.add(complaint);
        System.out.println("Complaint saved: " + complaint);
        return complaint;
    }
    
    /**
     * Get all complaints
     */
    public List<Complaint> getAllComplaints() {
        return new ArrayList<>(complaints);
    }
    
    /**
     * Get complaint by ID
     */
    public Complaint getComplaintById(Long id) {
        return complaints.stream()
                .filter(c -> c.getId().equals(id))
                .findFirst()
                .orElse(null);
    }
    
    /**
     * Get complaints by category
     */
    public List<Complaint> getComplaintsByCategory(String category) {
        List<Complaint> filtered = new ArrayList<>();
        for (Complaint c : complaints) {
            if (c.getCategory().equalsIgnoreCase(category)) {
                filtered.add(c);
            }
        }
        return filtered;
    }
    
    /**
     * Get complaints by department
     */
    public List<Complaint> getComplaintsByDepartment(String department) {
        List<Complaint> filtered = new ArrayList<>();
        for (Complaint c : complaints) {
            if (c.getDepartment().equalsIgnoreCase(department)) {
                filtered.add(c);
            }
        }
        return filtered;
    }
    
    /**
     * Update complaint status
     */
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