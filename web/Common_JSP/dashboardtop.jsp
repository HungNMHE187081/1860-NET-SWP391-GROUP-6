<%-- 
    Document   : dashboardtop
    Created on : Oct 11, 2024, 1:38:32 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<header id="topnav" class="navigation sticky">
    <div class="container">
        <!-- Logo container-->
        <div>
            <a class="logo" href="index.html">
                <span class="logo-light-mode">
                    <img src="../img/logo-1.png" class="l-light" height="30" alt="">
                </span>
                <img src="../img/logo-1.png" height="24" class="logo-dark-mode" alt="">
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
                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="../images/doctors/01.jpg" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                        <a class="dropdown-item d-flex align-items-center text-dark" href="doctor-profile.html">
                            <img src="../images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
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
                        <li><a href="${pageContext.request.contextPath}/customer/listorders" class="sub-menu-item">Lịch khám sắp tới</a></li>
                        <li><a href="departments.html" class="sub-menu-item">Lịch sử khám bệnh</a></li>
                        <li><a href="${pageContext.request.contextPath}/Common_JSP/user-children.jsp" class="sub-menu-item">Con trẻ của bạn</a></li>
                    </ul>
                </li>
            </ul>
            <!--end navigation menu-->
        </div><!--end navigation-->
    </div><!--end container-->
</header><!--end header-->
