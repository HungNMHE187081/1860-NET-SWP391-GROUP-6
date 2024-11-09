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

        <!-- Start Hero -->
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

                <!-- Login Button -->
                <ul class="dropdowns list-inline mb-0">
                    <li class="list-inline-item mb-0 ms-1">
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-pills btn-soft-primary">
                            <i class="uil uil-sign-in-alt me-1"></i> Đăng nhập
                        </a>
                    </li>
                </ul>

                <!-- Navigation Menu -->
                <div id="navigation">
                    <ul class="navigation-menu nav-left nav-light">
                        <li class="menu-item">
                            <a href="${pageContext.request.contextPath}/guest/homepage" class="sub-menu-item">
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
                            <a href="${pageContext.request.contextPath}/guest/services">
                                <i class="uil uil-medical-square me-1"></i>Dịch vụ
                            </a>
                            <span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="${pageContext.request.contextPath}/guest/services?ageLimit=1" class="sub-menu-item">
                                        <i class="uil uil-baby-carriage me-1"></i>Trẻ sơ sinh</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/guest/services?ageLimit=2" class="sub-menu-item">
                                        <i class="uil uil-kid me-1"></i>Trẻ từ 1 đến 5 tuổi</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/guest/services?ageLimit=3" class="sub-menu-item">
                                        <i class="uil uil-book-reader me-1"></i>Trẻ từ 6 đến 12 tuổi</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/guest/services?ageLimit=4" class="sub-menu-item">
                                        <i class="uil uil-user-md me-1"></i>Trẻ từ 13 đến 18 tuổi</a>
                                </li>
                            </ul>
                        </li>

                        <li class="has-submenu parent-menu-item">
                            <a href="${pageContext.request.contextPath}/guest/view-staffs">
                                <i class="uil uil-user-md me-1"></i>Đội ngũ bác sĩ
                            </a>
                        </li>

                        <li class="has-submenu parent-menu-item">
                            <a href="${pageContext.request.contextPath}/guest/bloglist">
                                <i class="uil uil-newspaper me-1"></i>Blog
                            </a>
                        </li>

                        <li class="has-submenu parent-parent-menu-item">
                            <a href="${pageContext.request.contextPath}/guest/feedback">
                                <i class="uil uil-star me-1"></i>Phản hồi
                            </a>
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
                         <a href="${pageContext.request.contextPath}/customer/listservices" class="btn btn-primary">Đặt Dịch Vụ</a>
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
                <h2 class="section-title fw-bold">Đội Ngũ Bác Sĩ</h2>
                <div class="section-divider mx-auto"></div>
            </div>

            <!-- Search and Filter Section -->
<div class="search-filter-section mb-4">
    <form action="${pageContext.request.contextPath}/guest/searchstaff" method="get" class="filter-form">
        <div class="row g-3">
            <div class="col-md-4">
                <div class="search-box">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" id="doctorSearch" name="keyword" class="form-control" placeholder="Tìm kiếm theo tên...">
                </div>
            </div>
            <div class="col-md-3">
                <select class="form-select" id="degreeFilter" name="degreeID">
                    <option value="">Tất cả bằng cấp</option>
                    <c:forEach var="degree" items="${degrees}">
                        <option value="${degree.degreeID}">${degree.degreeName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-3">
                <select class="form-select" id="specializationFilter" name="specializationID">
                    <option value="">Tất cả chuyên môn</option>
                    <c:forEach var="specialization" items="${specializations}">
                        <option value="${specialization.specializationID}">${specialization.specializationName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
            </div>
        </div>
    </form>
</div>
            <!-- Doctors Grid -->
            <div class="doctors-grid">
                <div class="row g-4">
                    <c:forEach var="staff" items="${staffs}" varStatus="status">
                        <div class="col-lg-4 col-md-6 doctor-item">
                            <div class="doctor-card">
                                <div class="doctor-image-wrapper">
                                    <img src="${pageContext.request.contextPath}/${user.profileImage}" 
                                         alt="${staff.staffName}" 
                                         class="doctor-image">
                                </div>
                                <div class="doctor-info">
                                    <h3 class="doctor-name">${staff.staffName}</h3>
                                    <div class="doctor-credentials">
                                        <span class="doctor-degree">
                                            <i class="fas fa-graduation-cap"></i>
                                            <c:forEach var="degree" items="${degrees}">
                                                <c:if test="${degree.degreeID == staff.degreeID}">
                                                    ${degree.degreeName}
                                                </c:if>
                                            </c:forEach>
                                        </span>
                                        <span class="doctor-specialization">
                                            <i class="fas fa-stethoscope"></i>
                                            <c:forEach var="specialization" items="${specializations}">
                                                <c:if test="${specialization.specializationID == staff.specializationID}">
                                                    ${specialization.specializationName}
                                                </c:if>
                                            </c:forEach>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <style>/* Doctor Section Styles */
        .doctor-section {
            background-color: #f8f9fa;
            padding: 4rem 0;
        }

        .section-header {
            margin-bottom: 3rem;
        }

        .section-title {
            color: #2c3e50;
            margin-bottom: 1rem;
            font-size: 2.5rem;
        }

        .section-divider {
            width: 80px;
            height: 3px;
            background: linear-gradient(to right, #3498db, #2ecc71);
            margin: 0 auto;
        }

        /* Search and Filter Styles */
        .search-filter-section {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .search-box {
            position: relative;
        }

        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }

        #doctorSearch {
            padding-left: 40px;
        }

        /* Statistics Styles */
        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            transition: transform 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-card i {
            font-size: 2rem;
            color: #3498db;
            margin-bottom: 1rem;
        }

        .stat-card h3 {
            font-size: 1.8rem;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }

        .stat-card p {
            color: #666;
            margin: 0;
        }

        /* Doctor Card Styles */
        .doctor-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s ease;
            height: 100%;
        }

        .doctor-card:hover {
            transform: translateY(-5px);
        }

        .doctor-image-wrapper {
            position: relative;
            padding-top: 100%;
        }

        .doctor-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .doctor-info {
            padding: 1.5rem;
        }

        .doctor-name {
            font-size: 1.25rem;
            color: #2c3e50;
            margin-bottom: 1rem;
            font-weight: 600;
        }

        .doctor-credentials {
            display: flex;
            flex-direction: column;
            gap: 0.8rem;
        }

        .doctor-degree,
        .doctor-specialization {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            color: #666;
            font-size: 0.95rem;
        }

        .doctor-degree i,
        .doctor-specialization i {
            color: #3498db;
            width: 20px;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .section-title {
                font-size: 2rem;
            }
        }

        @media (max-width: 768px) {
            .doctor-section {
                padding: 3rem 0;
            }

            .stat-card {
                margin-bottom: 1rem;
            }
        }
        </style>
    <!-- Back to top -->
    <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
    <!-- Back to top -->
</body>
</html>
