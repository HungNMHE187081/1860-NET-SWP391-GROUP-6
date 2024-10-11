<%-- 
    Document   : staff-reservations-list
    Created on : Oct 7, 2024, 10:38:05 AM
    Author     : LENOVO
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách lịch đã khám</title>
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
                        <li><a href="staff-home-page.jsp"><i class="fas fa-home"></i> Trang chủ</a></li>
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
                    <h2><i class="fas fa-concierge-bell"></i> Danh sách lịch đã khám</h2>

                    <!-- Filter and Search Form -->

                    <form action="${pageContext.request.contextPath}/staff/searchstaff" method="get" class="filter-form">
                        <div class="filter-group">
                            <div class="filter-group">
                                <input type="text" id="searchInput" name="keyword" placeholder="Tìm theo tên nhân viên" />
                                <select class="form-control" id="specializationID" name="specializationID">
                                    <option value="">Chọn chức vụ</option>
                                    <c:forEach var="specialization" items="${specializations}">
                                        <option value="${specialization.specializationID}">${specialization.specializationName}</option>
                                    </c:forEach>
                                </select>
                                <button type="submit"><i class="fas fa-filter"></i> Lọc và tìm kiếm</button>
                            </div>
                        </div>
                    </form>

                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Tên khách hàng</th>
                                <th>Tên trẻ</th>
                                <th>Ngày khám</th>
                                <th>Giờ khám</th>
                                <th>Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="reservation" items="${reservations}" varStatus="status">
                                <c:set var="hasCustomer" value="false" />
                                <c:set var="hasChild" value="false" />

                                <c:forEach var="orderItem" items="${orderItems}">
                                    <c:if test="${orderItem.orderItemID == reservation.orderItemID}">
                                        <c:forEach var="order" items="${orders}">
                                            <c:if test="${order.orderID == orderItem.orderID}">
                                                <c:forEach var="user" items="${users}">
                                                    <c:if test="${user.userID == order.customerID}">
                                                        <c:set var="hasCustomer" value="true" />
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>

                                <c:forEach var="orderItem" items="${orderItems}">
                                    <c:if test="${orderItem.orderItemID == reservation.orderItemID}">
                                        <c:forEach var="child" items="${children}">
                                            <c:if test="${child.childID == orderItem.childID}">
                                                <c:set var="hasChild" value="true" />
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>

                                <c:if test="${hasCustomer && hasChild}">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>
                                            <c:forEach var="orderItem" items="${orderItems}">
                                                <c:if test="${orderItem.orderItemID == reservation.orderItemID}">
                                                    <c:forEach var="order" items="${orders}">
                                                        <c:if test="${order.orderID == orderItem.orderID}">
                                                            <c:forEach var="user" items="${users}">
                                                                <c:if test="${user.userID == order.customerID}">
                                                                    ${user.firstName} ${user.middleName} ${user.lastName}
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach var="orderItem" items="${orderItems}">
                                                <c:if test="${orderItem.orderItemID == reservation.orderItemID}">
                                                    <c:forEach var="child" items="${children}">
                                                        <c:if test="${child.childID == orderItem.childID}">
                                                            ${child.firstName} ${child.middleName} ${child.lastName}
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>${reservation.reservationDate}</td>
                                        <td>
                                            <fmt:parseDate value="${reservation.startTime}" pattern="HH:mm:ss" var="parsedStartTime" />
                                            <fmt:formatDate value="${parsedStartTime}" pattern="hh:mm a" />
                                        </td>
                                        <td class="table-td-center">
                                            <button class="btn btn-primary btn-sm" type="button" title="detail" id="show-emp">
                                                <a href="${pageContext.request.contextPath}/manager/viewreservation?reservationID=${reservation.reservationID}"><i class="fas fa-eye"></i>
                                                    Chi tiết</a>
                                            </button>
                                            
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>

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
    </div>
    <footer>
        <div class="container">
            <p>&copy; 2024 Child Care. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
