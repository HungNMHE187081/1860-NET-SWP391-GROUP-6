<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách dịch vụ</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css"/>
        <style>
            /* Filter Form Styling */
            .filter-form {
                display: flex; /* Use flexbox for layout */
                align-items: center; /* Center items vertically */
                margin-bottom: 20px; /* Space below the form */
            }

            .filter-group {
                display: flex; /* Use flexbox for group layout */
                gap: 10px; /* Space between elements */
                flex-wrap: nowrap; /* Prevent wrapping */
            }

            .filter-group input,
            .filter-group select {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                width: 200px; /* Set a fixed width for inputs and selects */
            }

            .filter-group button,
            .filter-group .btn {
                background-color: #333;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 10px 15px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }

            .filter-group button:hover,
            .filter-group .btn:hover {
                background-color: #575757; /* Darker shade on hover */
            }

        </style>
    </head>
    <body>
        <!-- Header -->
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

        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Sidebar -->
            <%@ include file="leftside.jsp" %>
            <!-- Main Content -->
            <main>
                <section class="dashboard">
                    <h2><i class="fas fa-concierge-bell"></i> Danh sách dịch vụ</h2>

                    <!-- Filter and Search Form -->

                    <form action="${pageContext.request.contextPath}/staff/searchservice" method="get" class="filter-form">
                        <div class="filter-group">
                            <input type="text" id="searchInput" name="keyword" placeholder="Tìm theo tên dịch vụ" />

                            <select class="form-control" id="ageLimit" name="ageLimit">
                                <option value="">Chọn độ tuổi</option>
                                <c:forEach var="ageLimit" items="${ageLimits}">
                                    <option value="${ageLimit.ageLimitID}">${ageLimit.ageLimit}</option>
                                </c:forEach>
                            </select>

                            <button type="submit"><i class="fas fa-filter"></i> Lọc và tìm kiếm</button>
                        </div>
                    </form>

                    <table>
                        <thead>
                            <tr>
                            <tr>
                                <th>STT</th>
                                <th>Tên dịch vụ</th>
                                <th>Ảnh</th>
                                <th>Độ tuổi</th>
                                <th>Loại dịch vụ</th>
                                <th>Giá (VNĐ)</th>
                                <th>Thời gian tối đa</th>
                                <th>Chức năng</th>
                            </tr>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="stt" value="0" />
                            <c:forEach var="service" items="${services}" varStatus="status">
                                <c:if test="${service.isActive == true}">
                                    <c:set var="stt" value="${stt + 1}" />
                                    <tr>
                                        <td>${stt}</td>
                                        <td>${service.serviceName}</td>
                                        <td><img src="${pageContext.request.contextPath}/${service.serviceImage}" alt="${service.serviceName}" width="75" height="50"></td>
                                        <td>
                                            <c:forEach var="ageLimit" items="${ageLimits}">
                                                <c:if test="${ageLimit.ageLimitID == service.ageLimitID}">
                                                    ${ageLimit.ageLimit}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach var="category" items="${categories}">
                                                <c:if test="${category.categoryID == service.categoryID}">
                                                    ${category.categoryName}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td><fmt:formatNumber value="${service.price}" type="number" groupingUsed="true" /></td>
                                        <td>
                                            <c:if test="${service.duration == 0}">
                                                Theo lịch đặt
                                            </c:if>
                                            <c:if test="${service.duration != 0}">
                                                ${service.duration} phút
                                            </c:if>
                                        </td>
                                        <td class="table-td-center">
                                            <button class="btn btn-primary btn-sm" type="button" title="detail" id="show-emp">
                                                <a href="${pageContext.request.contextPath}/staff/viewservice?serviceID=${service.serviceID}"><i class="fas fa-eye"></i></a>
                                            </button>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>

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
    </div>
    <footer>
        <div class="container">
            <p>&copy; 2024 Child Care. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
