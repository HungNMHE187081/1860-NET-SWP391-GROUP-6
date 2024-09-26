<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <!-- Thêm link Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/styles.css">
</head>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chính - Nhân viên</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="style_2.css">
    </head>
    <body>
        <header>
            <div class="container">
                <h1><i class="fas fa-hospital"></i> Child Care</h1>
                <nav>
                    <ul>
                        <li><a href="staff-home-page.jsp"><i class="fas fa-home"></i> Trang chủ</a></li>
                        <li><a href="profile.html"><i class="fas fa-user"></i> Thông tin cá nhân</a></li>

                        <li><a href="logout.html" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <div class="main-wrapper">
            <%@ include file="leftside.jsp" %>

            <main>
                <section class="dashboard">
                    <h2><i class="fas fa-user-nurse"></i> Xin chào, [Tên nhân viên]</h2>

                    <section class="appointments-today">
                        <h3><i class="fas fa-calendar-day"></i> Các cuộc hẹn hôm nay</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Tên bệnh nhân</th>
                                    <th>Thời gian</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>John Doe</td>
                                    <td>09:00 AM</td>
                                    <td>Đã lên lịch</td>
                                    <td><a href="reservation-details.html" class="btn"><i class="fas fa-eye"></i> Xem chi tiết</a></td>
                                </tr>
                                <!-- Thêm các cuộc hẹn khác -->
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
