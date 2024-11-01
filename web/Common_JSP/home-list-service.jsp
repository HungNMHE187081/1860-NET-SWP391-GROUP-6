<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Tiny Tots - Danh sách dịch vụ</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="https://shreethemes.in" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="../images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.3/font/bootstrap-icons.min.css">
        <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/remixicon.css" rel="stylesheet" type="text/css"/>
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
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
    </head>
    <body>
        <!-- Navbar STart -->
        <%@include file="dashboardtop.jsp" %>
        <!-- Navbar End -->
        <!-- Start Hero -->
        <section class="bg-half-170 d-table w-100" style="background: url('images/bg/department.jpg') center center;">
            <div class="bg-overlay bg-overlay-dark"></div>
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center">
                            <h3 class="sub-title mb-4 text-white title-dark">Dịch vụ</h3>
                            <p class="para-desc mx-auto text-white-50">Chúng tôi cung cấp một loạt các dịch vụ chăm sóc trẻ em được thiết kế phù hợp với mọi nhu cầu của gia đình, giúp bạn yên tâm hơn trong việc chăm sóc con cái</p>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-3">
                                <ul class="breadcrumb bg-light rounded mb-0 py-1 px-2">
                                    <li class="breadcrumb-item"><a href="index.html">Childcare</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Dịch vụ</li>
                                </ul>
                            </nav>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <div class="position-relative">
            <div class="shape overflow-hidden text-white">
                <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M0 48H1437.5H2880V0H2160C1442.5 52 720 0 720 0H0V48Z" fill="currentColor"></path>
                </svg>
            </div>
        </div>
        <!-- End Hero -->
<form action="${pageContext.request.contextPath}/customer/listservices" method="get" class="search-filter-form">
    <div class="search-filter-group">
        <!-- Search input for keyword -->
        <div class="search-input-wrapper">
            <i class="bi bi-search"></i>
            <input type="text" id="searchInput" name="keyword" placeholder="Tìm theo tên dịch vụ" />
        </div>
        
        <!-- Age limit dropdown with non-selectable placeholder -->
        <div class="select-wrapper">
            <i class="bi bi-funnel"></i>
            <select class="form-control" id="ageLimit" name="ageLimit">
                <option value="" disabled selected>Chọn độ tuổi</option>
                <c:forEach var="ageLimit" items="${ageLimits}">
                    <option value="${ageLimit.ageLimitID}">${ageLimit.ageLimit}</option>
                </c:forEach>
            </select>
        </div>
        
        <!-- Price filter dropdown with non-selectable placeholder -->
        <div class="select-wrapper">
            <i class="bi bi-funnel"></i>
            <select class="form-control" id="priceFilter" name="priceFilter">
                <option value="" disabled selected>Sắp xếp theo giá</option>
                <option value="lowToHigh">Giá từ thấp đến cao</option>
                <option value="highToLow">Giá từ cao đến thấp</option>
            </select>
        </div>
        
        <!-- Submit button -->
        <button type="submit" class="search-btn">
            <i class="bi bi-search"></i>
        </button>
    </div>
