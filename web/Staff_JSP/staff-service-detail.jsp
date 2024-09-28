<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

    .detail-container {
                margin-top: 20px;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f9f9f9;
                display: flex;
                align-items: flex-start;
            }

            .service-image {
                max-width: 300px;
                max-height: 300px;
                margin-right: 20px;
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
                width: 50px;
            }

            .detail-item span {
                text-align: left;
            }
        </style>
        <header>
            <div class="container">
                <h1><i class="fas fa-hospital"></i> Child Care</h1>
                <nav>
                    <ul>
                        <li><a href="staff-home-page.jsp"><i class="fas fa-home"></i> Trang chủ</a></li>
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
                    <h2><i class="fas fa-concierge-bell"></i> Thông tin chi tiết của dịch vụ</h2>
                    <a href="staffservices" class="back-link">Trở về</a>

                    <div class="detail-container">
                        <c:choose>
                            <c:when test="${not empty service}">
                                <img src="${service.serviceImage}" alt="${service.serviceName}" class="service-image"/>
                                <div class="detail-item">
                                    <label>Tên dịch vụ:</label>
                                    <span>${service.serviceName}</span>
                                </div>
                                <div class="detail-item">
                                    <label>Mô tả:</label>
                                    <span>${service.description}</span>
                                </div>
                                <div class="detail-item">
                                    <label>Giá:</label>
                                    <span><fmt:formatNumber value="${service.price}" type="number" groupingUsed="true" />₫</span>
                                </div>
                                <div class="detail-item">
                                    <label>Độ tuổi:</label>
                                    <span><c:forEach var="ageLimit" items="${ageLimit}">
                                        <c:if test="${ageLimit.ageLimitID == service.ageLimitID}">
                                            ${ageLimit.ageLimit}
                                        </c:if>
                                    </c:forEach></span>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <p>Dịch vụ không tồn tại.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="pagination">
                        <c:if test="${pageIndex > 1}">
                            <a href="medicinelist?page=${pageIndex - 1}&search=${param.search}&category=${param.category}&manufacturer=${param.manufacturer}">« Trước</a>
                        </c:if>
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <a href="medicinelist?page=${i}&search=${param.search}&category=${param.category}&manufacturer=${param.manufacturer}" class="<c:if test='${i == pageIndex}'>active</c:if>">${i}</a>
                        </c:forEach>
                        <c:if test="${pageIndex < totalPages}">
                            <a href="medicinelist?page=${pageIndex + 1}&search=${param.search}&category=${param.category}&manufacturer=${param.manufacturer}">Tiếp theo »</a>
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
