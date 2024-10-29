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
                        <span class="badge badge-pill badge-soft-primary mb-3">Dịch Vụ</span>
                        <h4 class="title mb-4">Dịch Vụ Chăm Sóc Sức Khỏe</h4>
                        <p class="text-muted mx-auto para-desc mb-0">
                            Khám phá các dịch vụ chăm sóc sức khỏe chất lượng, được cung cấp bởi đội ngũ chuyên gia tận tâm và giàu kinh nghiệm. Chúng tôi cam kết mang đến sự chăm sóc tốt nhất cho bạn và gia đình.
                        </p>
                    </div>
            </section>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

            <style>
                .section-padding {
                    padding: 4rem 0;
                }

                .bg-light-theme {
                    background-color: #f8f9fa;
                }

                .content-container {
                    max-width: 1200px;
                    margin: 0 auto;
                    padding: 0 1rem;
                    position: relative;
                }

                /* Swiper container styles */
                .swiper {
                    padding: 20px 0;
                    position: relative;
                    overflow: hidden;
                }

                .swiper-wrapper {
                    display: flex;
                    align-items: stretch;
                    height: auto !important;
                }

                .swiper-slide {
                    height: auto !important;
                    display: flex;
                }

                /* Card styles */
                .custom-card {
                    background: #fff;
                    border-radius: 8px;
                    width: 100%;
                    display: flex;
                    flex-direction: column;
                    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                    transition: transform 0.3s ease;
                    margin: 0;
                    height: 100%;
                }

                .custom-card:hover {
                    transform: translateY(-5px);
                }

                .service-image {
                    width: 100%;
                    height: 200px;
                    object-fit: cover;
                    border-top-left-radius: 8px;
                    border-top-right-radius: 8px;
                }

                .service-info {
                    padding: 1.5rem;
                    flex: 1;
                    display: flex;
                    flex-direction: column;
                }

                .service-title {
                    margin: 0 0 0.75rem 0;
                    color: #2c3e50;
                    font-size: 1.25rem;
                    font-weight: 600;
                }

                .service-description {
                    margin: 0;
                    font-size: 0.9rem;
                    line-height: 1.5;
                    color: #6c757d;
                    flex: 1;
                }

                .service-footer {
                    padding: 1.5rem;
                    background: #f8f9fa;
                    border-bottom-left-radius: 8px;
                    border-bottom-right-radius: 8px;
                }

                .service-details {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 1rem;
                }

                .price {
                    color: #28a745;
                    font-weight: 600;
                    font-size: 1.1rem;
                    display: flex;
                    align-items: center;
                    gap: 0.5rem;
                }

                .duration {
                    color: #6c757d;
                    display: flex;
                    align-items: center;
                    gap: 0.5rem;
                }

                .action-buttons {
                    display: flex;
                    gap: 1rem;
                }

                .btn {
                    flex: 1;
                    padding: 0.75rem 1rem;
                    border-radius: 6px;
                    font-weight: 500;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 0.5rem;
                    text-decoration: none;
                    cursor: pointer;
                    transition: all 0.3s ease;
                }

                .btn-outline-alt {
                    border: 1px solid #dee2e6;
                    color: #495057;
                    background: white;
                }

                .btn-outline-alt:hover {
                    background: #f8f9fa;
                }

                .btn-highlight {
                    background: #007bff;
                    color: white;
                    border: none;
                }

                .btn-highlight:hover {
                    background: #0056b3;
                }

                /* Navigation buttons */
                .swiper-button-next,
                .swiper-button-prev {
                    color: #007bff;
                    background: white;
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                }

                .swiper-button-next:after,
                .swiper-button-prev:after {
                    font-size: 18px;
                }

                /* Pagination */
                .swiper-pagination-bullet {
                    width: 10px;
                    height: 10px;
                    margin: 0 6px;
                }

                .swiper-pagination-bullet-active {
                    background: #007bff;
                }

                /* Responsive adjustments */
                @media (max-width: 768px) {
                    .service-info {
                        padding: 1rem;
                    }

                    .service-footer {
                        padding: 1rem;
                    }

                    .action-buttons {
                        gap: 0.5rem;
                    }

                    .btn {
                        padding: 0.5rem;
                    }
                }
            </style>
        </head>
        <body>

            <section class="section-padding bg-light-theme">
                <div class="content-container">
                    <div class="swiper">
                        <div class="swiper-wrapper">
                            <c:forEach var="service" items="${services}" begin="0" end="8" varStatus="status">
                                <div class="swiper-slide">
                                    <div class="custom-card">
                                        <img src="${service.serviceImage}" class="service-image" alt="${service.serviceName}">
                                        <div class="service-info">
                                            <h5 class="service-title">${service.serviceName}</h5>
                                            <p class="service-description">${service.description}</p>
                                        </div>
                                        <div class="service-footer">
                                            <div class="service-details">
                                                <span class="price">
                                                    <i class="bi bi-cash-stack"></i>
                                                    <fmt:formatNumber value="${service.price}" type="number" groupingUsed="true" /> ₫
                                                </span>
                                                <span class="duration">
                                                    <i class="bi bi-clock"></i>
                                                    ${service.duration} phút
                                                </span>
                                            </div>
                                            <div class="action-buttons">
                                                <a href="${pageContext.request.contextPath}/customer/viewservice?serviceID=${service.serviceID}" 
                                                   class="btn btn-outline-alt">
                                                    <i class="bi bi-eye"></i>
                                                    <span>Xem</span>
                                                </a>
                                                <button class="btn btn-highlight">
                                                    <i class="bi bi-cart"></i>
                                                    <span>Đặt</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="swiper-pagination"></div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>

                    <!-- View All Button -->
                    <div class="view-all-container">
                        <a href="${pageContext.request.contextPath}/listservice" class="btn-view-all">
                            <span>Xem tất cả dịch vụ</span>
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </section>

            <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    const swiper = new Swiper('.swiper', {
                        slidesPerView: 1,
                        spaceBetween: 30,
                        loop: true,
                        autoplay: {
                            delay: 3000,
                            disableOnInteraction: false,
                            pauseOnMouseEnter: true
                        },
                        pagination: {
                            el: '.swiper-pagination',
                            clickable: true,
                            // Add dynamic bullet count based on visible slides
                            dynamicBullets: true,
                            dynamicMainBullets: 3
                        },
                        navigation: {
                            nextEl: '.swiper-button-next',
                            prevEl: '.swiper-button-prev',
                        },
                        breakpoints: {
                            640: {
                                slidesPerView: 1,
                                spaceBetween: 20,
                            },
                            768: {
                                slidesPerView: 2,
                                spaceBetween: 30,
                            },
                            1024: {
                                slidesPerView: 3,
                                spaceBetween: 30,
                            }
                        },
                        autoHeight: false,
                        updateOnWindowResize: true,
                        observer: true,
                        observeParents: true,
                        resizeObserver: true,
                        // Improved slide visibility
                        watchSlidesProgress: true,
                        watchSlidesVisibility: true,
                    });
                });
            </script>


            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.4.5/swiper-bundle.min.css" rel="stylesheet">
            <!-- Feedback Section -->
            <!-- Feedback Section -->
            <section class="section bg-light py-5">
                <div class="container">
                    <div class="section-title text-center mb-4 pb-2">
                        <span class="badge badge-pill badge-soft-primary mb-3">Phản Hồi</span>
                        <h4 class="title mb-4">Phản Hồi Từ Khách Hàng</h4>
                        <p class="text-muted mx-auto para-desc mb-0">
                            Khám phá cảm nhận và phản hồi từ khách hàng của chúng tôi về trải nghiệm chăm sóc sức khỏe. Tìm hiểu cách mà các dịch vụ của chúng tôi đã góp phần nâng cao sức khỏe và cải thiện chất lượng cuộc sống của họ.
                        </p>
                    </div>

                    <!-- Feedback Slider -->
                    <div class="swiper feedback-slider">
                        <div class="swiper-wrapper">
                            <c:forEach var="feedback" items="${feedbackList}">
                                <div class="swiper-slide">
                                    <div class="card border-0 shadow-sm">
                                        <div class="card-body p-4">
                                            <div class="d-flex align-items-center mb-3">
                                                <div class="avatar-circle bg-primary text-white">${feedback.userName.charAt(0)}</div>
                                                <div class="ms-3">
                                                    <h6 class="mb-0">${feedback.userName}</h6>
                                                    <small class="text-muted">
                                                        <c:forEach var="service" items="${services}">
                                                            <c:if test="${service.serviceID == feedback.serviceID}">
                                                                ${service.serviceName}
                                                            </c:if>
                                                        </c:forEach>
                                                    </small>
                                                </div>
                                            </div>
                                            <div class="rating mb-2">
                                                <c:forEach begin="1" end="5" var="star">
                                                    <i class="fas fa-star <c:if test="${star <= feedback.rating}">text-warning</c:if><c:if test="${star > feedback.rating}">text-muted</c:if>"></i>
                                                </c:forEach>
                                                <span class="ms-2 text-muted">${feedback.rating}/5</span>
                                            </div>
                                            <div>
                                                <h6 class="mb-2">Đánh giá trải nghiệm:</h6>
                                                <p class="text-muted mb-0">${feedback.experienceRating}</p>
                                            </div>
                                            <div>
                                                <label>Phản hồi của khách hàng:</label>
                                                <span>${feedback.comment}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="swiper-pagination"></div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>

                    <!-- View All Button -->
                    <div class="text-center mt-4">
                        <a href="/feedback/all" class="btn btn-primary">
                            <i class="fas fa-comments me-2"></i>Xem tất cả phản hồi
                        </a>
                    </div>
                </div>
            </section>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.4.5/swiper-bundle.min.css">
            <style>
                .avatar-circle {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-weight: bold;
                }
                .feedback-slider {
                    padding: 20px 5px 60px;
                }
                .swiper-slide {
                    height: auto;
                }
                .card {
                    transition: transform 0.3s ease;
                }
                .card:hover {
                    transform: translateY(-5px);
                }
                .rating .fa-star {
                    font-size: 14px;
                }
            </style>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.4.5/swiper-bundle.min.js"></script>
            <script>
                console.log('Initializing Swiper...');
                new Swiper('.feedback-slider', {
                    slidesPerView: 1,
                    spaceBetween: 20,
                    pagination: {
                        el: '.swiper-pagination',
                        clickable: true
                    },
                    navigation: {
                        nextEl: '.swiper-button-next',
                        prevEl: '.swiper-button-prev'
                    },
                    breakpoints: {
                        640: {slidesPerView: 1},
                        768: {slidesPerView: 2},
                        1024: {slidesPerView: 3}
                    }
                });
                console.log('Swiper initialized.');
            </script>
            <style>
                /* Smaller Arrow Buttons */
                .swiper-button-next, .swiper-button-prev {
                    font-size: 16px; /* Adjust this size as needed */
                    width: 30px; /* Adjust the width */
                    height: 30px; /* Adjust the height */
                    background-color: rgba(0, 0, 0, 0.5); /* Optional: Add a background */
                    border-radius: 50%; /* Makes the buttons circular */
                }

                /* Position adjustments (optional) */
                .swiper-button-next {
                    right: 10px; /* Fine-tune position from the right */
                }

                .swiper-button-prev {
                    left: 10px; /* Fine-tune position from the left */
                }

                /* Icon inside the button */
                .swiper-button-next::after, .swiper-button-prev::after {
                    font-size: 12px; /* Icon size inside button */
                }
            </style>
            <section class="section bg-light py-5">
                <div class="container">
                    <div class="section-title text-center mb-4 pb-2">
                        <span class="badge badge-pill badge-soft-primary mb-3">Dược Phẩm</span>
                        <h4 class="title mb-4">Các Loại Thuốc và Công Dụng</h4>
                        <p class="text-muted mx-auto para-desc mb-0">
                            Khám phá các loại thuốc phổ biến và công dụng của chúng. Đội ngũ của chúng tôi cung cấp những thông tin chi tiết và đáng tin cậy về các sản phẩm chăm sóc sức khỏe như kem chống hăm, thuốc giảm đau, vắc xin, và nhiều loại khác.
                        </p>
                    </div>
                </div>
            </section>

            <!-- Medicine List Table -->
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                }


                .med-carousel__wrapper {
                    max-width: 1200px;
                    margin: 0 auto;
                    position: relative;
                }

                .med-carousel__track {
                    display: flex;
                    overflow-x: auto;
                    scroll-behavior: smooth;
                    gap: 1.5rem;
                    padding: 1rem 0.5rem;
                    scrollbar-width: none;
                    -ms-overflow-style: none;
                }

                .med-carousel__track::-webkit-scrollbar {
                    display: none;
                }

                .med-carousel__item {
                    min-width: 300px;
                    background: white;
                    border-radius: 12px;
                    padding: 1.5rem;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                    transition: transform 0.3s ease;
                }

                .med-carousel__item:hover {
                    transform: translateY(-5px);
                }

                .med-carousel__item-title {
                    color: #2c3e50;
                    font-size: 1.2rem;
                    font-weight: 600;
                    margin-bottom: 0.5rem;
                }

                .med-carousel__item-info {
                    margin-bottom: 0.5rem;
                    color: #7f8c8d;
                }

                .med-carousel__item-info i {
                    width: 20px;
                    color: #3498db;
                    margin-right: 0.5rem;
                }

                .med-carousel__nav-btn {
                    position: absolute;
                    top: 50%;
                    transform: translateY(-50%);
                    background: white;
                    border: none;
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                    cursor: pointer;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: #2c3e50;
                    transition: all 0.3s ease;
                }

                .med-carousel__nav-btn:hover {
                    background: #3498db;
                    color: white;
                }

                .med-carousel__nav-btn--prev {
                    left: -20px;
                }

                .med-carousel__nav-btn--next {
                    right: -20px;
                }

                .med-carousel__empty {
                    text-align: center;
                    padding: 2rem;
                    background: white;
                    border-radius: 12px;
                    color: #7f8c8d;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                }
            </style>
            </head>
        <body>
            <div class="med-carousel__wrapper">
                <c:if test="${not empty medicineList}">
                    <button class="med-carousel__nav-btn med-carousel__nav-btn--prev" onclick="slideCarousel('left')">
                        <i class="fas fa-chevron-left"></i>
                    </button>

                    <div class="med-carousel__track" id="medCarouselTrack">
                        <c:forEach var="medicine" items="${medicineList}">
                            <div class="med-carousel__item">
                                <h3 class="med-carousel__item-title">
                                    <c:out value="${medicine.name}" />
                                </h3>
                                <p class="med-carousel__item-info">
                                    <i class="fas fa-pills"></i>
                                    Công dụng: <c:out value="${medicine.uses}" />
                                </p>
                                <p class="med-carousel__item-info">
                                    <i class="fas fa-tag"></i>
                                    Loại: <c:out value="${medicine.categoryName}" />
                                </p>
                                <p class="med-carousel__item-info">
                                    <i class="fas fa-industry"></i>
                                    NSX: <c:out value="${medicine.manufactureName}" />
                                </p>
                            </div>
                        </c:forEach>
                    </div>

                    <button class="med-carousel__nav-btn med-carousel__nav-btn--next" onclick="slideCarousel('right')">
                        <i class="fas fa-chevron-right"></i>
                    </button>
                </c:if>

                <c:if test="${empty medicineList}">
                    <div class="med-carousel__empty">
                        <i class="fas fa-box-open" style="font-size: 2rem; margin-bottom: 1rem;"></i>
                        <p>Không tìm thấy thuốc</p>
                    </div>
                </c:if>
            </div>

            <script>
                function slideCarousel(direction) {
                    const track = document.getElementById('medCarouselTrack');
                    const cardWidth = 300 + 24; // card width + gap
                    const scrollAmount = cardWidth * 2; // Scroll 2 cards at a time

                    if (direction === 'left') {
                        track.scrollLeft -= scrollAmount;
                    } else {
                        track.scrollLeft += scrollAmount;
                    }
                }

                // Add touch swipe functionality
                let touchStartX = 0;
                let touchEndX = 0;
                const track = document.getElementById('medCarouselTrack');

                track.addEventListener('touchstart', e => {
                    touchStartX = e.touches[0].clientX;
                });

                track.addEventListener('touchmove', e => {
                    e.preventDefault(); // Prevent page scroll while swiping
                });

                track.addEventListener('touchend', e => {
                    touchEndX = e.changedTouches[0].clientX;
                    handleSwipe();
                });

                function handleSwipe() {
                    const swipeThreshold = 50; // Minimum distance for swipe
                    const swipeDistance = touchEndX - touchStartX;

                    if (Math.abs(swipeDistance) > swipeThreshold) {
                        if (swipeDistance > 0) {
                            slideCarousel('left');
                        } else {
                            slideCarousel('right');
                        }
                    }
                }
            </script>

            <!-- Staff Section -->
            <section class="section bg-light py-5">
                <div class="container">
                    <div class="section-title text-center mb-4 pb-2">
                        <span class="badge badge-pill badge-soft-primary mb-3">
                            <i class="fas fa-user-md me-1"></i>Đội Ngũ Bác Sĩ
                        </span>
                        <h4 class="title mb-4">
                            Chuyên Gia Sức Khỏe Tận Tâm Cho Trẻ
                        </h4>
                        <p class="text-muted mx-auto para-desc mb-0" style="max-width: 600px;">
                            Đội ngũ bác sĩ của chúng tôi bao gồm những chuyên gia giàu kinh nghiệm và tận tâm trong lĩnh vực nhi khoa, dinh dưỡng, tâm lý trẻ em và nhiều chuyên khoa khác. Mỗi bác sĩ đều mang đến sự quan tâm đặc biệt và chăm sóc toàn diện, giúp các bé phát triển khỏe mạnh và hạnh phúc.
                        </p>
                    </div>

                    <!-- Staff Slider -->
                    <div class="staff-slider position-relative mb-4">
                        <button class="slider-btn prev" onclick="prevSlide()">
                            <i class="fas fa-chevron-left"></i>
                        </button>
                        <div class="slider-container">
                            <c:forEach var="staff" items="${staffs}" varStatus="status">
                                <div class="slide">
                                    <div class="staff-card shadow-sm rounded overflow-hidden">
                                        <div class="position-relative">
                                            <img src="${pageContext.request.contextPath}/${user.profileImage}" 
                                                 alt="${staff.staffName}" 
                                                 class="staff-image img-fluid">
                                            <div class="overlay-hover"></div>
                                        </div>
                                        <div class="staff-info p-4 bg-white">
                                            <h3 class="h5 mb-2">${staff.staffName}</h3>
                                            <p class="staff-position mb-1 text-primary">
                                                <i class="fas fa-graduation-cap me-2"></i>
                                                <c:forEach var="degree" items="${degrees}">
                                                    <c:if test="${degree.degreeID == staff.degreeID}">
                                                        ${degree.degreeName}
                                                    </c:if>
                                                </c:forEach>
                                            </p>
                                            <p class="staff-department mb-0 text-muted">
                                                <i class="fas fa-stethoscope me-2"></i>
                                                <c:forEach var="specialization" items="${specializations}">
                                                    <c:if test="${specialization.specializationID == staff.specializationID}">
                                                        ${specialization.specializationName}
                                                    </c:if>
                                                </c:forEach>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <button class="slider-btn next" onclick="nextSlide()">
                            <i class="fas fa-chevron-right"></i>
                        </button>
                    </div>

                    <!-- View All Staff Button -->
                    <div class="text-center mt-4">
                        <a href="/staff/all" class="btn btn-primary">
                            <i class="fas fa-users me-2"></i>Xem tất cả đội ngũ bác sĩ
                        </a>
                    </div>
                </div>
            </section>

            <style>
                .staff-card {
                    transition: transform 0.3s ease;
                }

                .staff-card:hover {
                    transform: translateY(-5px);
                }

                .overlay-hover {
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    background: rgba(0,0,0,0.1);
                    opacity: 0;
                    transition: opacity 0.3s ease;
                }

                .staff-card:hover .overlay-hover {
                    opacity: 1;
                }

                .slider-btn {
                    position: absolute;
                    top: 50%;
                    transform: translateY(-50%);
                    background: white;
                    border: none;
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                    z-index: 10;
                    cursor: pointer;
                    transition: all 0.3s ease;
                }

                .slider-btn:hover {
                    background: #007bff;
                    color: white;
                }

                .slider-btn.prev {
                    left: -20px;
                }

                .slider-btn.next {
                    right: -20px;
                }

                .staff-image {
                    width: 100%;
                    height: 250px;
                    object-fit: cover;
                }
            </style>
            <script>
                // Add this to your JavaScript file
                let currentSlide = 0;
                const slides = document.querySelectorAll('.slide');
                const slidesPerView = Math.floor(window.innerWidth / 300); // 300px is slide width

                function showSlide(index) {
                    const container = document.querySelector('.slider-container');
                    const slideWidth = document.querySelector('.slide').offsetWidth + 30; // 30 is margin
                    container.scrollLeft = slideWidth * index;
                }

                function nextSlide() {
                    currentSlide = (currentSlide + 1) % (slides.length - slidesPerView + 1);
                    showSlide(currentSlide);
                }

                function prevSlide() {
                    currentSlide = currentSlide === 0 ? slides.length - slidesPerView : currentSlide - 1;
                    showSlide(currentSlide);
                }

                // Optional: Auto slide
                setInterval(nextSlide, 5000); // Change slide every 5 seconds
            </script>
            <section class="section bg-light py-5">
                <div class="container">
                    <div class="section-title text-center mb-4 pb-2">
                        <span class="badge badge-pill badge-soft-primary mb-3">
                            <i class="uil uil-newspaper me-1"></i>Tin Tức & Sự Kiện
                        </span>
                        <h4 class="title mb-4">Cập Nhật Mới Nhất Từ Trung Tâm</h4>
                        <p class="text-muted mx-auto para-desc mb-0" style="max-width: 600px;">

                            Chúng tôi luôn cập nhật những thông tin mới nhất về chăm sóc trẻ em, các sự kiện sắp tới, cùng các hoạt động tại trung tâm. Khám phá những bài viết hữu ích về sức khỏe, dinh dưỡng, và giáo dục, giúp bạn đồng hành cùng con trong hành trình phát triển toàn diện.
                        </p>
                    </div>
                </div>
            </section>

            <section class="section">
                <div class="container">
                    <div class="row">
                        <c:forEach var="blogList" items="${blogList}" varStatus="loop">
                            <c:if test="${loop.index < 6}">
                                <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2">
                                    <div class="card blog blog-primary border-0 shadow rounded overflow-hidden hover-transform">
                                        <div class="image-overlay">
                                            <img src="${pageContext.request.contextPath}/${blogList.thumbnailPath}" class="img-fluid" alt="">
                                        </div>
                                        <div class="card-body p-4">
                                            <ul class="list-unstyled mb-2">
                                                <li class="list-inline-item text-muted small me-3">
                                                    <i class="uil uil-calendar-alt text-primary h6 me-1"></i>${blogList.createdDate}
                                                </li>
                                                <li class="list-inline-item text-muted small">
                                                    <i class="uil uil-clock text-primary h6 me-1"></i>5 phút đọc
                                                </li>
                                            </ul>
                                            <a href="blog-detail.html" class="text-dark title h5 d-block mb-0">${blogList.title}</a>
                                            <div class="post-meta d-flex justify-content-between mt-3">
                                                <ul class="list-inline mb-0">
                                                    <li class="list-inline-item me-2 mb-0">
                                                        <a href="#" class="text-muted like">
                                                            <i class="uil uil-eye me-1"></i>${blogList.views} lượt xem
                                                        </a>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <a href="#" class="text-muted comments">
                                                            <i class="uil uil-comment me-1"></i>08 bình luận
                                                        </a>
                                                    </li>
                                                </ul>
                                                <a href="${pageContext.request.contextPath}/customer/detailcustomerblog?blogID=${blogList.blogID}" 
                                                   class="link text-primary">Đọc thêm <i class="uil uil-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <!-- Buttons Container -->
                    <div class="row mt-4">
                        <div class="col-12 text-center">
                            <a href="${pageContext.request.contextPath}/customer/viewallblogs" 
                               class="btn btn-primary me-2">
                                <i class="uil uil-newspaper me-1"></i>Xem Tất Cả Tin Tức
                            </a>
                        </div>
                    </div>
            </section>

            <style>
                .hover-transform {
                    transition: transform 0.3s ease;
                }

                .hover-transform:hover {
                    transform: translateY(-5px);
                }

                .image-overlay {
                    position: relative;
                    overflow: hidden;
                }

                .image-overlay img {
                    transition: transform 0.3s ease;
                }

                .image-overlay:hover img {
                    transform: scale(1.05);
                }

                .badge-soft-primary {
                    background-color: rgba(47, 85, 212, 0.1);
                    color: #2f55d4;
                    padding: 8px 16px;
                    font-size: 14px;
                }

                .card {
                    border: none;
                    transition: all 0.3s ease;
                }

                .card:hover {
                    box-shadow: 0 10px 25px rgba(47, 85, 212, 0.1) !important;
                }
            </style>
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
            <script src="js/recent.js"></script>
            <!-- Icons -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.9.55/css/materialdesignicons.min.css">
            <%@include file="footer.jsp" %>
        </body>
</html>