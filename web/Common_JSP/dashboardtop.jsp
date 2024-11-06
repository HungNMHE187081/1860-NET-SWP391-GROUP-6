<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<header id="topnav" class="navigation sticky">
    <div class="container">

        <!-- Mobile Toggle -->
        <div class="menu-extras">
            <div class="menu-item">
                <a class="navbar-toggle" id="isToggle" onclick="toggleMenu()">
                    <div class="lines">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </a>
            </div>
        </div>

        <!-- User Profile Dropdown -->
        <ul class="dropdowns list-inline mb-0">
            <li class="list-inline-item mb-0 ms-1">
                <div class="dropdown dropdown-primary">
                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown">
                        <img src="${pageContext.request.contextPath}/${user.profileImage}" class="avatar avatar-ex-small rounded-circle" alt="Profile">
                    </button>
                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 250px;">
                        <!-- Profile Header -->
                        <a class="dropdown-item d-flex align-items-center text-dark" href="${pageContext.request.contextPath}/customer/viewprofile">
                            <img src="${pageContext.request.contextPath}/${user.profileImage}" class="avatar avatar-md-sm rounded-circle border shadow" alt="Profile">
                            <div class="flex-1 ms-2">
                                <span class="d-block mb-1">${user.firstName} ${user.lastName}</span>
                                <small class="text-muted"><i class="uil uil-envelope-alt me-1"></i>${user.email}</small><br>
                                <small class="text-muted"><i class="uil uil-phone me-1"></i>${user.phoneNumber}</small>
                            </div>
                        </a>
                        <div class="dropdown-divider border-top"></div>

                        <!-- Quick Actions -->
                        <a class="dropdown-item text-dark" href="${pageContext.request.contextPath}/customer/viewprofile">
                            <i class="uil uil-user-circle align-middle me-1"></i> Thông tin cá nhân
                        </a>
                        <a class="dropdown-item text-dark" href="${pageContext.request.contextPath}/customer/editprofile">
                            <i class="uil uil-setting align-middle me-1"></i> Cập nhật thông tin
                        </a>
                        <div class="dropdown-divider border-top"></div>
                        <a class="dropdown-item text-dark" href="${pageContext.request.contextPath}/logout">
                            <i class="uil uil-sign-out-alt align-middle me-1"></i> Đăng xuất
                        </a>
                    </div>
                </div>
            </li>
        </ul>

        <!-- Navigation Menu -->
        <div id="navigation">
            <ul class="navigation-menu nav-left nav-light">
                <li class="menu-item">
                    <a href="${pageContext.request.contextPath}/customer/homepage" class="sub-menu-item">
                        <img src="../img/logo-1.png" alt="Trang Chủ" style="width:150px; height:auto;"/>
                    </a>
                </li>
                <style>
                    .menu-item img {
                        max-width: 100%;
                        height: auto;
                    }
                </style>

                <li class="has-submenu parent-parent-menu-item">
                    <a href="${pageContext.request.contextPath}/customer/listservices">
                        <i class="uil uil-medical-square me-1"></i>Dịch vụ
                    </a>
                    <span class="menu-arrow"></span>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath}/customer/listservices?ageLimit=1" class="sub-menu-item">
                                <i class="uil uil-baby-carriage me-1"></i>Trẻ sơ sinh</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/customer/listservices?ageLimit=2" class="sub-menu-item">
                                <i class="uil uil-kid me-1"></i>Trẻ từ 1 đến 5 tuổi</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/customer/listservices?ageLimit=3" class="sub-menu-item">
                                <i class="uil uil-book-reader me-1"></i>Trẻ từ 6 đến 12 tuổi</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/customer/listservices?ageLimit=4" class="sub-menu-item">
                                <i class="uil uil-user-md me-1"></i>Trẻ từ 13 đến 18 tuổi</a>
                        </li>
                    </ul>
                </li>

                <li class="has-submenu parent-menu-item">
                    <a href="${pageContext.request.contextPath}/customer/view-staffs">
                        <i class="uil uil-user-md me-1"></i>Đội ngũ bác sĩ
                    </a>
                </li>

                <li class="has-submenu parent-menu-item">
                    <a href="${pageContext.request.contextPath}/customer/bloglist">Blog<span class="menu-arrow"></span></a>
                </li>

                <li class="has-submenu parent-parent-menu-item">
                    <a href="${pageContext.request.contextPath}/customer/feedback">
                        <i class="uil uil-star me-1"></i>Phản hồi
                    </a>
                    <span class="menu-arrow"></span>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath}/customer/addfeedback" class="sub-menu-item">
                                <i class="uil uil-comment-alt-message me-1"></i>Gửi phản hồi</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/customer/feedback" class="sub-menu-item">
                                <i class="uil uil-comments me-1"></i>Xem phản hồi</a>
                        </li>
                    </ul>
                </li>

                <li class="has-submenu parent-parent-menu-item">
                    <a href="${pageContext.request.contextPath}/customer/listreservations">
                        <i class="uil uil-schedule me-1"></i>Lịch khám
                    </a>
                    <span class="menu-arrow"></span>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath}/customer/viewcart" class="sub-menu-item">
                                <i class="uil uil-shopping-cart me-1"></i>Giỏ hàng</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/customer/listreservations" class="sub-menu-item">
                                <i class="uil uil-calendar-alt me-1"></i>Lịch hẹn sắp tới</a>
                        </li>
                        <li><a href="departments.html" class="sub-menu-item">
                                <i class="uil uil-history me-1"></i>Lịch sử khám</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/customer/listchildren" class="sub-menu-item">
                                <i class="uil uil-kid me-1"></i>Hồ sơ trẻ em</a> 
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!-- javascript -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

    <!-- SLIDER -->
    <script src="${pageContext.request.contextPath}/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/js/tiny-slider-init.js"></script>
    <!-- Counter -->
    <script src="${pageContext.request.contextPath}/js/counter.init.js"></script>
    <!-- Icons -->
    <script src="${pageContext.request.contextPath}/js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</header>