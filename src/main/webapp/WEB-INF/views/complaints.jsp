<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Complaints - College Complaint System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #a2dce2;
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
        }
        
        .header {
            background: #1e3a5f;
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 2em;
            margin-bottom: 10px;
        }
        
        .toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 30px;
            background: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }
        
        .filter-section {
            display: flex;
            gap: 10px;
        }
        
        .filter-select {
            padding: 8px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            font-size: 0.9em;
        }
        
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-size: 0.9em;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s;
        }
        
        .btn-primary {
            background: #1e3a5f;
            color: white;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(30, 58, 95, 0.4);
        }
        
        .complaints-section {
            padding: 30px;
        }
        
        .stats-bar {
            background: #e7f3ff;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
            color: #0066cc;
            font-weight: 600;
        }
        
        .complaint-card {
            background: #fff;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            transition: all 0.3s;
        }
        
        .complaint-card:hover {
            border-color: #667eea;
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.2);
            transform: translateY(-2px);
        }
        
        .complaint-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .complaint-id {
            font-size: 0.9em;
            color: #666;
            font-weight: 600;
        }
        
        .status-badge {
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 600;
        }
        
        .status-pending {
            background: #fff3cd;
            color: #856404;
        }
        
        .status-resolved {
            background: #d4edda;
            color: #155724;
        }
        
        .complaint-info {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-bottom: 15px;
        }
        
        .info-item {
            display: flex;
            flex-direction: column;
        }
        
        .info-label {
            font-size: 0.85em;
            color: #666;
            margin-bottom: 5px;
            font-weight: 600;
        }
        
        .info-value {
            color: #333;
            font-size: 1em;
        }
        
        .category-badge {
            display: inline-block;
            padding: 4px 12px;
            background: #667eea;
            color: white;
            border-radius: 15px;
            font-size: 0.85em;
        }
        
        .complaint-description {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-top: 15px;
            color: #333;
            line-height: 1.6;
        }
        
        .no-complaints {
            text-align: center;
            padding: 60px 20px;
            color: #666;
        }
        
        .no-complaints-icon {
            font-size: 4em;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>All Complaints</h1>
            <p>View and manage submitted complaints</p>
        </div>
        
        <div class="toolbar">
            <div class="filter-section">
                <form action="/complaints/filter" method="get" style="display: flex; gap: 10px; flex-wrap: wrap;">
                    <select name="category" class="filter-select">
                        <option value="">All Categories</option>
                        <option value="Wi-Fi Issues">Wi-Fi Issues</option>
                        <option value="Maintenance">Maintenance</option>
                        <option value="Mess/Cafeteria">Mess/Cafeteria</option>
                        <option value="Library">Library</option>
                        <option value="Hostel">Hostel</option>
                        <option value="Classroom">Classroom</option>
                        <option value="Events">Events</option>
                        <option value="Clubs">Clubs</option>
                        <option value="Faculty">Faculty</option>
                        <option value="Other">Other</option>
                    </select>
                    <select name="department" class="filter-select">
                        <option value="">All Departments</option>
                        <option value="Computer Science">Computer Science</option>
                        <option value="Electronics">Electronics</option>
                        <option value="Mechanical">Mechanical</option>
                        <option value="Civil">Civil</option>
                        <option value="Information Technology">Information Technology</option>
                        <option value="Electrical">Electrical</option>
                    </select>
                    <button type="submit" class="btn btn-primary">Filter</button>
                    <a href="/complaints" class="btn btn-secondary">Clear Filters</a>
                </form>
            </div>
            <a href="/" class="btn btn-primary">Submit New Complaint</a>
        </div>
        
        <div class="complaints-section">
            <div class="stats-bar">
                Total Complaints: ${totalComplaints}
                <c:if test="${filterApplied}"> (Filtered Results)</c:if>
            </div>
            
            <c:choose>
                <c:when test="${empty complaints}">
                    <div class="no-complaints">
                        <div class="no-complaints-icon">📭</div>
                        <h2>No Complaints Found</h2>
                        <p>There are currently no complaints to display.</p>
                        <a href="/" class="btn btn-primary" style="margin-top: 20px;">Submit First Complaint</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach var="complaint" items="${complaints}">
                        <div class="complaint-card">
                            <div class="complaint-header">
                                <div class="complaint-id">Complaint #${complaint.id}</div>
                                <div class="status-badge status-pending">${complaint.status}</div>
                            </div>
                            
                            <div class="complaint-info">
                                <div class="info-item">
                                    <div class="info-label">👤 Student Name</div>
                                    <div class="info-value">${complaint.studentName}</div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-label">🏢 Department</div>
                                    <div class="info-value">${complaint.department}</div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-label">📁 Category</div>
                                    <div class="info-value">
                                        <span class="category-badge">${complaint.category}</span>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-label">📅 Submitted On</div>
                                    <div class="info-value">${complaint.formattedDate}</div>
                                </div>
                            </div>
                            
                            <div class="complaint-description">
                                <strong>Description:</strong><br>
                                ${complaint.description}
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>