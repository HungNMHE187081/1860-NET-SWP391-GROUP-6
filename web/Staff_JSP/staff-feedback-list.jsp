<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách phản hồi</title>
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
                        <li><a href="staff/staffhomepage"><i class="fas fa-home"></i> Trang chủ</a></li>
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
                    <h2><i class="fas fa-concierge-bell"></i> Danh sách phản hồi</h2>
                    <!-- Search Form -->
                    <form class="filter-form" action="${pageContext.request.contextPath}/staff/feedbacklist" method="get">
                        <div class="filter-group">
                            <input type="text" name="searchName" placeholder="Tìm kiếm theo tên" value="${param.searchName}">
                            <select name="searchRating">
                                <option value="">Tất cả đánh giá</option>
                                <option value="1" ${param.searchRating == '1' ? 'selected' : ''}>1 sao</option>
                                <option value="2" ${param.searchRating == '2' ? 'selected' : ''}>2 sao</option>
                                <option value="3" ${param.searchRating == '3' ? 'selected' : ''}>3 sao</option>
                                <option value="4" ${param.searchRating == '4' ? 'selected' : ''}>4 sao</option>
                                <option value="5" ${param.searchRating == '5' ? 'selected' : ''}>5 sao</option>
                            </select>
                            <button type="submit"><i class="fas fa-filter"></i> Lọc và tìm kiếm</button>
                        </div>
                    </form>

                    <table id="feedbackTable" class="table table-striped">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Người dùng phản hồi</th>
                                <th>Dịch vụ</th>
                                <th>Đánh giá dịch vụ (theo sao)</th>
                                <th>Đánh giá trải nghiệm</th>
                                <th>Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="feedback" items="${feedback}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${feedback.userName}</td>
                                    <td>
                                        <c:forEach var="service" items="${service}">
                                            <c:if test="${service.serviceID == feedback.serviceID}">
                                                ${service.serviceName}
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td>${feedback.rating}</td>     
                                    <td>${feedback.experienceRating}</td>    
                                    <td class="table-td-center">
                                        <button class="btn btn-primary btn-sm" type="button" title="detail" id="show-emp">
                                            <a href="${pageContext.request.contextPath}/staff/viewfeedback?feedbackID=${feedback.feedbackID}"><i class="fas fa-eye"></i></a>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                </section>
            </main>
        </div>
        <footer>
            <div class="container">
                <p>&copy; 2024 Child Care. All rights reserved.</p>
            </div>
        </footer>
        <!-- Essential javascripts for application to work-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

    </body>
</html>