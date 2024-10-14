<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.MedicineCategory" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Medicine</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            header {
                background-color: #0056b3;
                color: white;
                padding: 15px 0;
                text-align: center;
            }

            header h1 {
                margin: 0;
            }

            nav {
                margin-top: 10px;
            }

            nav a {
                color: white;
                text-decoration: none;
                margin: 0 15px;
            }

            main {
                max-width: 600px;
                margin: 20px auto;
                padding: 20px;
                background-color: white;
                border-radius: 5px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            h2 {
                margin-top: 0;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                margin-bottom: 5px;
                font-weight: bold;
            }

            input[type="text"],
            textarea,
            select {
                margin-bottom: 15px;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
            }

            textarea {
                resize: vertical;
            }

            button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px;
                cursor: pointer;
                border-radius: 5px;
                font-size: 16px;
            }

            button:hover {
                background-color: #45a049;
            }

            footer {
                text-align: center;
                padding: 10px 0;
                background-color: #333;
                color: white;
                position: relative;
                bottom: 0;
                width: 100%;
                margin-top: 20px;
            }
            .table {
                width: 80%; /* Adjust width as needed */
                margin: 20px auto;
                border-collapse: collapse;
            }
            th, td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ccc;
            }
            th {
                background-color: #f2f2f2;
            }
            .table-td-center {
                text-align: center;
            }
            .child-image {
                width: 50px; /* Adjust size as needed */
                height: auto; /* Maintain aspect ratio */
            }
            button {
                border: none;
                background: none;
                cursor: pointer;
            }
            input[type="text"], input[type="number"], input[type="date"], textarea {
                width: 100%; /* Full width for inputs */
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .form-row {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>Child Care</h1>
            <nav>
                <a href="Staff_JSP/staff-home-page.jsp">Trang chủ</a>
                <a href="profile.jsp">Thông tin cá nhân</a>
                <a href="logout.jsp">Đăng xuất</a>
            </nav>
        </header>

        <main>
            <center>
                <h2 style="color: #4CAF50">Thêm lịch sử khám cho trẻ</h2>
            </center>
            <c:if test="${param.success == 'true'}">
                <p style="color: green;">Medical record added successfully!</p>
            </c:if>

            <c:if test="${param.error == 'true'}">
                <p style="color: red;">Error adding medical record. Please try again.</p>
            </c:if>
            <form action="${pageContext.request.contextPath}/submitMedicalRecord" method="post">
                <input type="hidden" name="reservationID" value="${reservationID}">

                <label for="childName">Child Name:</label>
                <input type="text" id="childName" name="childName" value="${childName}" readonly>

                <label for="staffName">Staff Name:</label>
                <input type="text" id="staffName" name="staffName" value="${staffName}" readonly>

                <label for="serviceName">Service Name:</label>
                <input type="text" id="serviceName" name="serviceName" value="${serviceName}" readonly>

                <!-- Other fields for medical records -->

                <input type="submit" value="Add Medical Record">
            </form>
        </main>

        <footer>
            <p>&copy; 2024 Child Care. All rights reserved.</p>
        </footer>
    </body>
</html>
