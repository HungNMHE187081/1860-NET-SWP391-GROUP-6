<%-- 
    Document   : dashboardtop
    Created on : Oct 11, 2024, 1:38:32 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                            <a href="javascript:void(0)">Trang Chủ</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="index.html" class="sub-menu-item">Trang Chính 1</a></li>
                                <li><a href="index-two.html" class="sub-menu-item">Trang Chính 2</a></li>
                                <li><a href="index-three.html" class="sub-menu-item">Trang Chính 3</a></li>
                            </ul>
                        </li>

                        <li class="has-submenu parent-parent-menu-item">
                            <a href="javascript:void(0)">Bác Sĩ</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li class="has-submenu parent-menu-item">
                                    <a href="javascript:void(0)" class="menu-item"> Bảng Điều Khiển </a><span class="submenu-arrow"></span>
                                    <ul class="submenu">
                                        <li><a href="doctor-dashboard.html" class="sub-menu-item">Bảng Điều Khiển</a></li>
                                        <li><a href="doctor-appointment.html" class="sub-menu-item">Cuộc Hẹn</a></li>
                                        <li><a href="patient-list.html" class="sub-menu-item">Danh Sách Bệnh Nhân</a></li>
                                        <li><a href="doctor-schedule.html" class="sub-menu-item">Lịch Làm Việc</a></li>
                                        <li><a href="invoices.html" class="sub-menu-item">Hóa Đơn</a></li>
                                        <li><a href="patient-review.html" class="sub-menu-item">Đánh Giá</a></li>
                                        <li><a href="doctor-messages.html" class="sub-menu-item">Tin Nhắn</a></li>
                                        <li><a href="doctor-profile.html" class="sub-menu-item">Hồ Sơ</a></li>
                                        <li><a href="doctor-profile-setting.html" class="sub-menu-item">Cài Đặt Hồ Sơ</a></li>
                                        <li><a href="doctor-chat.html" class="sub-menu-item">Trò Chuyện</a></li>
                                        <li><a href="login.html" class="sub-menu-item">Đăng Nhập</a></li>
                                        <li><a href="signup.html" class="sub-menu-item">Đăng Ký</a></li>
                                        <li><a href="forgot-password.html" class="sub-menu-item">Quên Mật Khẩu</a></li>
                                    </ul>
                                </li>
                                <li><a href="doctor-team-one.html" class="sub-menu-item">Nhóm Bác Sĩ 1</a></li>
                                <li><a href="doctor-team-two.html" class="sub-menu-item">Nhóm Bác Sĩ 2</a></li>
                                <li><a href="doctor-team-three.html" class="sub-menu-item">Nhóm Bác Sĩ 3</a></li>
                            </ul>
                        </li>

                        <li class="has-submenu parent-menu-item">
                            <a href="javascript:void(0)">Bệnh Nhân</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="patient-dashboard.html" class="sub-menu-item">Bảng Điều Khiển</a></li>
                                <li><a href="patient-profile.html" class="sub-menu-item">Hồ Sơ</a></li>
                                <li><a href="booking-appointment.html" class="sub-menu-item">Đặt Lịch Hẹn</a></li>
                                <li><a href="patient-invoice.html" class="sub-menu-item">Hóa Đơn</a></li>
                            </ul>
                        </li>

                        <li class="has-submenu parent-menu-item">
                            <a href="javascript:void(0)">Nhà Thuốc</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="pharmacy.html" class="sub-menu-item">Nhà Thuốc</a></li>
                                <li><a href="pharmacy-shop.html" class="sub-menu-item">Cửa Hàng</a></li>
                                <li><a href="pharmacy-product-detail.html" class="sub-menu-item">Chi Tiết Thuốc</a></li>
                                <li><a href="pharmacy-shop-cart.html" class="sub-menu-item">Giỏ Hàng</a></li>
                                <li><a href="pharmacy-checkout.html" class="sub-menu-item">Thanh Toán</a></li>
                                <li><a href="pharmacy-account.html" class="sub-menu-item">Tài Khoản</a></li>
                            </ul>
                        </li>

                        <li class="has-submenu parent-parent-menu-item">
                            <a href="javascript:void(0)">Trang</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="aboutus.html" class="sub-menu-item">Về Chúng Tôi</a></li>
                                <li><a href="departments.html" class="sub-menu-item">Phòng Ban</a></li>
                                <li><a href="faqs.html" class="sub-menu-item">Câu Hỏi Thường Gặp</a></li>
                                <li class="has-submenu parent-menu-item">
                                    <a href="javascript:void(0)" class="menu-item"> Blog </a><span class="submenu-arrow"></span>
                                    <ul class="submenu">
                                        <li><a href="blogs.html" class="sub-menu-item">Blog</a></li>
                                        <li><a href="blog-detail.html" class="sub-menu-item">Chi Tiết Blog</a></li>
                                    </ul>
                                </li>
                                <li><a href="terms.html" class="sub-menu-item">Điều Khoản & Chính Sách</a></li>
                                <li><a href="privacy.html" class="sub-menu-item">Chính Sách Bảo Mật</a></li>
                                <li><a href="error.html" class="sub-menu-item">404 !</a></li>
                                <li><a href="contact.html" class="sub-menu-item">Liên Hệ</a></li>
                            </ul>
                        </li>
                        <li><a href="../admin/index.html" class="sub-menu-item" target="_blank">Quản Trị</a></li>
                    </ul>
                    <!--end navigation menu-->
                </div><!--end navigation-->
            </div><!--end container-->
        </header><!--end header-->