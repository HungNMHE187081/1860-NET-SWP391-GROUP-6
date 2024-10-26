<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

    <body>
        <!-- Loader -->
                <div id="preloader">
                    <div id="status">
                        <div class="spinner">
                            <div class="double-bounce1"></div>
                            <div class="double-bounce2"></div>
                        </div>
                    </div>
                </div>
        <!-- Loader -->

        <!-- Navbar STart -->
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
                                <a class="dropdown-item text-dark" href="${pageContext.request.contextPath}/customer/viewprofile"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Chỉnh sửa hồ sơ</a>
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
        <!-- End Hero -->

        <!-- Start -->
        <section class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-10">
                        <div class="features-absolute bg-white shadow rounded overflow-hidden card-group">
                            <div class="card border-0 bg-light p-4">
                                <h5 class="mt-1">Trường Hợp Khẩn Cấp</h5>
                                <p class="text-muted mt-2">Đây là trường hợp cần thiết khi, ví dụ, thông tin chưa có sẵn. Văn bản giả cũng được biết đến là 'văn bản điền'.</p>
                                <a href="departments.html" class="text-primary">Đọc Thêm</a>
                            </div>

                            <div class="card border-0 p-4">
                                <h5 class="mt-1">Lịch Trình Bác Sĩ</h5>
                                <p class="text-muted mt-2">Đây là trường hợp cần thiết khi, ví dụ, thông tin chưa có sẵn. Văn bản giả cũng được biết đến là 'văn bản điền'.</p>
                                <a href="departments.html" class="text-primary">Đọc Thêm</a>
                            </div>

                            <div class="card border-0 bg-light p-4">
                                <h5 class="mt-1">Giờ Mở Cửa</h5>
                                <ul class="list-unstyled mt-2">
                                    <li class="d-flex justify-content-between">
                                        <p class="text-muted mb-0">Thứ Hai - Thứ Sáu</p>
                                        <p class="text-primary mb-0">8.00 - 20.00</p>
                                    </li>
                                    <li class="d-flex justify-content-between">
                                        <p class="text-muted mb-0">Thứ Bảy</p>
                                        <p class="text-primary mb-0">8.00 - 18.00</p>
                                    </li>
                                    <li class="d-flex justify-content-between">
                                        <p class="text-muted mb-0">Chủ Nhật</p>
                                        <p class="text-primary mb-0">8.00 - 14.00</p>
                                    </li>
                                </ul>
                                <a href="departments.html" class="text-primary">Đọc Thêm</a>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->


            <div class="container mt-100 mt-60">
                <div class="row align-items-center">
                    <div class="col-lg-5 col-md-6">
                        <div class="position-relative">
                            <img src="images/about/about-2.png" class="img-fluid" alt="">
                            <!--                            <div class="play-icon">
                                                            <a href="#" data-bs-toggle="modal" data-bs-target="#watchvideomodal" class="play-btn video-play-icon">
                                                                <i class="mdi mdi-play text-primary rounded-circle bg-white title-bg-dark shadow"></i>
                                                            </a>
                                                        </div>-->
                        </div>
                    </div><!--end col-->

                    <div class="col-lg-7 col-md-6 mt-4 mt-lg-0 pt- pt-lg-0">
                        <div class="ms-lg-4">
                            <div class="section-title">
                                <h4 class="title mb-4">Về Dịch Vụ Chăm Sóc Trẻ Em Của Chúng Tôi</h4>
                                <p class="text-muted para-desc">Đội ngũ chăm sóc tận tâm của chúng tôi luôn sẵn sàng hỗ trợ nhu cầu chăm sóc trẻ em của bạn, từ việc giữ trẻ hàng ngày, các hoạt động giáo dục đến chăm sóc đặc biệt. Chúng tôi cam kết mang đến môi trường an toàn và nuôi dưỡng cho sự phát triển toàn diện của trẻ.</p>
                            </div>

                            <div class="mt-4">
                                <a href="aboutus.html" class="btn btn-primary">Đọc thêm</a>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->

            <div class="container mt-100 mt-60">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title mb-4 pb-2 text-center">
                            <span class="badge badge-pill badge-soft-primary mb-3">Các Khoa</span>
                            <h4 class="title mb-4">Các Dịch Vụ Y Tế Của Chúng Tôi</h4>
                            <p class="text-muted mx-auto para-desc mb-0">Bác sĩ giỏi nếu bạn cần người thân của mình được hỗ trợ hiệu quả ngay lập tức, điều trị khẩn cấp hoặc tư vấn đơn giản.</p>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row">
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary border-0">
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Chăm Sóc Mắt</a>
                                <p class="text-muted mt-3">Hiện nay có rất nhiều văn bản giả được sử dụng chỉ để lấp đầy không gian trống.</p>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary border-0">
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Tâm Lý Trị Liệu</a>
                                <p class="text-muted mt-3">Hiện nay có rất nhiều văn bản giả được sử dụng chỉ để lấp đầy không gian trống.</p>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary border-0">
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Chăm Sóc Cơ Bản</a>
                                <p class="text-muted mt-3">Hiện nay có rất nhiều văn bản giả được sử dụng chỉ để lấp đầy không gian trống.</p>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary border-0">
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Chăm Sóc Răng Miệng</a>
                                <p class="text-muted mt-3">Hiện nay có rất nhiều văn bản giả được sử dụng chỉ để lấp đầy không gian trống.</p>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary border-0">
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Chăm Sóc Cơ Xương Khớp</a>
                                <p class="text-muted mt-3">Hiện nay có rất nhiều văn bản giả được sử dụng chỉ để lấp đầy không gian trống.</p>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary border-0">
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Tim Mạch</a>
                                <p class="text-muted mt-3">Hiện nay có rất nhiều văn bản giả được sử dụng chỉ để lấp đầy không gian trống.</p>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary border-0">
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Phụ Khoa</a>
                                <p class="text-muted mt-3">Hiện nay có rất nhiều văn bản giả được sử dụng chỉ để lấp đầy không gian trống.</p>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary border-0">
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Thần Kinh Học</a>
                                <p class="text-muted mt-3">Hiện nay có rất nhiều văn bản giả được sử dụng chỉ để lấp đầy không gian trống.</p>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

            </div><!--end container-->
        </section><!--end section-->
        <!-- End -->

        <!-- Start -->
        <section class="section bg-light">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center mb-4 pb-2">
                            <span class="badge badge-pill badge-soft-primary mb-3">Lịch</span>
                            <h4 class="title mb-4">Bảng Thời Gian Của Nhân Viên Chăm Sóc</h4>
                            <p class="text-muted mx-auto para-desc mb-0">Đội ngũ chăm sóc tuyệt vời nếu bạn cần hỗ trợ ngay lập tức cho con em mình, chăm sóc khẩn cấp hoặc chỉ đơn giản là một buổi tư vấn.</p>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 mt-4 pt-2">
                        <div class="table-responsive shadow rounded">
                            <table class="table table-center table-bordered bg-white mb-0">
                                <thead>
                                    <tr>
                                        <th class="text-center py-4" style="min-width: 120px;">Thời Gian</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Thứ Hai</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Thứ Ba</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Thứ Tư</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Thứ Năm</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Thứ Sáu</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Thứ Bảy</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Chủ Nhật</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th class="text-center py-5">09:00</th>
                                        <td>
                                            <div class="d-flex mb-3">
                                                <div class="ms-3">
                                                    <h6 class="text-dark mb-0 d-block">Cô Linh</h6>
                                                    <small class="text-muted">Hoạt động sáng tạo</small>
                                                </div>
                                            </div>
                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">09:00 - 10:00</small>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <div class="d-flex mb-3">
                                                <div class="ms-3">
                                                    <h6 class="text-dark mb-0 d-block">Cô Hương</h6>
                                                    <small class="text-muted">Âm nhạc</small>
                                                </div>
                                            </div>
                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">09:00 - 11:00</small>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th class="text-center py-5">11:00</th>
                                        <td></td>
                                        <td>
                                            <div class="d-flex mb-3">
                                                <div class="ms-3">
                                                    <h6 class="text-dark mb-0 d-block">Thầy Minh</h6>
                                                    <small class="text-muted">Thể dục</small>
                                                </div>
                                            </div>
                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">11:00 - 12:00</small>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="d-flex mb-3">
                                                <div class="ms-3">
                                                    <h6 class="text-dark mb-0 d-block">Cô Thảo</h6>
                                                    <small class="text-muted">Kể chuyện</small>
                                                </div>
                                            </div>
                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">11:00 - 12:00</small>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="d-flex mb-3">
                                                <div class="ms-3">
                                                    <h6 class="text-dark mb-0 d-block">Cô Mai</h6>
                                                    <small class="text-muted">Học vẽ</small>
                                                </div>
                                            </div>
                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">11:00 - 12:00</small>
                                        </td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th class="text-center py-5">14:00</th>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <div class="d-flex mb-3">
                                                <div class="ms-3">
                                                    <h6 class="text-dark mb-0 d-block">Cô Lan</h6>
                                                    <small class="text-muted">Khoa học vui</small>
                                                </div>
                                            </div>
                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">14:00 - 15:30</small>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="d-flex mb-3">
                                                <div class="ms-3">
                                                    <h6 class="text-dark mb-0 d-block">Cô Thảo</h6>
                                                    <small class="text-muted">Đọc sách</small>
                                                </div>
                                            </div>
                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">14:00 - 15:00</small>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <th class="text-center py-5">16:00</th>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <div class="d-flex mb-3">
                                                <div class="ms-3">
                                                    <h6 class="text-dark mb-0 d-block">Cô Lan</h6>
                                                    <small class="text-muted">Thủ công</small>
                                                </div>
                                            </div>
                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">16:00 - 17:00</small>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <div class="d-flex mb-3">
                                                <div class="ms-3">
                                                    <h6 class="text-dark mb-0 d-block">Cô Lan</h6>
                                                    <small class="text-muted">Hoạt động ngoài trời</small>
                                                </div>
                                            </div>
                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">16:00 - 17:30</small>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th class="text-center py-5">18:00</th>
                                        <td>
                                            <div class="d-flex mb-3">
                                                <div class="ms-3">
                                                    <h6 class="text-dark mb-0 d-block">Cô Hương</h6>
                                                    <small class="text-muted">Múa</small>
                                                </div>
                                            </div>
                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">18:00 - 19:00</small>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="d-flex mb-3">
                                                <div class="ms-3">
                                                    <h6 class="text-dark mb-0 d-block">Cô Mai</h6>
                                                    <small class="text-muted">Nghệ thuật</small>
                                                </div>
                                            </div>
                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">18:00 - 19:00</small>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="d-flex mb-3">
                                                <div class="ms-3">
                                                    <h6 class="text-dark mb-0 d-block">Cô Thảo</h6>
                                                    <small class="text-muted">Trò chơi giáo dục</small>
                                                </div>
                                            </div>
                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">18:00 - 19:00</small>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="d-flex mb-3">
                                                <div class="ms-3">
                                                    <h6 class="text-dark mb-0 d-block">Cô Hương</h6>
                                                    <small class="text-muted">Âm nhạc</small>
                                                </div>
                                            </div>
                                            <small class="bg-soft-primary rounded py-1 px-2 d-block text-center">18:00 - 19:00</small>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--end section-->
        <!-- End -->

        <!-- Start -->
        <section class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center mb-4 pb-2">
                            <h4 class="title mb-4">Bác Sĩ</h4>
                            <p class="text-muted mx-auto para-desc mb-0">Bác sĩ giỏi nếu bạn cần người thân của mình được hỗ trợ hiệu quả ngay lập tức, điều trị khẩn cấp hoặc tư vấn đơn giản.</p>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row align-items-center">
                    <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                        <div class="card team border-0 rounded shadow overflow-hidden">
                            <div class="team-img position-relative">
                                <img src="images/doctors/01.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="card-body content text-center">
                                <a href="doctor-team-one.html" class="title text-dark h5 d-block mb-0">Nguyễn Văn An</a>
                                <small class="text-muted speciality">Khoa Nhi</small>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                        <div class="card team border-0 rounded shadow overflow-hidden">
                            <div class="team-img position-relative">
                                <img src="images/doctors/02.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="card-body content text-center">
                                <a href="doctor-team-one.html" class="title text-dark h5 d-block mb-0">Trần Thị Bích Ngọc</a>
                                <small class="text-muted speciality">Khoa Tâm lý trẻ em</small>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                        <div class="card team border-0 rounded shadow overflow-hidden">
                            <div class="team-img position-relative">
                                <img src="images/doctors/03.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="card-body content text-center">
                                <a href="doctor-team-one.html" class="title text-dark h5 d-block mb-0">Lê Minh Tùng</a>
                                <small class="text-muted speciality">Khoa Dinh dưỡng</small>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                        <div class="card team border-0 rounded shadow overflow-hidden">
                            <div class="team-img position-relative">
                                <img src="images/doctors/04.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="card-body content text-center">
                                <a href="doctor-team-one.html" class="title text-dark h5 d-block mb-0">Phạm Thanh Hà</a>
                                <small class="text-muted speciality">Khoa Phát triển hành vi trẻ em</small>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-12 mt-4 pt-2 text-center">
                        <a href="doctor-team-one.html" class="btn btn-primary">Xem thêm</a>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- End -->

        <!-- Start -->
        <section class="section pt-0">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 text-center">
                        <div class="video-solution-cta position-relative" style="z-index: 1;">
                            <div class="position-relative">
                                <img src="images/bg/01.jpg" class="img-fluid rounded-md shadow-lg" alt="">
                                <div class="play-icon">
                                    <a href="#" data-bs-toggle="modal" data-bs-target="#watchvideomodal" class="play-btn video-play-icon">
                                    </a>
                                </div>
                            </div>

                            <div class="content">
                                <div class="row" id="counter">
                                    <div class="col-md-4 mt-4 pt-2">
                                        <div class="counter-box text-center">
                                            <h1 class="mt-3 text-white title-dark"><span class="counter-value" data-target="99">10</span>%</h1>
                                            <h5 class="counter-head text-white title-dark mb-1">Phản hồi tích cực</h5>
                                            <p class="text-white-50 mb-0">Từ các bác sĩ</p>
                                        </div><!--kết thúc counter box-->
                                    </div><!--kết thúc col-->
                                    <div class="col-md-4 mt-4 pt-2">
                                        <div class="counter-box text-center">
                                            <h1 class="mt-3 text-white title-dark"><span class="counter-value" data-target="25">2</span>+</h1>
                                            <h5 class="counter-head text-white title-dark mb-1">Phòng khám có kinh nghiệm</h5>
                                            <p class="text-white-50 mb-0">Trình độ cao</p>
                                        </div><!--kết thúc counter box-->
                                    </div><!--kết thúc col-->
                                    <div class="col-md-4 mt-4 pt-2">
                                        <div class="counter-box text-center">
                                            <h1 class="mt-3 text-white title-dark"><span class="counter-value" data-target="1251">95</span>+</h1>
                                            <h5 class="counter-head text-white title-dark mb-1">Hỏi & Đáp</h5>
                                            <p class="text-white-50 mb-0">Câu hỏi của bạn</p>
                                        </div><!--kết thúc counter box-->
                                    </div><!--kết thúc col-->
                                </div><!--kết thúc row-->
                            </div>
                        </div>
                    </div>
                </div><!--end col-->
            </div><!--end row -->
            <div class="feature-posts-placeholder bg-primary"></div>
        </div><!--end container-->
    </section><!--end section-->
    <!-- End -->

    <!-- Start -->
    <section class="section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="section-title text-center mb-4 pb-2">
                        <h4 class="title mb-4">Phản hồi bệnh nhân</h4>
                        <p class="text-muted mx-auto para-desc mb-0">Lắng nghe chia sẻ từ những bệnh nhân đã trải qua quy trình điều trị và chăm sóc y tế tại chúng tôi. Phản hồi của họ giúp chúng tôi không ngừng cải thiện và mang lại dịch vụ tốt hơn cho bạn và gia đình.</p>
                    </div>
                </div><!--end col-->
            </div><!--end row-->


            <div class="row justify-content-center">
                <div class="col-lg-8 mt-4 pt-2 text-center">
                    <div class="client-review-slider">
                        <div class="tiny-slide text-center">
                            <img src="images/client/01.jpg" class="img-fluid avatar avatar-small rounded-circle mx-auto shadow my-3" alt="">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <h6 class="text-primary">- Trần Nam <small class="text-muted">Giám đốc điều hành</small></h6>
                        </div><!--end customer testi-->

                        <div class="tiny-slide text-center">
                            <p class="text-muted h6 fw-normal fst-italic">" Ưu điểm của nguồn gốc từ tiếng Latinh và ý nghĩa tương đối của Lorem Ipsum là văn bản không thu hút sự chú ý về bản thân nó hoặc làm mất tập trung sự chú ý của người xem khỏi bố cục. "</p>
                            <img src="images/client/02.jpg" class="img-fluid avatar avatar-small rounded-circle mx-auto shadow my-3" alt="">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <h6 class="text-primary">- Nguyễn Hưng <small class="text-muted">Trợ lý cá nhân</small></h6>
                        </div><!--end customer testi-->

                        <div class="tiny-slide text-center">
                            <p class="text-muted h6 fw-normal fst-italic">" Hiện nay có rất nhiều văn bản giả có thể đọc được. Chúng thường được sử dụng khi cần một đoạn văn bản chỉ để lấp đầy không gian. Những văn bản thay thế cho Lorem Ipsum cổ điển thường mang tính giải trí và kể những câu chuyện ngắn, hài hước hoặc vô nghĩa. "</p>
                            <img src="images/client/03.jpg" class="img-fluid avatar avatar-small rounded-circle mx-auto shadow my-3" alt="">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <h6 class="text-primary">- Phạm Lan <small class="text-muted">Giám đốc y tế</small></h6>
                        </div><!--end customer testi-->

                        <div class="tiny-slide text-center">
                            <p class="text-muted h6 fw-normal fst-italic">" Theo hầu hết các nguồn, Lorem Ipsum có thể được truy nguồn từ một văn bản do Cicero viết vào năm 45 trước Công nguyên. Người ta cho rằng, một học giả Latin đã xác định được nguồn gốc của văn bản này bằng cách tổng hợp tất cả các trường hợp của từ 'consectetur' bất thường mà ông có thể tìm thấy. "</p>
                            <img src="images/client/04.jpg" class="img-fluid avatar avatar-small rounded-circle mx-auto shadow my-3" alt="">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <h6 class="text-primary">- Nguyễn Hòa <small class="text-muted">Quản lý</small></h6>
                        </div><!--end customer testi-->

                        <div class="tiny-slide text-center">
                            <p class="text-muted h6 fw-normal fst-italic">" Dường như chỉ còn lại những mảnh nhỏ của văn bản gốc trong các văn bản Lorem Ipsum được sử dụng ngày nay. Văn bản giả nổi tiếng nhất là 'Lorem Ipsum', được cho là có nguồn gốc từ thế kỷ 16. "</p>
                            <img src="images/client/05.jpg" class="img-fluid avatar avatar-small rounded-circle mx-auto shadow my-3" alt="">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <h6 class="text-primary">- Lê Hùng <small class="text-muted">Nhà phát triển</small></h6>
                        </div><!--end customer testi-->

                        <div class="tiny-slide text-center">
                            <p class="text-muted h6 fw-normal fst-italic">" Dường như chỉ còn lại những mảnh nhỏ của văn bản gốc trong các văn bản Lorem Ipsum được sử dụng ngày nay. Người ta có thể suy đoán rằng qua thời gian, một số chữ cái đã được thêm vào hoặc xóa đi ở nhiều vị trí khác nhau trong văn bản. "</p>
                            <img src="images/client/06.jpg" class="img-fluid avatar avatar-small rounded-circle mx-auto shadow my-3" alt="">
                            <ul class="list-unstyled mb-0">
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                                <li class="list-inline-item"><i class="mdi mdi-star text-warning"></i></li>
                            </ul>
                            <h6 class="text-primary">- Đặng Thu <small class="text-muted">Nhà thiết kế</small></h6>
                        </div><!--end customer testi-->
                        <div class="tiny-slide text-center">
                            <p class="text-muted h6 fw-normal fst-italic">" Dường như chỉ còn lại những mảnh nhỏ của văn bản gốc trong các văn bản Lorem Ipsum được sử dụng ngày nay. Văn bản giả nổi tiếng nhất là 'Lorem Ipsum', được cho là có nguồn gốc từ thế kỷ 16. "</p>
                        </div><!--end carousel-->
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->


            <div class="container mt-100 mt-60">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center mb-4 pb-2">
                            <span class="badge badge-pill badge-soft-primary mb-3">Tin Tức</span>
                            <h4 class="title mb-4">Tin tức & Blog mới nhất</h4>
                            <p class="text-muted mx-auto para-desc mb-0">Cập nhật những tin tức và bài viết mới nhất về y tế, sức khỏe, và chăm sóc sức khỏe gia đình. Tìm hiểu thêm về các chủ đề quan trọng và những lời khuyên hữu ích từ các chuyên gia y tế để bảo vệ sức khỏe của bạn và người thân.</p>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row">
                    <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="../assets/images/blog/01.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20 tháng 11, 2020</li>
                                    <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 phút đọc</li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">Dễ dàng kết nối với bác sĩ và lên kế hoạch điều trị</a>
                                <p class="text-muted mt-2">Tìm hiểu cách bạn có thể kết nối nhanh chóng với bác sĩ để nhận tư vấn hoặc điều trị ngay lập tức, giúp bạn và gia đình an tâm trong mọi tình huống.</p>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0">
                                            <a href="#" class="text-muted like"> Yêu Thích: 33
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#" class="text-muted comments">Bình Luận: 08
                                            </a>
                                        </li>

                                    </ul>
                                    <a href="blog-detail.html" class="link">Đọc thêm</a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="../assets/images/blog/02.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20 tháng 11, 2020</li>
                                    <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 phút đọc</li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">Lệnh phong tỏa khiến ít người tìm kiếm sự chăm sóc y tế hơn</a>
                                <p class="text-muted mt-2">Khám phá những tác động của lệnh phong tỏa lên việc chăm sóc sức khỏe, và làm thế nào để đảm bảo bạn vẫn nhận được sự hỗ trợ y tế kịp thời trong hoàn cảnh khó khăn.</p>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0">
                                            <a href="#" class="text-muted like"> Yêu Thích: 33
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#" class="text-muted comments">Bình Luận: 08
                                            </a>
                                        </li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Đọc thêm</a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <img src="../assets/images/blog/03.jpg" class="img-fluid" alt="">
                            <div class="card-body p-4">
                                <ul class="list-unstyled mb-2">
                                    <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20 tháng 11, 2020</li>
                                    <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 phút đọc</li>
                                </ul>
                                <a href="blog-detail.html" class="text-dark title h5">Khóa học nghiên cứu y học cấp cứu dành cho bác sĩ</a>
                                <p class="text-muted mt-2">Tham gia khóa học chuyên sâu dành cho các bác sĩ chuyên về y học cấp cứu, giúp họ nâng cao kỹ năng và kiến thức trong việc điều trị các trường hợp khẩn cấp.</p>
                                <div class="post-meta d-flex justify-content-between mt-3">
                                    <ul class="list-unstyled mb-0">
                                        <li class="list-inline-item me-2 mb-0">
                                            <a href="#" class="text-muted like"> Yêu Thích: 33
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#" class="text-muted comments">Bình Luận: 08
                                            </a>
                                        </li>
                                    </ul>
                                    <a href="blog-detail.html" class="link">Đọc thêm</a>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

            </div><!--end row-->
        </div><!--end container-->
    </section><!--end section-->
    <!-- End -->

    <!-- Partners start -->
    <section class="py-4 bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                    <img src="images/client/amazon.png" class="avatar avatar-client" alt="">
                </div><!--end col-->

                <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                    <img src="images/client/google.png" class="avatar avatar-client" alt="">
                </div><!--end col-->

                <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                    <img src="images/client/lenovo.png" class="avatar avatar-client" alt="">
                </div><!--end col-->

                <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                    <img src="images/client/paypal.png" class="avatar avatar-client" alt="">
                </div><!--end col-->

                <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                    <img src="images/client/shopify.png" class="avatar avatar-client" alt="">
                </div><!--end col-->

                <div class="col-lg-2 col-md-2 col-6 text-center py-4">
                    <img src="images/client/spotify.png" class="avatar avatar-client" alt="">
                </div><!--end col-->
            </div><!--end row-->
        </div><!--end container-->
    </section><!--end section-->
    <!-- Partners End -->

    <!-- Start -->
    <footer class="bg-footer">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-4 mb-0 mb-md-4 pb-0 pb-md-2">
                    <a href="#" class="logo-footer">
                        <img src="img/logo-1.png" height="22" alt="">
                    </a>
                    <p class="mt-4 me-xl-5">
                        Childcare là dịch vụ chăm sóc và nuôi dưỡng trẻ em, thường được cung cấp khi cha mẹ hoặc người giám hộ không thể trực tiếp thực hiện do bận công việc hoặc các lý do khác. Đây là một phần thiết yếu trong cuộc sống hiện đại, góp phần quan trọng trong sự phát triển sớm của trẻ và hỗ trợ các gia đình duy trì cân bằng giữa công việc và cuộc sống cá nhân.</p>
                </div><!--end col-->

                <div class="col-xl-7 col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                            <h5 class="text-light title-dark footer-head">Công ty</h5>
                            <ul class="list-unstyled footer-list mt-4">
                                <li><a href="aboutus.html" class="text-foot">Về chúng tôi</a></li>
                                <li><a href="departments.html" class="text-foot">Dịch vụ</a></li>
                                <li><a href="doctor-team-two.html" class="text-foot">Đội ngũ</a></li>
                                <li><a href="blog-detail.html" class="text-foot">Dự án</a></li>
                                <li><a href="blogs.html" class="text-foot">Blog</a></li>
                                <li><a href="login.html" class="text-foot">Đăng nhập</a></li>
                            </ul>
                        </div><!--end col-->

                        <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                            <h5 class="text-light title-dark footer-head">Khoa</h5>
                            <ul class="list-unstyled footer-list mt-4">
                                <li><a href="departments.html" class="text-foot">Chăm sóc mắt</a></li>
                                <li><a href="departments.html" class="text-foot">Tâm lý trị liệu</a></li>
                                <li><a href="departments.html" class="text-foot">Chăm sóc răng</a></li>
                                <li><a href="departments.html" class="text-foot">Chỉnh hình</a></li>
                                <li><a href="departments.html" class="text-foot">Tim mạch</a></li>
                                <li><a href="departments.html" class="text-foot">Phụ khoa</a></li>
                                <li><a href="departments.html" class="text-foot">Thần kinh học</a></li>
                            </ul>
                        </div><!--end col-->

                        <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                            <h5 class="text-light title-dark footer-head">Liên hệ với chúng tôi</h5>
                            <ul class="list-unstyled footer-list mt-4">
                                <li class="d-flex align-items-center">
                                    <i data-feather="mail" class="fea icon-sm text-foot align-middle"></i>
                                    <a href="mailto:contact@example.com" class="text-foot ms-2">childcare@mail.com</a>
                                </li>

                                <li class="d-flex align-items-center">
                                    <i data-feather="phone" class="fea icon-sm text-foot align-middle"></i>
                                    <a href="tel:+152534-468-854" class="text-foot ms-2">+152 534-468-854</a>
                                </li>

                                <li class="d-flex align-items-center">
                                    <i data-feather="map-pin" class="fea icon-sm text-foot align-middle"></i>
                                    <a href="javascript:void(0)" class="video-play-icon text-foot ms-2">Xem trên Google Map</a>
                                </li>
                            </ul>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end col-->
            </div><!--end row-->
        </div><!--end container-->

        <div class="container mt-5">
            <div class="pt-4 footer-bar">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="text-sm-start text-center">
                            <p class="mb-0"><script>document.write(new Date().getFullYear())</script> © ChildCare</p>
                        </div>
                    </div><!--end col-->

                    <div class="col-sm-6 mt-4 mt-sm-0">
                        <ul class="list-unstyled footer-list text-sm-end text-center mb-0">
                            <li class="list-inline-item"><a href="terms.html" class="text-foot me-2">Điều khoản</a></li>
                            <li class="list-inline-item"><a href="privacy.html" class="text-foot me-2">Riêng tư</a></li>
                            <li class="list-inline-item"><a href="aboutus.html" class="text-foot me-2">Về chúng tôi</a></li>
                            <li class="list-inline-item"><a href="contact.html" class="text-foot me-2">Liên hệ</a></li>
                        </ul>
                    </div><!--end col-->
                </div><!--end row-->
            </div>
        </div><!--end container-->
    </footer>
    <!--end footer-->
    <!-- End -->

    <!-- Back to top -->
    <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
    <!-- Back to top -->

    <!-- Offcanvas Start -->
    <div class="offcanvas bg-white offcanvas-top" tabindex="-1" id="offcanvasTop">
        <div class="offcanvas-body d-flex align-items-center align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="text-center">
                            <h4>Search now.....</h4>
                            <div class="subcribe-form mt-4">
                                <form>
                                    <div class="mb-0">
                                        <input type="text" id="help" name="name" class="border bg-white rounded-pill" required="" placeholder="Search">
                                        <button type="submit" class="btn btn-pills btn-primary">Search</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </div>
    </div>
    <!-- Offcanvas End -->

    <!-- Offcanvas Start -->
    <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header p-4 border-bottom">
            <h5 id="offcanvasRightLabel" class="mb-0">
                <img src="img/logo-1.png" height="24" class="light-version" alt="">
                <img src="img/logo-1.png" height="24" class="dark-version" alt="">
            </h5>
            <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas" aria-label="Close"><i class="uil uil-times fs-4"></i></button>
        </div>
        <div class="offcanvas-body p-4 px-md-5">
            <div class="row">
                <div class="col-12">
                    <!-- Style switcher -->
                    <div id="style-switcher">
                        <div>
                            <ul class="text-center list-unstyled mb-0">
                                <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="../assets/images/layouts/landing-light-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="ltr-version t-ltr-light" onclick="setTheme('style')"><img src="../assets/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="dark-rtl-version t-rtl-dark" onclick="setTheme('style-dark-rtl')"><img src="../assets/images/layouts/landing-dark-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="dark-ltr-version t-ltr-dark" onclick="setTheme('style-dark')"><img src="../assets/images/layouts/landing-dark.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="dark-version t-dark mt-4" onclick="setTheme('style-dark')"><img src="../assets/images/layouts/landing-dark.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Dark Version</span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="light-version t-light mt-4" onclick="setTheme('style')"><img src="../assets/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Light Version</span></a></li>
                                <li class="d-grid"><a href="../admin/index.html" target="_blank" class="mt-4"><img src="../assets/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Admin Dashboard</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- end Style switcher -->
                </div><!--end col-->
            </div><!--end row-->
        </div>

        <div class="offcanvas-footer p-4 border-top text-center">
            <ul class="list-unstyled social-icon mb-0">
                <li class="list-inline-item mb-0"><a href="https://1.envato.market/doctris-template" target="_blank" class="rounded"><i class="uil uil-shopping-cart align-middle" title="Buy Now"></i></a></li>
                <li class="list-inline-item mb-0"><a href="https://dribbble.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-dribbble align-middle" title="dribbble"></i></a></li>
                <li class="list-inline-item mb-0"><a href="https://www.facebook.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-facebook-f align-middle" title="facebook"></i></a></li>
                <li class="list-inline-item mb-0"><a href="https://www.instagram.com/shreethemes/" target="_blank" class="rounded"><i class="uil uil-instagram align-middle" title="instagram"></i></a></li>
                <li class="list-inline-item mb-0"><a href="https://twitter.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-twitter align-middle" title="twitter"></i></a></li>
                <li class="list-inline-item mb-0"><a href="mailto:support@shreethemes.in" class="rounded"><i class="uil uil-envelope align-middle" title="email"></i></a></li>
                <li class="list-inline-item mb-0"><a href="../../../index.html" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
            </ul><!--end icon-->
        </div>
    </div>
    <!-- Offcanvas End -->

    <!-- MOdal Start -->
    <div class="modal fade" id="watchvideomodal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content video-modal rounded overflow-hidden">
                <!-- <video class="w-100" controls autoplay muted loop>
                    <source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4">
                </video> -->
                <!--Browser does not support <video> tag -->
                <!--If you want to use your own video please set your files path-->

                <!-- <div class="ratio ratio-16x9">
                        <iframe src="https://www.youtube.com/embed/jNTZpfXYJa4?rel=0" title="YouTube video" allowfullscreen></iframe>
                    </div> -->
                <!--If you want to use the youtube link please try the above code-->

                <div class="ratio ratio-16x9">
                    <iframe src="https://player.vimeo.com/video/99025203" title="Vimeo video" allowfullscreen></iframe>
                </div>
                <!--If you want to use the Vimeo link please try the above code-->
            </div>
        </div>
    </div>
    <!-- MOdal End -->

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