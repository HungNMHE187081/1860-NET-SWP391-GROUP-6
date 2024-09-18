<%-- 
    Document   : staffserviceslist
    Created on : Sep 18, 2024, 9:00:09 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Service List</title>
    <link rel="stylesheet" href="staff.css">
    <script>
        function showSection(sectionId) {
            var sections = document.getElementsByClassName('section');
            for (var i = 0; i < sections.length; i++) {
                sections[i].style.display = 'none';
            }
            document.getElementById(sectionId).style.display = 'block';
        }
    </script>
</head>
<body>
    <div class="wrapper">
        <nav class="sidebar">
            <div class="sidebar-header">
                <h2>Dashboard</h2>
            </div>
            <ul class="list-unstyled components">
                <li><a href="#" onclick="showSection('home')">Home</a></li>
                <li><a href="#" onclick="showSection('services')">Services</a></li>
                <li><a href="#" onclick="showSection('staff')">Staff</a></li>
                <li><a href="#" onclick="showSection('reports')">Reports</a></li>
                <li><a href="#" onclick="showSection('settings')">Settings</a></li>
            </ul>
        </nav>

        <div class="content">
            <header>
                <h1>Staff Service List</h1>
            </header>
            <div id="home" class="section">
                <h2>Welcome to the Dashboard</h2>
                <p>This is the home section. Click on the links in the sidebar to navigate to different sections.</p>
            </div>
            <div id="services" class="section" style="display:none;">
                <h2>Available Services</h2>
                <div class="service-item">
                    <h3>Service 1</h3>
                    <p>Description of Service 1.</p>
                </div>
                <div class="service-item">
                    <h3>Service 2</h3>
                    <p>Description of Service 2.</p>
                </div>
                <div class="service-item">
                    <h3>Service 3</h3>
                    <p>Description of Service 3.</p>
                </div>
            </div>
            <div id="staff" class="section" style="display:none;">
                <h2>Staff Members</h2>
                <p>Details about staff members will be displayed here.</p>
            </div>
            <div id="reports" class="section" style="display:none;">
                <h2>Reports</h2>
                <p>Reports and analytics will be displayed here.</p>
            </div>
            <div id="settings" class="section" style="display:none;">
                <h2>Settings</h2>
                <p>Settings and configurations will be displayed here.</p>
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <p>&copy; 2023 Staff Service Management. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>

