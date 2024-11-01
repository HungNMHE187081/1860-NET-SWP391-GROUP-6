<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Tiny Tots - Lịch</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- favicon -->
        <link rel="shortcut icon" href="../images/favicon.ico.png">

        <!-- Core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet" type="text/css"/>

        <!-- Calendar-specific CSS -->
        <link href="${pageContext.request.contextPath}/css/fullcalendar.min.css" rel="stylesheet" type="text/css"/>

        <!-- Icons -->
        <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/remixicon.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.3/font/bootstrap-icons.min.css">
    </head>

    <body>
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
            <!-- End -->
            <section class="section py-5 bg-light">
                <div class="container">
                    <!-- Title and description for the services section -->
                    <div class="section-title text-center mb-4 pb-2">
                        <span class="badge badge-pill badge-soft-primary mb-3">Đặt Lịch Khám Cho Trẻ Em</span>
                        <h4 class="title mb-4">Dịch Vụ Chăm Sóc Sức Khỏe Cho Bé Yêu</h4>
                        <p class="text-muted mx-auto para-desc mb-0">
                            Khám phá các dịch vụ chăm sóc sức khỏe chuyên biệt dành cho trẻ em, được cung cấp bởi đội ngũ y bác sĩ tận tâm và giàu kinh nghiệm. Chúng tôi cam kết mang lại sự an toàn và sức khỏe tốt nhất cho con bạn.
                        </p>
                    </div>
            </section>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<!-- Container Lịch -->
<div class="container mt-4">
    <div class="row">
        <!-- Sự Kiện Thanh Bên -->
        <div class="col-xl-2 col-lg-4 col-12">
            <div id="external-events">
                <div class="card border-0 p-4 shadow rounded">
                    <span class="h6">Tất Cả Sự Kiện</span>

                    <div class="fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event">
                        <div class="fc-event-main">Cuộc Họp</div>
                    </div>
                    <div class="fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event">
                        <div class="fc-event-main">Phẫu Thuật</div>
                    </div>
                    <div class="fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event">
                        <div class="fc-event-main">Ăn Trưa</div>
                    </div>
                    <div class="fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event">
                        <div class="fc-event-main">Hội Nghị</div>
                    </div>
                    <div class="fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event">
                        <div class="fc-event-main">Họp Công Việc</div>
                    </div>

                    <div class="mt-2">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="drop-remove">
                            <label class="form-check-label" for="drop-remove">Xóa sau khi thả</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

                    <!-- Main Calendar -->
                    <div class="col-xl-10 col-lg-8 col-12">
                        <div id="calendar-container" class="card rounded border-0 shadow p-4">
                            <div id="calendar"></div>
                        </div>
                    </div>
                </div>
            </div>

           <!-- Calendar Scripts -->
<script src="${pageContext.request.contextPath}/js/fullcalendar.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.3.2/locales/vi.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fullcalendar.init.js"></script>
    </body>
</html>