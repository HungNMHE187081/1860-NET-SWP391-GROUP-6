<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="css/styles.css"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách thuốc</title>
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
            <%@ include file="/Staff_JSP/leftside.jsp" %>

            <!-- Main Content -->
            <main>
                <section class="dashboard">
                    <h2><i class="fas fa-prescription-bottle-alt"></i> Danh sách thuốc</h2>
                    
                    <!-- Filter and Search Form -->

                    <form action="medicinelist" method="get" class="filter-form">
                        <div class="filter-group">
                            <input type="text" name="search" value="${param.search}" placeholder="Tìm theo tên thuốc" />

                            <select name="category" id="category">
                                <option value="">Tất cả loại thuốc</option>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.categoryID}" 
                                            <c:if test="${category.categoryID == param.category}">selected</c:if>>
                                        ${category.categoryName}
                                    </option>
                                </c:forEach>
                            </select>

                            <select name="sort" id="sort">
                                <option value="">Sắp xếp theo</option>
                                <option value="name" <c:if test="${param.sort == 'name'}">selected</c:if>>Tên thuốc</option>
                                <option value="latestAdd" <c:if test="${param.sort == 'latestAdd'}">selected</c:if>>Thêm gần đây</option>
                              
                                </select>

                                <button type="submit"><i class="fas fa-filter"></i> Lọc và tìm kiếm</button>
                                <a href="addmedicine" class="btn"><i class="fas fa-plus"></i> Thêm thuốc mới</a>
                            </div>
                        </form>



                        <!-- Medicine List Table -->
                        <table>
                            <thead>
                                <tr>
                                    <th>Tên thuốc</th>
                                    <th>Công dụng</th>
                                    <th>Loại thuốc</th>
                                    <th>Nhà sản xuất</th>
                                    <th>Chức năng</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty medicineList}">
                                <c:forEach var="medicine" items="${medicineList}">
                                    <tr>
                                        <td><c:out value="${medicine.name}" /></td>
                                        <td><c:out value="${medicine.uses}" /></td>
                                        <td><c:out value="${medicine.categoryName}" /></td>
                                        <td><c:out value="${medicine.manufactureName}" /></td>
                                        <td>
                                            <a href="medicinedetail?id=${medicine.medicineID}" class="btn"><i class="fas fa-eye"></i> Xem chi tiết</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty medicineList}">
                                <tr>
                                    <td colspan="5" style="text-align: center;">Không tìm thấy thuốc</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>



                    <!-- Pagination -->
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

        <!-- Footer -->
        <footer>
            <div class="container">
                <p>&copy; 2024 Child Care. All rights reserved.</p>
            </div>
        </footer>
    </body>
</html>
