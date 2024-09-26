<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="css/styles.css"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Service List</title>
    <link rel="stylesheet" href="css/staff.css">
    <script>
        function showSection(sectionId) {
            var sections = document.getElementsByClassName('section');
            for (var i = 0; i < sections.length; i++) {
                sections[i].style.display = 'none';
            }
            document.getElementById(sectionId).style.display = 'block';
            }
    </script>
    </head>
    <body>
    <div class="wrapper">
        <nav class="sidebar">
            <div class="sidebar-header">
                <img src="src" alt="logo"/>
            </div>
            <ul class="list-unstyled components">
                <li><a href="#" onclick="showSection('reservations')">Reservations</a></li>
                <li><a href="#" onclick="showSection('services')">Services</a></li>
                <li><a href="#" onclick="showSection('history')">History Examinations</a></li>
                <li><a href="#" onclick="showSection('medicine')">Medicine</a></li>
                <li><a href="#" onclick="showSection('feedback')">Feedback</a></li>
                    </ul>
                </nav>

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
            <aside class="sidebar">
                <h2><i class="fas fa-list"></i> Danh mục</h2>
                <ul>
                    <li><a href="services-list.jsp"><i class="fas fa-concierge-bell"></i> Danh sách dịch vụ</a></li>
                    <li><a href="reservations-list.jsp"><i class="fas fa-calendar-check"></i> Danh sách đặt lịch</a></li>
                    <li><a href="medical-history.jsp"><i class="fas fa-notes-medical"></i> Lịch sử khám bệnh</a></li>
                    <li><a href="medicinelist" class="active"><i class="fas fa-prescription-bottle-alt"></i> Thuốc</a></li>
                    <li><a href="customers-list.jsp"><i class="fas fa-users"></i> Danh sách khách hàng</a></li>
                    <li><a href="feedback-list.jsp"><i class="fas fa-comments"></i> Danh sách phản hồi</a></li>
                </ul>
            </aside>

            <!-- Main Content -->
            <main>
                <section class="dashboard">
                    <h2><i class="fas fa-prescription-bottle-alt"></i> Danh sách dịch vụ</h2>
                    
                    <!-- Filter and Search Form -->

                    <form action="searchservice" method="get" class="filter-form">
                        <div class="filter-group">
                            <input type="text" name="search" value="${param.search}" placeholder="Tìm dịch vụ theo tên" />

                            <select name="ageLimit" id="ageLimit">
                                <option value="">Tất cả độ tuổi</option>
                                <c:forEach var="ageLimit" items="${ageLimit}">
                                    <option value="${ageLimit.ageLimit}" 
                                            <c:if test="${ageLimit.ageLimitID == service.ageLimitID}">selected</c:if>>
                                        ${ageLimit.ageLimit}
                                    </option>
                                </c:forEach>
                            </select>

                            <select name="sort" id="sort">
                                <option value="">Sắp xếp theo</option>
                                <option value="ageLimit" <c:if test="${param.sort == 'ageLimit'}">selected</c:if>>Tên thuốc</option>
                                <option value="category" <c:if test="${param.sort == 'category'}">selected</c:if>>Loại thuốc</option>
                                <option value="manufacturer" <c:if test="${param.sort == 'manufacturer'}">selected</c:if>>Nhà sản xuất</option>
                                </select>

                                <button type="submit"><i class="fas fa-filter"></i> Lọc và tìm kiếm</button>
                            </div>
                        </form>

                                <table>
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên dịch vụ</th>
                                        <th>Ảnh</th>
                                        <th>Độ tuổi</th>
                                        <th>Giá</th>
                                        <th>Thời gian tối đa</th>
                                        <th>Mô tả</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="service" items="${services}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${service.serviceName}</td>
                                            <td><img src="${service.serviceImage}" alt="${service.serviceName}" width="75" height="50"></td>
                                            <td>
                                                <c:forEach var="ageLimit" items="${ageLimits}">
                                                    <c:if test="${ageLimit.ageLimitID == service.ageLimitID}">
                                                        ${ageLimit.ageLimit}
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
                                            <td>${service.description}</td>
                                            <td>
                                            <a href="servicedetail?id=${service.serviceID}" class="btn"><i class="fas fa-eye"></i></a>
                                        </td>
                                        </tr>
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
            <p>&copy; 2023 Staff Service Management. All rights reserved.</p>
            </div>
        </footer>
    </body>
</html>
