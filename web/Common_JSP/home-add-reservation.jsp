<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thêm Lịch Khám</title>
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
        <style>
            .reservation-form {
                background: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
                margin-top: 30px;
                margin-bottom: 30px;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-control {
                height: 45px;
                border-radius: 5px;
                border: 1px solid #ddd;
            }
            .form-control:focus {
                border-color: #80bdff;
                box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
            }
            .btn-submit {
                width: 100%;
                height: 45px;
                font-size: 16px;
                font-weight: 600;
                margin-top: 20px;
            }
            .section-title {
                text-align: center;
                margin-bottom: 30px;
                color: #333;
                font-weight: 600;
            }
            label {
                font-weight: 500;
                margin-bottom: 8px;
                color: #555;
            }
        </style>
    </head>
    <body>
        <%@include file="dashboardtop.jsp" %>

        <section class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10">
                        <div class="reservation-form">
                            <h2 class="section-title">Đặt Lịch Khám</h2>
                            <form action="${pageContext.request.contextPath}/customer/addreservation" method="post">
                                <input type="hidden" name="serviceID" value="${service.serviceID}">

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="serviceName">Tên Dịch Vụ</label>
                                            <input type="text" class="form-control" id="serviceName" value="${service.serviceName}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="ageLimit">Dành cho độ tuổi</label>
                                            <input type="hidden" name="ageLimitID" value="${ageLimit.ageLimitID}">
                                            <input type="text" class="form-control" id="ageLimit" value="${ageLimit.ageLimit}" readonly>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="childName">Tên Trẻ</label>
                                            <select class="form-control" id="childName" name="childID" required>
                                                <option value="" disabled selected>Chọn trẻ</option>
                                                <c:forEach var="child" items="${children}">
                                                    <option value="childID">${child.firstName} ${child.middleName} ${child.lastName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="reservationDate">Ngày Khám</label>
                                            <input type="date" class="form-control" id="reservationDate" name="reservationDate" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="startTime">Giờ Khám</label>
                                            <input type="time" class="form-control" id="startTime" name="startTime" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="staffID">Bác Sĩ</label>
                                            <select class="form-control" id="staffID" name="staffID" required>
                                                <option value="" disabled selected>Chọn bác sĩ</option>
                                                <c:forEach var="staff" items="${staffs}">
                                                    <option value="${staff.staffID}">${staff.staffName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="isCheckOut">Phương thức thanh toán</label>
                                            <select class="form-control" id="isCheckOut" name="isCheckOut" required>
                                                <option value="" disabled selected>--- Chọn phương thức thanh toán ---</option>
                                                <option value="CheckOut">Thanh toán trực tiếp tại trung tâm</option>
                                                <option value="NotCheckOut">Thanh toán chuyển khoản</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" onclick="return confirm('Bạn có chắc chắn muốn đặt lịch khám không?')"
                                        class="btn btn-primary btn-save">Đặt Lịch Khám</button>
                            </form>
                            <div class="form-group col-md-12">
                                    <a class="btn btn-cancel" href="${pageContext.request.contextPath}/homepage">Hủy bỏ</a>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="footer.jsp" %>
    </body>
</html>
