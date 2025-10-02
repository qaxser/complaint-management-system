
package com.college.complaint.controller;

import com.college.complaint.model.Complaint;
import com.college.complaint.service.ComplaintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ComplaintController {
    
    // Dependency Injection using @Autowired
    private final ComplaintService complaintService;
    
    @Autowired
    public ComplaintController(ComplaintService complaintService) {
        this.complaintService = complaintService;
    }
    
    /**
     * Display home page with complaint form
     */
    @GetMapping("/")
    public String showHomePage(Model model) {
        model.addAttribute("complaint", new Complaint());
        model.addAttribute("totalComplaints", complaintService.getComplaintCount());
        return "index";
    }
    
    /**
     * Handle complaint submission
     */
    @PostMapping("/submit-complaint")
    public String submitComplaint(@ModelAttribute Complaint complaint, Model model) {
        complaintService.saveComplaint(complaint);
        model.addAttribute("message", "Complaint submitted successfully!");
        model.addAttribute("complaint", new Complaint());
        model.addAttribute("totalComplaints", complaintService.getComplaintCount());
        return "index";
    }
    
    /**
     * Display all complaints
     */
    @GetMapping("/complaints")
    public String viewComplaints(Model model) {
        List<Complaint> complaints = complaintService.getAllComplaints();
        model.addAttribute("complaints", complaints);
        model.addAttribute("totalComplaints", complaints.size());
        return "complaints";
    }
    
    /**
     * Filter complaints by category
     */
    @GetMapping("/complaints/filter")
    public String filterComplaints(@RequestParam(required = false) String category,
                                   @RequestParam(required = false) String department,
                                   Model model) {
        List<Complaint> complaints;
        
        if (category != null && !category.isEmpty()) {
            complaints = complaintService.getComplaintsByCategory(category);
        } else if (department != null && !department.isEmpty()) {
            complaints = complaintService.getComplaintsByDepartment(department);
        } else {
            complaints = complaintService.getAllComplaints();
        }
        
        model.addAttribute("complaints", complaints);
        model.addAttribute("totalComplaints", complaints.size());
        model.addAttribute("filterApplied", true);
        return "complaints";
    }
}
