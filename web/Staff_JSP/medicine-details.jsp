<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết thuốc</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
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

            .detail-container {
                margin-top: 20px;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f9f9f9;
                display: flex;
                align-items: flex-start;
                flex-direction: column;
            }

            .child-image {
                max-width: 300px;
                max-height: 300px;
                margin-bottom: 20px;
            }

            .detail-info {
                display: flex;
                flex-direction: column;
                width: 100%;
            }

            .detail-item {
                margin-bottom: 10px;
                display: flex;
                justify-content: space-between;
            }

            .detail-item label {
                font-weight: bold;
                width: 30%;
            }

            .detail-item span {
                text-align: left;
                width: 70%;
            }

            .pagination {
                display: flex;
                justify-content: center;
                margin-top: 30px;
            }

            .pagination a {
                margin: 0 8px;
                padding: 12px 18px;
                border: 1px solid #ccc;
                border-radius: 5px;
                text-decoration: none;
                color: #333;
                background-color: #f9f9f9;
                transition: background-color 0.3s, color 0.3s;
            }

            .pagination a:hover {
                background-color: #e0e0e0;
                color: #000;
            }
            .action-buttons {
                display: flex; /* Arrange buttons inline */
                gap: 10px; /* Add space between the buttons */
                align-items: center; /* Align items vertically */
            }

            .action-buttons .btn {
                border: none;
                background-color: transparent;
                cursor: pointer;
                font-size: 18px; /* Adjust size if needed */
            }

            .action-buttons .edit-btn i {
                color: #28a745; /* Green color for edit icon */
            }

            .action-buttons .delete-btn i {
                color: #dc3545; /* Red color for delete icon */
            }

            .action-buttons .btn:hover i {
                opacity: 0.7; /* Optional hover effect */
            }

        </style>
        <header>
            <div class="container">
                <h1><i class="fas fa-hospital"></i> Child Care</h1>
                <nav>
                    <ul>
                        <li><a href="staffhomepage"><i class="fas fa-home"></i> Trang chủ</a></li>
                        <li><a href="profile.jsp"><i class="fas fa-user"></i> Thông tin cá nhân</a></li>
                        <li><a href="logout.jsp" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <div class="main-wrapper">
            <%@ include file="leftside.jsp" %>
            <main>
                <section class="dashboard">
                    <h2><i class="fas fa-concierge-bell"></i> Thông tin chi tiết</h2>
                    <a href="${pageContext.request.contextPath}/staff/medicinelist" class="back-link">Trở về danh sách thuốc</a>


                    <style>
                        .detail-container {
                            display: flex;
                            flex-direction: column;
                            align-items: center;
                            padding: 30px;
                            border: 1px solid #ccc;
                            border-radius: 10px;
                            background-color: #ffffff;
                            max-width: 800px;
                            margin: 30px auto;
                            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                            width: 100%; /* Increase width */
                            max-width: 1000px; /* Set a max width */
                            margin: 0 auto; /* Center align */
                        }

                        .child-image {
                            max-width: 100%;
                            height: auto;
                            border-radius: 10px;
                            margin-bottom: 25px;
                        }

                        .detail-item {
                            display: flex;
                            justify-content: space-between;
                            width: 100%;
                            margin-bottom: 20px;
                            padding: 15px 0;
                            border-bottom: 1px solid #e0e0e0;
                        }

                        .detail-item label {
                            font-weight: bold;
                            margin-right: 15px;
                            color: #333;
                            font-size: 1.1em;
                            flex-basis: 30%;
                        }

                        .detail-item span {
                            flex-grow: 1;
                            text-align: right;
                            color: #666;
                            font-size: 1.1em;
                        }

                        .pagination {
                            display: flex;
                            justify-content: center;
                            margin-top: 30px;
                        }

                        .pagination a {
                            margin: 0 8px;
                            padding: 12px 18px;
                            border: 1px solid #ccc;
                            border-radius: 5px;
                            text-decoration: none;
                            color: #333;
                            background-color: #f9f9f9;
                            transition: background-color 0.3s, color 0.3s;
                        }

                        .pagination a:hover {
                            background-color: #e0e0e0;
                            color: #000;
                        }
                    </style>

                    <div class="detail-container">

                        <div class="detail-item">
                            <label>Tên thuốc: </label>
                            <span>${medicine.name}</span>
                        </div>
                        <div class="detail-item">
                            <label>Công dụng: </label>
                            <span>${medicine.uses}</span>
                        </div>
                        <div class="detail-item">
                            <label>Liều lượng: </label>
                            <span>${medicine.dosage}</span>
                        </div>
                        <div class="detail-item">
                            <label>Nhà sản xuất: </label>
                            <span>${medicine.manufactureName}</span>
                        </div>
                        <div class="detail-item">
                            <label>Hướng dẫn sử dụng: </label>
                            <span>${medicine.userManual}</span>
                        </div>
                        <div class="detail-item">
                            <label>Chống chỉ định: </label>
                            <span>${medicine.contraindications}</span>
                        </div>
                        <div class="detail-item">
                            <label>Loại thuốc: </label>
                            <span>${medicine.categoryName}</span>
                        </div>
                        <div class="action-buttons">
                            <a href="medicineupdate?id=${medicine.medicineID}" class="btn">
                                <i class="fas fa-edit"></i>
                            </a>
                           <form action="deletemedicine" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${medicine.medicineID}" />
                                <button type="submit" class="btn" onclick="return confirm('Bạn có chắc chắn muốn xóa thuốc này?');">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </div>



                    </div>

                    <div class="pagination">
                        <c:if test="${pageIndex > 1}">
                            <a href="${pageContext.request.contextPath}/staff/medicinelist?page=${pageIndex - 1}&search=${param.search}&category=${param.category}&manufacturer=${param.manufacturer}">« Trước</a>
                        </c:if>
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <a href="${pageContext.request.contextPath}/staff/medicinelist?page=${i}&search=${param.search}&category=${param.category}&manufacturer=${param.manufacturer}" class="<c:if test='${i == pageIndex}'>active</c:if>">${i}</a>
                        </c:forEach>
                        <c:if test="${pageIndex < totalPages}">
                            <a href="${pageContext.request.contextPath}/staff/medicinelist?page=${pageIndex + 1}&search=${param.search}&category=${param.category}&manufacturer=${param.manufacturer}">Tiếp theo »</a>
                        </c:if>
                    </div>

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
