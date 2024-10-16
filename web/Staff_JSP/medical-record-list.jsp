<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="css/styles.css"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách lịch sử khám bệnh</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
                        <li><a href="Staff_JSP/staff-home-page.jsp"><i class="fas fa-home"></i> Trang chủ</a></li>
                        <li><a href="profile.jsp"><i class="fas fa-user"></i> Thông tin cá nhân</a></li>
                        <li><a href="logout.jsp" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Sidebar -->
            <%@ include file="/Staff_JSP/leftside.jsp" %>

            <!-- Main Content -->
            <main>
                <section class="dashboard">
                    <h2><i class="fas fa-prescription-bottle-alt"></i> Danh sách thuốc</h2>

                    <!-- Filter and Search Form -->
                    <form action="medicalrecordlist" method="get" class="filter-form">
                        <div class="filter-group">
                            <input type="text" name="search" value="${param.search}" placeholder="Tìm theo tên trẻ" />
                            <select name="month" class="month-select">
                                <option value="">Lọc theo tháng khám</option>
                                <c:forEach var="i" begin="1" end="12">
                                    <option value="${i}" <c:if test="${i == param.month}">selected</c:if>>Tháng ${i}</option>
                                </c:forEach>
                            </select>

                            <!-- Sắp xếp theo ngày ghi nhận -->
                            <select name="sortBy" class="sort-select">
                                <option value="">Sắp xếp theo</option>
                                <option value="dateAdded" <c:if test="${param.sortBy == 'dateAdded'}">selected</c:if>>Ngày ghi nhận</option>
                            </select>

                            <button type="submit"><i class="fas fa-filter"></i> Lọc và tìm kiếm</button>
                          <a href="staff/oldreservationslist" class="btn"><i class="fas fa-plus"></i> Thêm bản ghi</a>
                        </div>
                    </form>

                    <!-- Medicine List Table -->
                    <table>
                        <thead>
                            <tr>
                                <th>Tên trẻ</th>
                                <th>Chẩn đoán</th>
                                <th>Điều trị</th>
                                <th>Ghi chú</th>
                                <th>Ngày khám</th>
                                <th>Ngày ghi nhận</th>
                                <th>Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty records}">
                                <c:forEach var="record" items="${records}">
                                    <tr>
                                        <td><c:out value="${record.firstNameChild} ${record.middleNameChild} ${record.lastNameChild}" /></td>
                                        <td><c:out value="${record.diagnosis}" /></td>
                                        <td><c:out value="${record.treatment}" /></td>
                                        <td><c:out value="${record.notes}" /></td>
                                        <td><c:out value="${record.reservationDate}" /></td>
                                        <td>
                                            <c:out value="${record.recordDate}" />
                                        </td>
                                        <td>
                                            <a href="updatemedicalrecord?id=${record.recordID}" class="btn">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <form action="deletemedicalrecord" method="post" style="display:inline;">
                                                <input type="hidden" name="id" value="${record.recordID}" /> <!-- Sử dụng recordID -->
                                                <button type="submit" class="btn" onclick="return confirm('Bạn có chắc chắn muốn xóa bản ghi này?');">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty records}">
                                <tr>
                                    <td colspan="7" style="text-align: center;">Không tìm thấy hồ sơ</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </section>
            </main>
        </div>

        <!-- Footer -->
        <footer>
            <div class="container">
                <p>&copy; 2024 Child Care. All rights reserved.</p>
            </div>
        </footer>
    </body>
</html>
