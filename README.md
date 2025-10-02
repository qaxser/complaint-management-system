# College Complaint Management System

A web application built with Spring Boot, JSP, and MVC pattern to manage student complaints.

## Features
- Submit complaints with student details
- View all submitted complaints
- Filter complaints by category
- In-memory storage for complaints

## Technologies Used
- Spring Boot 3.2.0
- JSP (JavaServer Pages)
- Maven
- Java 17

## How to Run
1. Clone the repository
2. Navigate to project directory
3. Run: `mvn spring-boot:run`
4. Open browser: `http://localhost:8080`

## Project Structure
- Model: Complaint.java
- Service: ComplaintService.java
- Controller: ComplaintController.java
- Views: JSP files in src/main/webapp/WEB-INF/views/