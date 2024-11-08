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
    </head>
    <style>
        /* CSS cho biểu mẫu lọc */
        .filter-form {
            display: flex;
            flex-direction: column; /* Đổi chiều thành cột để dễ căn giữa */
            align-items: center; /* Căn giữa tất cả các phần tử trong div */
            margin-bottom: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .filter-group {
            display: flex;
            align-items: center;
            gap: 10px; /* Khoảng cách giữa các phần tử */
        }

        .filter-group input[type="text"],
        .filter-group select {
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            font-size: 14px;
            width: 200px; /* Đặt chiều rộng cho input và select */
        }

        .filter-group input[type="text"]:focus,
        .filter-group select:focus {
            border-color: #80bdff;
            outline: none; /* Bỏ viền khi được chọn */
        }

        .filter-group button {
            padding: 10px 15px;
            background-color: #007bff; /* Màu nền nút */
            color: #fff; /* Màu chữ */
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .filter-group button:hover {
            background-color: #0056b3; /* Màu nền khi hover */
        }

        /* CSS cho bảng */
        .table-responsive {
            margin-top: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff; /* Màu nền bảng */
        }

        .table th, .table td {
            padding: 12px; /* Khoảng cách giữa các ô */
            text-align: center; /* Canh giữa nội dung */
            border: 1px solid #dee2e6; /* Viền ô */
        }

        .table th {
            background-color: #f1f1f1; /* Màu nền cho tiêu đề bảng */
            font-weight: bold;
        }

        .function-column {
            display: flex;
            justify-content: center; /* Canh giữa nội dung trong cột chức năng */
        }

        .function-column form {
            margin: 0 5px; /* Khoảng cách giữa các form */
        }

        @media (max-width: 768px) {
            .filter-group {
                flex-direction: column; /* Đổi chiều thành cột trên màn hình nhỏ */
                align-items: stretch;
            }

            .filter-group input[type="text"],
            .filter-group select {
                width: 100%; /* Chiều rộng 100% cho màn hình nhỏ */
            }

            .filter-group button {
                width: 100%; /* Chiều rộng 100% cho nút trên màn hình nhỏ */
            }
        }

    </style>
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
                                <a href="${pageContext.request.contextPath}/customer/listservices" class="btn btn-primary">Đặt Dịch Vụ</a>
                                <p class="text-white-50 mb-0 mt-2">Điều khoản áp dụng. Vui lòng đọc Điều Khoản và Điều Kiện </p>
                            </div>
                        </div>

                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->

        <section class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center mb-4 pb-2">
                            <h4 class="title mb-4">Lịch sử khám</h4>
                            <p class="text-muted mx-auto para-desc mb-0">Dưới đây là danh sách lịch sử khám.</p>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row">
                    <form action="${pageContext.request.contextPath}/customer/homepagemedicalrecordlist" method="get" class="filter-form">
                        <div class="filter-group">
                            <input type="text" name="search" value="${param.search}" placeholder="Tìm theo tên trẻ" />
                           
                            <button type="submit"><i class="fas fa-filter"></i> Lọc và tìm kiếm</button>

                        </div>
                    </form>
                    <a href="${pageContext.request.contextPath}/customer/listprescription" class="btn"><i class="fas fa-save"></i> Danh sách đơn thuốc</a>
                    <div class="col-12 mt-4 pt-2">
                        <div class="table-responsive shadow rounded">
                            <table class="table table-center table-bordered bg-white mb-0">
                                <thead>
                                    <tr>
                                        <th class="text-center py-4" style="min-width: 100px;">Số thứ tự</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Tên con của bạn</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Tên phụ huynh</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Chẩn đoán</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Loại thuốc</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Nhân viên khám</th>

                                        <th class="text-center py-4" style="min-width: 200px;">Liều dùng</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Tần suất</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Thời điểm sử dụng</th>
                                        <th class="text-center py-4" style="min-width: 200px;">Ngày khám</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${not empty groupedPrescriptions}">
                                        <c:forEach var="entry" items="${groupedPrescriptions}" varStatus="status">
                                            <c:set var="recordID" value="${entry.key}" />
                                            <c:set var="prescriptionList" value="${entry.value}" />

                                            <!-- Kiểm tra nếu userID của prescriptionList[0] trùng với user.userID -->
                                            <c:if test="${prescriptionList[0].userID == user.userID}">
                                                <tr>
                                                    <td>${status.index + 1}</td>
                                                    <td>
                                                        <c:out value="${prescriptionList[0].childFirstName} ${prescriptionList[0].childMiddleName} ${prescriptionList[0].childLastName}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${prescriptionList[0].userFirstName} ${prescriptionList[0].userMiddleName} ${prescriptionList[0].userLastName}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${prescriptionList[0].diagnosis}" />
                                                    </td>
                                                    <td>
                                                        <!-- Hiển thị danh sách các loại thuốc cho recordID này -->
                                                        <c:forEach var="med" items="${prescriptionList}">
                                                            <c:out value="${med.medicineName}" /><br/>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <!-- Hiển thị tên nhân viên -->
                                                        ${prescriptionList[0].staffName}
                                                    </td>
                                                    <td>
                                                        <c:out value="${prescriptionList[0].dosage}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${prescriptionList[0].frequency}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${prescriptionList[0].duration}" />
                                                    </td>
                                                    <td>
                                                        <!-- Lấy medicalRecord tương ứng với recordID -->
                                                        <c:set var="medicalRecord" value="${medicalRecords[recordID]}" />
                                                        <fmt:formatDate value="${medicalRecord.reservationDate}" pattern="dd-MM-yyyy" />
                                                    </td>

                                                </tr>
                                            </c:if>
                                        </c:forEach>

                                    </c:if>
                                    <c:if test="${empty groupedPrescriptions}">
                                        <tr>
                                            <td colspan="7" style="text-align: center;">Không tìm thấy hồ sơ</td>
                                        </tr>
                                    </c:if>
                                </tbody>


                            </table>

                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container--><!--end container-->
        </section><!--end section-->

        <%@include file="footer.jsp" %>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const dateCells = document.querySelectorAll('td[data-date]');
                dateCells.forEach(cell => {
                    const dateStr = cell.getAttribute('data-date');
                    const date = new Date(dateStr);
                    const formattedDate = date.toLocaleDateString('vi-VN', {
                        day: '2-digit',
                        month: '2-digit',
                        year: 'numeric'
                    });
                    cell.textContent = formattedDate;
                });
            });
        </script>

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