<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách thuốc</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <style>
            .main a {
        background: center;
        margin-bottom: 20px;
        margin-top: 20px;
        display: flex;
    }

    a.back-link {
        display: inline-block;
        background-color: #007bff; /* Bootstrap primary color */
        color: white;
        padding: 10px 15px;
        text-decoration: none; /* Remove underline */
        border-radius: 5px;
        margin-bottom: 20px;
    }

    a.back-link:hover {
        background-color: #0056b3; /* Darker blue on hover */
    }
        </style>
        <header>
            <div class="container">
                <h1><i class="fas fa-hospital"></i> Child Care</h1>
                <nav>
                    <ul>
                        <li><a href="Staff_JSP/staff-home-page.jsp"><i class="fas fa-home"></i> Trang chủ</a></li>
                        <li><a href="profile.jsp"><i class="fas fa-user"></i> Thông tin cá nhân</a></li>
                        <li><a href="logout.jsp" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <div class="main-wrapper">
            <%@ include file="/Staff_JSP/leftside.jsp" %>

          <main>
    <section class="dashboard">
        <h2><i class="fas fa-prescription-bottle-alt"></i> Thông tin chi tiết của thuốc</h2>
        <a href="medicinelist" class="back-link">Trở về danh sách thuốc</a>

        <table>
            <thead>
                <tr>
                    <th>Tên thuốc</th>
                    <th>Công dụng</th>
                    <th>Liều lượng</th>
                    <th>Nhà sản xuất</th>
                    <th>Hướng dẫn sử dụng</th>
                    <th>Chống chỉ định</th>
                    <th>Loại thuốc</th>
                    <th>Chức năng</th>
                </tr> 
            </thead>
            <tbody>
                <c:if test="${empty medicine}">
                    <tr>
                        <td colspan="8" style="text-align:center;">Không tìm thấy thuốc</td>
                    </tr>
                </c:if>
                <c:if test="${not empty medicine}">
                    <tr>
                        <td><c:out value="${medicine.name}" /></td>
                        <td><c:out value="${medicine.uses}" /></td>
                        <td><c:out value="${medicine.dosage}" /></td>
                        <td><c:out value="${medicine.manufactureName}" /></td>
                        <td><c:out value="${medicine.userManual}" /></td>
                        <td><c:out value="${medicine.contraindications}" /></td>
                        <td><c:out value="${medicine.categoryName}" /></td>
                        <td>
                            <a href="medicineupdate?id=${medicine.medicineID}" class="btn">
                                <i class="fas fa-edit"></i>
                            </a>
                            <form action="deletemedicine" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${medicine.medicineID}" />
                                <button type="submit" class="btn" onclick="return confirm('Bạn có chắc chắn muốn xóa thuốc này?');">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </section>
</main>

        </div>

        <footer>
            <div class="container">
                <p>&copy; 2024 Child Care. All rights reserved.</p>
            </div>
        </footer>
    </body>
</html>