</form>
    <script>document.addEventListener('DOMContentLoaded', function() {
    const searchForm = document.querySelector('.search-filter-form');
    const searchInput = document.getElementById('searchInput');
    const ageLimitSelect = document.getElementById('ageLimit');
    const priceFilterSelect = document.getElementById('priceFilter');
    
    // Function to sort services by price
    function sortServices(services, order) {
        const serviceCards = Array.from(document.querySelectorAll('.service-card'));
        const servicesContainer = serviceCards[0].parentElement.parentElement;
        
        serviceCards.sort((a, b) => {
            const priceA = extractPrice(a.querySelector('.text-success').textContent);
            const priceB = extractPrice(b.querySelector('.text-success').textContent);
            
            return order === 'lowToHigh' ? priceA - priceB : priceB - priceA;
        });
        
        // Clear and re-append sorted cards
        serviceCards.forEach(card => card.parentElement.remove());
        serviceCards.forEach(card => {
            const colDiv = document.createElement('div');
            colDiv.className = 'col-lg-4 col-md-6 mb-4';
            colDiv.appendChild(card);
            servicesContainer.appendChild(colDiv);
        });
    }
    
    // Helper function to extract price value from text
    function extractPrice(priceText) {
        return parseInt(priceText.replace(/[^\d]/g, ''));
    }
    
    // Add event listeners
    priceFilterSelect.addEventListener('change', function() {
        const selectedValue = this.value;
        
        if (selectedValue === 'lowToHigh' || selectedValue === 'highToLow') {
            sortServices(document.querySelectorAll('.service-card'), selectedValue);
            
            // Add animation to cards
            document.querySelectorAll('.service-card').forEach(card => {
                card.style.animation = 'fadeIn 0.5s ease-in-out';
            });
        }
    });
    
    // Debounce helper function
    function debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }
    
    // Add CSS animation
    const style = document.createElement('style');
    style.textContent = `
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .service-card {
            animation: fadeIn 0.5s ease-in-out;
        }
    `;
    document.head.appendChild(style);
});</script>
    <style>
    /* Container styles */
    .search-filter-form {
        max-width: 1200px;
        margin: 2rem auto;
        padding: 0 1rem;
    }

    .search-filter-group {
        display: flex;
        gap: 1rem;
        flex-wrap: wrap;
        align-items: center;
        background: #fff;
        padding: 1.5rem;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
    }

    /* Input wrapper styles */
    .search-input-wrapper, .select-wrapper {
        position: relative;
        flex: 1;
        min-width: 200px;
    }

    /* Icon styles */
    .search-input-wrapper i, .select-wrapper i {
        position: absolute;
        left: 12px;
        top: 50%;
        transform: translateY(-50%);
        color: #6c757d;
        z-index: 1;
    }

    /* Input and select styles */
    .search-input-wrapper input,
    .select-wrapper select {
        width: 100%;
        padding: 0.75rem 1rem 0.75rem 2.5rem;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        font-size: 0.95rem;
        transition: all 0.3s ease;
        background-color: #f8f9fa;
    }

    .search-input-wrapper input:focus,
    .select-wrapper select:focus {
        outline: none;
        border-color: #007bff;
        box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
        background-color: #fff;
    }

    /* Button styles */
    .search-btn {
        padding: 0.75rem 1.5rem;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        transition: all 0.3s ease;
        min-width: 120px;
        justify-content: center;
    }

    .search-btn:hover {
        background-color: #0056b3;
        transform: translateY(-1px);
    }

    .search-btn i {
        font-size: 0.9rem;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .search-filter-group {
            flex-direction: column;
            gap: 1rem;
        }

        .search-input-wrapper,
        .select-wrapper {
            width: 100%;
        }

        .search-btn {
            width: 100%;
        }
    }

    /* Hover effects */
    .search-input-wrapper input:hover,
    .select-wrapper select:hover {
        border-color: #80bdff;
    }

    /* Custom select arrow */
    .select-wrapper select {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='%236c757d' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: calc(100% - 12px) center;
        padding-right: 2.5rem;
    }
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('searchInput');
    const ageLimitSelect = document.getElementById('ageLimit');
    
    // Add debounce to prevent too many requests
    let searchTimeout;
    
    searchInput.addEventListener('input', function() {
        clearTimeout(searchTimeout);
        searchTimeout = setTimeout(() => {
            // Optional: Auto-submit form after typing
            // document.querySelector('.search-filter-form').submit();
        }, 500);
    });
    
    // Add animation when focusing on input fields
    [searchInput, ageLimitSelect].forEach(element => {
        element.addEventListener('focus', function() {
            this.parentElement.style.transform = 'translateY(-2px)';
        });
        
        element.addEventListener('blur', function() {
            this.parentElement.style.transform = 'translateY(0)';
        });
    });
});
</script>
        <section class="section py-5 bg-light">
            <div class="container">
                <div class="row g-4">
                    <c:forEach var="service" items="${services}">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100 shadow-sm border-0 service-card">
                                <img src="${pageContext.request.contextPath}/${service.serviceImage}" class="card-img-top rounded-top" alt="${service.serviceName}">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold text-primary">
                                        ${service.serviceName}
                                    </h5>
                                    <p class="card-text text-muted description-truncate">
        ${fn:substring(service.description, 0, 50)}${fn:length(service.description) > 50 ? '...' : ''}
    </p>
                                </div>
                                <div class="card-footer bg-transparent border-top-0">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <span class="text-success fw-bold small">
                                            <i class="bi bi-cash-stack me-1"></i>
                                            <fmt:formatNumber value="${service.price}" type="number" groupingUsed="true"/> ₫
                                        </span>
                                        <span class="text-muted small">
                                            <i class="bi bi-clock me-1"></i>
                                            ${service.duration} phút
                                        </span>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <a href="${pageContext.request.contextPath}/customer/viewservice?serviceID=${service.serviceID}" class="btn btn-outline-secondary flex-grow-1 me-2 view-details transition-btn">
                                    <i class="bi bi-eye"></i>
                                </a>
                                <a href="${pageContext.request.contextPath}/customer/addreservation?serviceID=${service.serviceID}"
                                           class="btn btn-primary flex-grow-1 book-now transition-btn">
                                            <i class="bi bi-cart me-1"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <style>
            /* Font hiện đại */
            body {
                font-family: 'Poppins', sans-serif;
            }

            /* Đổi nền sáng với khoảng cách các phần tử hợp lý */
            .section {
                background-color: #f8f9fa;
                padding-top: 3rem;
                padding-bottom: 3rem;
            }

            /* Style cho thẻ card */
            .service-card {
                border-radius: 10px;
                overflow: hidden;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .service-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            }

            /* Hiển thị hình ảnh tròn góc */
            .card-img-top {
                border-radius: 10px 10px 0 0;
            }

            /* Cách đều các thành phần */
            .card-body {
                padding: 1.5rem;
            }

            .card-footer {
                padding-top: 0.75rem;
                padding-bottom: 0.75rem;
            }

            /* Style cho tiêu đề */
            .card-title {
                font-size: 1.25rem;
                margin-bottom: 0.5rem;
            }

            /* Style cho đoạn mô tả */
            .card-text {
                font-size: 0.875rem;
                color: #6c757d;
            }

            /* Hiển thị giá và thời gian */
            .text-success, .text-muted {
                font-weight: 600;
                font-size: 0.875rem;
            }

            /* Nút hiện đại với hiệu ứng hover */
            button {
                padding: 0.75rem 1rem;
                font-size: 0.875rem;
                font-weight: 600;
                border-radius: 5px;
                transition: all 0.3s ease;
            }

            /* Nút Đặt ngay */
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                color: #fff;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #004085;
            }

            /* Nút Xem chi tiết */
            .btn-outline-secondary {
                border-color: #6c757d;
                color: #6c757d;
            }

            .btn-outline-secondary:hover {
                background-color: #6c757d;
                color: #fff;
            }

            /* Hiệu ứng chuyển động hover khi hiện text */
            .view-details::after, .book-now::after {
                content: '';
                visibility: hidden;
                opacity: 0;
                transition: visibility 0s, opacity 0.3s ease;
            }

            .view-details:hover::after {
                content: 'Xem chi tiết';
                visibility: visible;
                opacity: 1;
                margin-left: 8px;
            }

            .book-now:hover::after {
                content: 'Đặt lịch';
                visibility: visible;
                opacity: 1;
                margin-left: 8px;
            }

        </style>
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
        <!-- End -->

        <!-- Back to top -->
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
        <!-- Back to top -->

        <!-- Offcanvas Start -->
        <div class="offcanvas bg-white offcanvas-top" tabindex="-1" id="offcanvasTop">
            <div class="offcanvas-body d-flex align-items-center align-items-center">
                <div class="container">
                </div><!--end container-->
            </div>
        </div>
        <!-- Offcanvas End -->

        <!-- Offcanvas Start -->
        <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header p-4 border-bottom">
                <h5 id="offcanvasRightLabel" class="mb-0">
                </h5>
                <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas" aria-label="Close"><i class="uil uil-times fs-4"></i></button>
            </div>
            <div class="offcanvas-body p-4 px-md-5">
                <div class="row">
                </div><!--end row-->
            </div>

            <div class="offcanvas-footer p-4 border-top text-center">
                <ul class="list-unstyled social-icon mb-0">
                </ul><!--end icon-->
            </div>
        </div>
        <!-- Offcanvas End -->
        <!-- Offcanvas End -->

        <!-- javascript -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="js/app.js"></script>
    </body>
</html>