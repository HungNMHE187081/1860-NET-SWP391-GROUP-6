<%-- 
    Document   : dashboardtop
    Created on : Oct 11, 2024, 1:38:32 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <head>
        <meta charset="UTF-8">
        <title>Tiny Tots - Trang chủ</title>
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
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Icons -->
        <link href="css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/remixicon.css" rel="stylesheet" type="text/css"/>
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- SLIDER -->
        <link href="css/tiny-slider.css" rel="stylesheet" type="text/css"/>
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/flatpickr.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.timepicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/remixicon.css" rel="stylesheet" type="text/css"/>
        <link href="css/select2.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/simplebar.css" rel="stylesheet" type="text/css"/>
        <link href="css/slick-theme.css" rel="stylesheet" type="text/css"/>
        <link href="css/slick.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/tiny-slider.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=ecg_heart" />
    </head>

<header id="topnav" class="navigation sticky">
    <div class="container">
        <!-- Logo container-->
        <div>
            <a class="logo" href="index.html">
                <span class="logo-light-mode">
                    <img src="img/logo-1.png" class="l-light" height="30" alt="">
                </span>
                <img src="img/logo-1.png" height="24" class="logo-dark-mode" alt="">
            </a>
        </div>
        <!-- End Logo container-->

        <!-- Start Mobile Toggle -->
        <div class="menu-extras">
            <div class="menu-item">
                <!-- Mobile menu toggle-->
                <a class="navbar-toggle" id="isToggle" onclick="toggleMenu()">
                    <div class="lines">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </a>
                <!-- End mobile menu toggle-->
            </div>
        </div>
        <!-- End Mobile Toggle -->

        <!-- Start Dropdown -->
        <ul class="dropdowns list-inline mb-0">

            <li class="list-inline-item mb-0 ms-1">
                <div class="dropdown dropdown-primary">
                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="images/doctors/01.jpg" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                        <a class="dropdown-item d-flex align-items-center text-dark" href="doctor-profile.html">
                            <img src="images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                            <div class="flex-1 ms-2">
                                <span class="d-block mb-1">Trần Hoàng Nam</span>
                                <small class="text-muted">Bác Sĩ</small>
                            </div>
                        </a>
                        <a class="dropdown-item text-dark" href="doctor-dashboard.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Bảng điều khiển</a>
                        <a class="dropdown-item text-dark" href="doctor-profile-setting.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Chỉnh sửa hồ sơ</a>
                        <div class="dropdown-divider border-top"></div>
                        <a class="dropdown-item text-dark" href="login.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Đăng xuất</a>
                    </div>
                </div>
            </li>
        </ul>
        <!-- Start Dropdown -->

        <div id="navigation">
            <!-- Navigation Menu-->   
            <ul class="navigation-menu nav-left nav-light">
                <li class="has-submenu parent-menu-item">
                    <a href="${pageContext.request.contextPath}/homepage">Trang Chủ</a>
                </li>

                <li class="has-submenu parent-parent-menu-item">
                    <a href="${pageContext.request.contextPath}/listservice">Dịch vụ</a><span class="menu-arrow"></span>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath}/listservice" class="sub-menu-item">Trẻ sơ sinh</a></li>
                        <li><a href="${pageContext.request.contextPath}/listservice" class="sub-menu-item">Trẻ từ 1 đến 5 tuổi</a></li>
                        <li><a href="${pageContext.request.contextPath}/listservice" class="sub-menu-item">Trẻ từ 6 đến 12 tuổi</a></li>
                        <li><a href="${pageContext.request.contextPath}/listservice" class="sub-menu-item">Trẻ từ 13 đến 18 tuổi</a></li>
                    </ul>
                </li>

                <li class="has-submenu parent-menu-item">
                    <a href="javascript:void(0)">Chuyên gia khám chữa bệnh</a><span class="menu-arrow"></span>
                    <ul class="submenu">
                        <li><a href="patient-dashboard.html" class="sub-menu-item">Bảng Điều Khiển</a></li>
                        <li><a href="patient-profile.html" class="sub-menu-item">Hồ Sơ</a></li>
                        <li><a href="booking-appointment.html" class="sub-menu-item">Đặt Lịch Hẹn</a></li>
                        <li><a href="patient-invoice.html" class="sub-menu-item">Hóa Đơn</a></li>
                    </ul>
                </li>

                <li class="has-submenu parent-menu-item">
                    <a href="javascript:void(0)">Blog</a><span class="menu-arrow"></span>
                </li>

                <li class="has-submenu parent-parent-menu-item">
                    <a href="javascript:void(0)">Đánh giá</a>
                </li>
                <li class="has-submenu parent-parent-menu-item">
                    <a href="javascript:void(0)">Lịch khám của bạn</a><span class="menu-arrow"></span>
                    <ul class="submenu">
                        <li><a href="aboutus.html" class="sub-menu-item">Giỏ hàng</a></li>
                        <li><a href="departments.html" class="sub-menu-item">Lịch đã đặt</a></li>
                        <li><a href="departments.html" class="sub-menu-item">Thêm trẻ</a></li>
                    </ul>
                </li>
            </ul>
            <!--end navigation menu-->
        </div><!--end navigation-->
    </div><!--end container-->
</header><!--end header-->