<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.MedicalRecord" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cập nhật hồ sơ y tế</title>
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
                color: green;
                margin-top: 0;
                text-align: center;
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
            input[type="date"],
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

            .success {
                color: green;
                margin-bottom: 10px;
            }

            .error {
                color: red;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>Child Care</h1>
            <nav>
                <a href="staff/staffhomepage">Trang chủ</a>
                <a href="profile.jsp">Thông tin cá nhân</a>
                <a href="logout.jsp">Đăng xuất</a>
            </nav>
        </header>

        <main>
            <h2>Cập nhật hồ sơ y tế</h2>

            <c:if test="${not empty message}">
                <div class="success">${message}</div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/staff/updatemedicalrecord" method="post">
                <input type="hidden" name="id" value="${record.recordID}" />
                <input type="hidden" name="childID" value="${record.childID}" />
                <input type="hidden" name="reservationID" value="${record.reservationID}" />

                <label for="childName">Tên trẻ:</label>
                <input type="text" name="childName" value="${record.firstNameChild} ${record.middleNameChild} ${record.lastNameChild}" readonly />

                <label for="diagnosis">Chẩn đoán:</label>
                <input type="text" name="diagnosis" value="${record.diagnosis}" required />
                <small style="color: green;">* Hãy cập nhật thông tin chẩn đoán nếu cần.</small> <br>

                <label for="treatment">Điều trị:</label>
                <input type="text" name="treatment" value="${record.treatment}" required />
                <small style="color: green;">* Hãy cập nhật thông tin điều trị nếu cần.</small><br>

                <label for="notes">Ghi chú:</label>
                <textarea name="notes">${record.notes}</textarea>
                <small style="color: green;">* Hãy cập nhật ghi chú nếu có thay đổi.</small> <br>

                <label for="reservationDate">Ngày khám:</label>
                <input type="date" name="reservationDate" value="${record.reservationDate}" readonly />

                <label for="doctorName">Tên bác sĩ:</label>
                <input type="text" name="doctorName" value="${staff.staffName}" readonly />

                <label for="recordDate">Ngày tạo:</label>
                <input type="date" id="recordDate" name="recordDate" value="${record.recordDate}" readonly /><br>

                <button type="submit">Cập nhật</button>
            </form>


            <center>
                <a href="${pageContext.request.contextPath}/staff/medicalrecordlist">Trở về danh sách</a>
            </center>
        </main>

        <footer>
            <p>&copy; 2024 Child Care. All rights reserved.</p>
        </footer>
    </body>
</html>
