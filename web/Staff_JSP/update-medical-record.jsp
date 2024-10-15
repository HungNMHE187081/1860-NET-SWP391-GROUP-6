<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cập nhật hồ sơ y tế</title>
        <link rel="stylesheet" href="css/styles.css"/>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f4f4f4;
            }

            h2 {
                color: #333;
                margin-bottom: 20px;
            }

            form {
                display: flex;
                flex-direction: column;
                max-width: 600px;
                background-color: white;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            label {
                margin-bottom: 5px;
                font-weight: bold;
            }

            input[type="text"],
            input[type="date"],
            textarea {
                margin-bottom: 15px;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
            }

            textarea {
                resize: vertical;
            }

            .success {
                color: green;
                margin-bottom: 10px;
            }

            .error {
                color: red;
                margin-bottom: 10px;
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

            a {
                margin-top: 10px;
                display: inline-block;
                text-decoration: none;
                color: #0056b3;
            }

            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <header>
        <nav>
            <a href="Staff_JSP/staff-home-page.jsp">Trang chủ</a>
            <a href="profile.jsp">Thông tin cá nhân</a>
            <a href="logout.jsp">Đăng xuất</a>
        </nav>
    </header>
    <body>
        <h2>Cập nhật hồ sơ y tế</h2>

        <c:if test="${not empty message}">
            <div class="success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <form action="updatemedicalrecord" method="post">
            <input type="hidden" name="id" value="${record.recordID}" />
            <input type="hidden" name="childID" value="${record.childID}" />
            <input type="hidden" name="reservationID" value="${record.reservationID}" />

            <label for="childName">Tên trẻ:</label>
            <input type="text" name="childName" value="${record.firstNameChild} ${record.middleNameChild} ${record.lastNameChild}" readonly />

            <label for="diagnosis">Chẩn đoán:</label>
            <input type="text" name="diagnosis" value="${record.diagnosis}" required />

            <label for="treatment">Điều trị:</label>
            <input type="text" name="treatment" value="${record.treatment}" required />

            <label for="notes">Ghi chú:</label>
            <textarea name="notes">${record.notes}</textarea>

            <label for="reservationDate">Ngày khám:</label>
            <input type="date" name="reservationDate" value="${record.reservationDate}" readonly />

            <label for="doctorName">Tên bác sĩ:</label>
            <input type="text" name="doctorName" value="${record.staffID}" readonly />

            <label for="createdDate">Ngày tạo:</label>
            <input type="date" name="createdDate" value="${record.recordDate}" readonly />

            <button type="submit">Cập nhật</button>
        </form>

        <a href="medicalrecordlist">Trở về danh sách</a>
    </body>
</html>
