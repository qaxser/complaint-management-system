<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Complaint Management System</title>
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
            max-width: 800px;
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
        
        .header p {
            opacity: 0.9;
        }
        
        .stats {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            background: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }
        
        .stat-card {
            text-align: center;
        }
        
        .stat-number {
            font-size: 2em;
            font-weight: bold;
            color: #667eea;
        }
        
        .stat-label {
            color: #6c757d;
            font-size: 0.9em;
        }
        
        .success-message {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            margin: 20px;
            border-radius: 8px;
            border-left: 4px solid #28a745;
        }
        
        .form-section {
            padding: 30px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
        }
        
        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1em;
            transition: all 0.3s;
        }
        
        input[type="text"]:focus,
        select:focus,
        textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        textarea {
            resize: vertical;
            min-height: 100px;
        }
        
        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        
        .btn-primary {
            background: #1e3a5f;
            color: white;
            flex: 1;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(30, 58, 95, 0.4);
        }
        
        .btn-secondary {
            background: #6c757d;
            color: white;
        }
        
        .btn-secondary:hover {
            background: #5a6268;
        }
        
        .required {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Complaint Management System</h1>
            <p>Submit your complaints and help us improve campus facilities</p>
        </div>
        
        <c:if test="${not empty message}">
            <div class="success-message">
                ✓ ${message}
            </div>
        </c:if>
        
        <div class="form-section">
            <h2 style="margin-bottom: 20px; color: #333;">Submit a Complaint</h2>
            
            <form action="/submit-complaint" method="post">
                <div class="form-group">
                    <label for="studentName">Student Name <span class="required">*</span></label>
                    <input type="text" id="studentName" name="studentName" required 
                           placeholder="Enter your full name">
                </div>
                
                <div class="form-group">
                    <label for="department">Department <span class="required">*</span></label>
                    <select id="department" name="department" required>
                        <option value="">-- Select Department --</option>
                        <option value="Computer Science">Computer Science</option>
                        <option value="Electronics">Electronics</option>
                        <option value="Mechanical">Mechanical</option>
                        <option value="Civil">Civil</option>
                        <option value="Information Technology">Information Technology</option>
                        <option value="Electrical">Electrical</option>
                        <option value="Law">Law</option>
                        <option value="Fashion">Fashion Science</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="category">Complaint Category <span class="required">*</span></label>
                    <select id="category" name="category" required>
                        <option value="">-- Select Category --</option>
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
                </div>
                
                <div class="form-group">
                    <label for="description">Complaint Description <span class="required">*</span></label>
                    <textarea id="description" name="description" required 
                              placeholder="Provide detailed information about your complaint..."></textarea>
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn btn-primary">Submit Complaint</button>
                    <a href="/complaints" class="btn btn-secondary">View All Complaints</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>