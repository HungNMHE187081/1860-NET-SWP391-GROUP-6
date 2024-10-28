<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../css/styles.css">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chính - Nhân viên</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <header>
            <div class="container">
                <h1><i class="fas fa-hospital"></i> Child Care</h1>
                <nav>
                    <ul>
                        <li><a href="staff/staffhomepage"><i class="fas fa-home"></i> Trang chủ</a></li>
                        <li><a href="${pageContext.request.contextPath}/staff/viewprofile"><i class="fas fa-user"></i> Thông tin cá nhân</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <div class="main-wrapper">
            <%@ include file="leftside.jsp" %>

            <main>
                <section class="dashboard">
                    <h2><i class="fas fa-user-nurse"></i> Xin chào ${staff.staffName}</h2>

                    <section class="appointments-today">
                        <h3><i class="fas fa-calendar-day"></i> Các cuộc hẹn hôm nay</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Tên khách hàng</th>
                                    <th>Tên bệnh nhân</th>
                                    <th>Ngày khám</th>
                                    <th>Tên dịch vụ</th>
                                    <th>Thời gian khám</th>
                                    <th>Tên nhân viên</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${not empty listReservation} ">
                                    <c:forEach var="reservation" items="${listReservation}">
                                        <tr>
                                            <td>${reservation.customerFirstName} ${reservation.customerMiddleName} ${reservation.customerLastName}</td>
                                            <td>${reservation.childFirstName} ${reservation.childMiddleName} ${reservation.childLastName}</td>
                                            <td>${reservation.appointmentDate}</td>
                                            <td>${reservation.serviceName}</td>
                                            <td>${reservation.appointmentStartTime}</td>
                                            <td>${reservation.staffName}</td>
                                            <td><a href="reservation-details.html?id=${reservation.id}" class="btn"><i class="fas fa-eye"></i> Xem chi tiết</a></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty listReservation}">
                                    <tr>
                                        <td colspan="5" style="text-align: center;color: #4bac4d ">Hôm nay không có lịch khám nha ^.^</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </section>

                    <section class="notifications">
                        <h3><i class="fas fa-bell"></i> Thông báo</h3>
                        <div class="notification-card">
                            <p><i class="fas fa-calendar-alt"></i> Nhắc nhở: Có cuộc họp y tế vào 03:00 PM hôm nay.</p>
                        </div>
                        <div class="notification-card">
                            <p><i class="fas fa-exclamation-triangle"></i> Yêu cầu cập nhật thông tin bệnh nhân mới.</p>
                        </div>
                        <!-- Thêm các thông báo khác -->
                    </section>
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
