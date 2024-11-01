<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Tiny Tots</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../homepage.jsp" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="../images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <!-- Icons -->
        <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/remixicon.css" rel="stylesheet" type="text/css"/>
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- SLIDER -->
        <link href="${pageContext.request.contextPath}/css/tiny-slider.css" rel="stylesheet" type="text/css"/>
        <!-- Css -->
        <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/flatpickr.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/remixicon.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/select2.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/simplebar.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/slick-theme.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/slick.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/tiny-slider.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=ecg_heart" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <!-- Navbar STart -->
        <%@include file="dashboardtop.jsp" %>
        <!-- Navbar End -->

        <!-- Start Hero -->
    <section class="bg-half-260 d-table w-100" style="background: url('images/bg/01.jpg') center;">
        <div class="bg-overlay bg-overlay-dark"></div>
        <div class="container">
            <div class="row mt-5 mt-lg-0">
                <div class="col-12">
                    <div class="heading-title">
                        <img src="../assets/images/logo-icon.png" height="50" alt="">
                        <h4 class="display-4 fw-bold text-white title-dark mt-3 mb-4">Gặp Gỡ <br> Bác Sĩ Tốt Nhất</h4>
                        <p class="para-desc text-white-50 mb-0">Bác sĩ tận tâm sẽ hỗ trợ ngay lập tức cho con bạn, dù là trong trường hợp khẩn cấp hay chỉ là tư vấn đơn giản.</p>

                        <div class="mt-4 pt-2">
                            <a href="booking-appointment.html" class="btn btn-primary">Đặt Lịch Hẹn</a>
                            <p class="text-white-50 mb-0 mt-2">Điều khoản áp dụng. Vui lòng đọc Điều Khoản và Điều Kiện </p>
                        </div>
                    </div>

                </div><!--end col-->
            </div><!--end row-->
        </div><!--end container-->
    </section><!--end section-->
    <br>
    <div class="doctor-section py-5">
        <div class="container">
            <div class="section-header text-center mb-5">
                <h2 class="section-title fw-bold"> Danh sách thuốc</h2>
                <div class="section-divider mx-auto"></div>
            </div>
            <table>
                <main>
                    <section class="dashboard">

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
                                </div>
                            </form>



                            <!-- Medicine List Table -->
                            <table>
                                <thead>
                                    <tr>
                                        <th>Số thứ tự</th> <!-- Add a header for the serial number -->
                                        <th>Tên thuốc</th>
                                        <th>Công dụng</th>
                                        <th>Loại thuốc</th>
                                        <th>Nhà sản xuất</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty medicineList}">
                                    <c:set var="counter" value="1" /> <!-- Initialize the counter -->
                                    <c:forEach var="medicine" items="${medicineList}">
                                        <tr>
                                            <td><c:out value="${counter}" /></td> <!-- Display the counter -->
                                            <td><c:out value="${medicine.name}" /></td>
                                            <td><c:out value="${medicine.uses}" /></td>
                                            <td><c:out value="${medicine.categoryName}" /></td>
                                            <td><c:out value="${medicine.manufactureName}" /></td>
                                        </tr>
                                        <c:set var="counter" value="${counter + 1}" /> <!-- Increment the counter -->
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty medicineList}">
                                    <tr>
                                        <td colspan="6" style="text-align: center;">Không tìm thấy thuốc</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>




                        <!-- Pagination -->
                        <div class="pagination">
                            <c:if test="${pageIndex > 1}">
                                <a href="medicine?page=${pageIndex - 1}&search=${param.search}&category=${param.category}&manufacturer=${param.manufacturer}">« Trước</a>
                            </c:if>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <a href="medicine?page=${i}&search=${param.search}&category=${param.category}&manufacturer=${param.manufacturer}" class="<c:if test='${i == pageIndex}'>active</c:if>">${i}</a>
                            </c:forEach>
                            <c:if test="${pageIndex < totalPages}">
                                <a href="medicine?page=${pageIndex + 1}&search=${param.search}&category=${param.category}&manufacturer=${param.manufacturer}">Tiếp theo »</a>
                            </c:if>
                        </div>
                    </section>
                </main>
                                    <style>/* General Styles */
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    color: #333;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

main {
    padding: 20px;
}

.dashboard {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

/* Filter Form Styles */
.filter-form {
    margin-bottom: 20px;
}

.filter-group {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
}

.filter-group input[type="text"],
.filter-group select {
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
    flex-grow: 1;
}

.filter-group button {
    padding: 8px 16px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.filter-group button:hover {
    background-color: #0056b3;
}

/* Table Styles */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
}

tbody tr:hover {
    background-color: #f5f5f5;
}

/* Pagination Styles */
.pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.pagination a {
    color: #007bff;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color 0.3s;
    border: 1px solid #ddd;
    margin: 0 4px;
}

.pagination a.active {
    background-color: #007bff;
    color: white;
    border: 1px solid #007bff;
}

.pagination a:hover:not(.active) {
    background-color: #ddd;
}

/* Responsive Design */
@media (max-width: 768px) {
    .filter-group {
        flex-direction: column;
    }
    
    table {
        font-size: 14px;
    }
    
    th, td {
        padding: 8px;
    }
}</style>
                <!-- Back to top -->
                <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
                <!-- Back to top -->
                <!-- javascript -->
                <script src="js/bootstrap.bundle.min.js"></script>

                <!-- SLIDER -->
                <script src="js/tiny-slider.js"></script>
                <script src="js/tiny-slider-init.js"></script>
                <!-- Counter -->
                <script src="js/counter.init.js"></script>
                <!-- Icons -->
                <script src="js/feather.min.js"></script>
                <!-- Main Js -->
                <script src="js/app.js"></script>
                </body>
                </html>