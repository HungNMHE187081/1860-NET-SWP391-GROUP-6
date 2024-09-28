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
        </style>
    </head>
    <body>
        <header>
            <h1>Child Care</h1>
            <nav>
                <a href="staff-home-page.jsp">Home</a>
                <a href="profile.jsp">Profile</a>
                <a href="logout.jsp">Logout</a>
            </nav>
        </header>

        <main>
            <center>
            <h2 style="color: #4CAF50">Thêm thuốc mới</h2>
            </center>
            <form action="addmedicine" method="post">
                <label for="medicineName">Tên thuốc:</label>
                <input type="text" id="medicineName" name="name" required />

                <label for="description">Nhà sản xuất:</label>
                <textarea id="description" name="description" required></textarea>

                <label for="uses">Công dụng:</label>
                <textarea id="uses" name="uses" required></textarea>

                <label for="dosage">Liều dùng:</label>
                <input type="text" id="dosage" name="dosage" required />

                <label for="userManual">Hướng dẫn sử dụng:</label>
                <textarea id="userManual" name="userManual" required></textarea>

                <label for="contraindications">Chống chỉ định:</label>
                <textarea id="contraindications" name="contraindications" required></textarea>

                <label>Loại thuốc:</label>
                <select name="categoryID" required>
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.categoryID}" 
                                <c:if test="${category.categoryID == medicine.categoryID}">selected</c:if>>
                            ${category.categoryName}
                        </option>
                    </c:forEach>
                </select>



                <button type="submit">Thêm thuốc</button>
                <center>
                <a href="medicinelist"> Trở về danh sách thuốc </a>
                </center>
            </form>
        </main>

        <footer>
            <p>&copy; 2024 Child Care. All rights reserved.</p>
        </footer>
    </body>
</html>
