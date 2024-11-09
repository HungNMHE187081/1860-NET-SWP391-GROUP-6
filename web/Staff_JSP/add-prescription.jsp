<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Medicine" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm đơn thuốc</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

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
                width: 80%;
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
                width: 50px;
                height: auto;
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
                <a href="staffhomepage">Trang chủ</a>
                <a href="profile.jsp">Thông tin cá nhân</a>
                <a href="logout.jsp">Đăng xuất</a>
            </nav>
        </header>

        <main>
            <center>
                <h2 style="color: #4CAF50">Thêm đơn thuốc</h2>
            </center>
            <c:if test="${param.success == 'true'}">
                <p style="color: green;">Successfully!</p>
            </c:if>

            <c:if test="${param.error == 'true'}">
                <p style="color: red;">Please try again.</p>
            </c:if>
            <form action="${pageContext.request.contextPath}/staff/addprescription" method="post">
                <input type="hidden" name="recordID" value="${record.recordID}">
                <input type="hidden" id="staffID" name="staffID" value="${staff.staffID}">

                <label for="childName">Tên trẻ được khám:</label>
                <input type="text" id="childName" name="childName" 
                       value="${children.firstName} ${children.middleName} ${children.lastName}" readonly>

                <label for="staffName">Tên nhân viên thực khám:</label>
                <input type="text" id="staffName" name="staffName" value="${staff.staffName}" readonly>

                <label for="diagnosis">Chẩn đoán:</label>
                <textarea id="diagnosis" name="diagnosis" readonly>${record.diagnosis}</textarea>

                <label for="medicineSelect">Chọn thuốc:</label>
                <select id="medicineSelect" name="medicineIds" multiple style="width: 100%;" required>
                    <option value="" disabled>Chọn thuốc:</option>
                    <c:forEach var="medicine" items="${medicineList}">
                        <option value="${medicine.medicineID}" 
                                <c:if test="${not empty prescription && prescription.medicineID == medicine.medicineID}">
                                    selected
                                </c:if>
                                >${medicine.name}</option>
                    </c:forEach>
                </select>

                <br>

                <label for="dosage">Liều dùng:</label>
                <textarea id="dosage" name="dosage" 
                          <c:if test="${empty prescription}">required</c:if>
                          >${not empty prescription ? prescription.dosage : ''}</textarea>

                <label for="frequency">Tần suất:</label>
                <textarea id="frequency" name="frequency" 
                          <c:if test="${empty prescription}">required</c:if>
                          >${not empty prescription ? prescription.frequency : ''}</textarea>

                <label for="duration">Thời điểm sử dụng:</label>
                <textarea id="duration" name="duration" 
                          <c:if test="${empty prescription}">required</c:if>
                          >${not empty prescription ? prescription.duration : ''}</textarea>

                <button type="submit">Thêm đơn thuốc</button>

                <center>
                    <a href="${pageContext.request.contextPath}/staff/medicalrecordlist">Quay lại lịch sử khám</a>
                </center>
            </form>





            <script>
                $(document).ready(function () {
                    $('#medicineSelect').select2({
                        placeholder: "Select medicines",
                        allowClear: true
                    });
                });


            </script>
        </main>

        <footer>
            <p>&copy; 2024 Child Care. All rights reserved.</p>
        </footer>
    </body>
</html>
