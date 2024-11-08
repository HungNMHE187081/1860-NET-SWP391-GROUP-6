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

        <!-- Add this CSS section in the head -->
        <style>
            .dashboard {
                background-color: #f8f9fa;
                min-height: 100vh;
            }

            .section-title {
                position: relative;
                margin-bottom: 2rem;
                padding-bottom: 1rem;
            }

            .section-title:after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 50px;
                height: 3px;
                background: #0d6efd;
            }

            .feedback-card {
                transition: transform 0.2s, box-shadow 0.2s;
                border: none;
                border-radius: 15px;
            }

            .feedback-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            }

            .rating-stars {
                color: #ffc107;
            }

            .feedback-meta {
                font-size: 0.9rem;
                color: #6c757d;
            }

            .feedback-content {
                background-color: #fff;
                padding: 1.5rem;
                border-radius: 10px;
            }

            .attachment-preview {
                position: relative;
                overflow: hidden;
                border-radius: 10px;
            }

            .status-badge {
                padding: 0.5rem 1rem;
                border-radius: 20px;
                font-weight: 500;
            }

            .feedback-filters {
                margin-bottom: 2rem;
            }

            .empty-state {
                text-align: center;
                padding: 3rem;
                color: #6c757d;
            }
        </style>
        <!-- Add this CSS section within your existing <style> tag -->
        <style>
            /* Statistics Card Styles */
            .stats-card {
                background: white;
                border-radius: 15px;
                padding: 1.5rem;
                margin-bottom: 2rem;
                box-shadow: 0 4px 6px rgba(0,0,0,0.05);
                transition: all 0.3s ease;
                position: relative;
                overflow: hidden;
            }

            .stats-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 15px rgba(0,0,0,0.1);
            }

            .stats-card::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100%;
                height: 3px;
                background: linear-gradient(to right, #0d6efd, #0dcaf0);
                transform: scaleX(0);
                transition: transform 0.3s ease;
                transform-origin: left;
            }

            .stats-card:hover::after {
                transform: scaleX(1);
            }

            .stats-card h3 {
                font-size: 2rem;
                font-weight: 600;
                color: #0d6efd;
                margin-bottom: 0.5rem;
            }

            .stats-card p {
                font-size: 0.9rem;
                color: #6c757d;
                margin: 0;
            }

            /* Animation for numbers */
            @keyframes countUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .animate-number {
                animation: countUp 1s ease-out forwards;
            }
        </style>
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
        <!-- Add this JavaScript before the closing </body> tag -->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Sample data - replace with actual data from your backend
                const statistics = {
                    totalFeedback: ${feedback.size()}, // Use actual size from your feedback list
                    avgRating: calculateAverageRating(), // Calculate from your feedback data
                    pendingFeedback: countPendingFeedback(), // Count pending feedback
                    responseRate: calculateResponseRate() // Calculate response rate
                };

                // Function to animate counting up
                function animateValue(element, start, end, duration) {
                    if (start === end)
                        return;
                    const range = end - start;
                    const increment = end > start ? 1 : -1;
                    const stepTime = Math.abs(Math.floor(duration / range));
                    let current = start;

                    const timer = setInterval(function () {
                        current += increment;
                        if (element.id === 'avgRating') {
                            element.textContent = current.toFixed(1);
                        } else if (element.id === 'responseRate') {
                            element.textContent = current + '%';
                        } else {
                            element.textContent = current;
                        }

                        if (current === end) {
                            clearInterval(timer);
                        }
                    }, stepTime);
                }

                // Function to calculate average rating
                function calculateAverageRating() {
                    let total = 0;
                    let count = 0;
            <c:forEach var="item" items="${feedback}">
                    total += ${item.rating};
                    count++;
            </c:forEach>
                    return count > 0 ? (total / count).toFixed(1) : 0;
                }

                // Function to count pending feedback
                function countPendingFeedback() {
                    let pending = 0;
            <c:forEach var="item" items="${feedback}">
                    if (!${item.status}) {
                        pending++;
                    }
            </c:forEach>
                    return pending;
                }

                // Function to calculate response rate
                function calculateResponseRate() {
                    let total = ${feedback.size()};
                    let responded = 0;
            <c:forEach var="item" items="${feedback}">
                    if (${item.status}) {
                        responded++;
                    }
            </c:forEach>
                    return total > 0 ? Math.round((responded / total) * 100) : 0;
                }

                // Initialize statistics with animations
                const elements = {
                    totalFeedback: document.getElementById('totalFeedback'),
                    avgRating: document.getElementById('avgRating'),
                    pendingFeedback: document.getElementById('pendingFeedback'),
                    responseRate: document.getElementById('responseRate')
                };

                // Trigger animations when elements are in viewport
                const observer = new IntersectionObserver((entries) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            const element = entry.target;
                            element.classList.add('animate-number');

                            switch (element.id) {
                                case 'totalFeedback':
                                    animateValue(element, 0, statistics.totalFeedback, 1000);
                                    break;
                                case 'avgRating':
                                    animateValue(element, 0, parseFloat(statistics.avgRating), 1000);
                                    break;
                                case 'pendingFeedback':
                                    animateValue(element, 0, statistics.pendingFeedback, 1000);
                                    break;
                                case 'responseRate':
                                    animateValue(element, 0, statistics.responseRate, 1000);
                                    break;
                            }
                            observer.unobserve(element);
                        }
                    });
                }, {threshold: 0.1});

                // Observe all statistic elements
                Object.values(elements).forEach(element => {
                    observer.observe(element);
                });
            });
        </script>
    </head>

    <body>

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
        <br>
        <main>
            <div class="container py-5">
                <!-- Section Header -->
                <div class="row mb-4">
                    <div class="col-12">
                        <h2 class="section-title">Phản hồi từ khách hàng</h2>
                    </div>
                </div>
            
                <section>
                    <!-- Filters -->
                    <!-- Replace the existing filters section with this form -->
<form id="filterForm" action="${pageContext.request.contextPath}/customer/feedback" method="GET" class="row feedback-filters mb-4">
    <div class="col-12 col-md-3 mb-3 mb-md-0">
        <div class="input-group">
            <span class="input-group-text bg-light border-0">
                <i class="fas fa-search"></i>
            </span>
            <input type="text" name="searchName" class="form-control border-0 bg-light" 
                   placeholder="Tìm theo tên..." value="${param.searchName}">
        </div>
    </div>
    <div class="col-12 col-md-2 mb-3 mb-md-0">
        <select name="searchRating" class="form-select border-0 bg-light">
            <option value="">Tất cả đánh giá</option>
            <option value="1" ${param.searchRating == '1' ? 'selected' : ''}>1 sao</option>
            <option value="2" ${param.searchRating == '2' ? 'selected' : ''}>2 sao</option>
            <option value="3" ${param.searchRating == '3' ? 'selected' : ''}>3 sao</option>
            <option value="4" ${param.searchRating == '4' ? 'selected' : ''}>4 sao</option>
            <option value="5" ${param.searchRating == '5' ? 'selected' : ''}>5 sao</option>
        </select>
    </div>
    <div class="col-12 col-md-2 mb-3 mb-md-0">
        <button type="submit" class="btn btn-primary w-100">Tìm kiếm</button>
    </div>
</form>
                    <!-- Feedback Cards -->
                    <div class="row">
                        <c:choose>
                            <c:when test="${not empty feedback}">
                                <c:forEach var="feedback" items="${feedback}">
                                    <div class="col-12 col-md-6 col-lg-4 mb-4">
                                        <div class="card feedback-card h-100">
                                            <div class="card-body">
                                                <!-- User Info Header -->
                                                <div class="d-flex align-items-center mb-3">
                                                    <div class="flex-grow-1">
                                                        <h5 class="card-title mb-1">${feedback.userName}</h5>
                                                    </div>
                                                    <div class="ms-2">
                                                        <span class="status-badge ${feedback.status ? 'bg-success' : 'bg-warning'} text-white">
                                                            ${feedback.status ? 'Đã phản hồi' : 'Chưa phản hồi'}
                                                        </span>
                                                    </div>
                                                </div>

                                                <!-- Feedback Content -->
                                                <div class="feedback-content">
                                                    <div class="mb-3">
                                                        <strong>Dịch vụ:</strong> ${serviceName}
                                                    </div>

                                                    <div class="mb-3">
                                                        <strong>Đánh giá:</strong><br>
                                                        <div class="rating-stars">
                                                            <c:forEach begin="1" end="5" var="star">
                                                                <i class="fas fa-star ${star <= feedback.rating ? '' : 'text-muted'}"></i>
                                                            </c:forEach>
                                                        </div>
                                                    </div>

                                                    <div class="mb-3">
                                                        <strong>Trải nghiệm:</strong>
                                                        <p class="mb-2">${feedback.experienceRating}</p>
                                                    </div>

                                                    <div class="mb-3">
                                                        <strong>Phản hồi:</strong>
                                                        <p class="mb-2">${feedback.comment}</p>
                                                    </div>

                                                    <div class="mb-3">
                                                        <strong>Đề xuất:</strong>
                                                        <p class="mb-2">${feedback.suggestion}</p>
                                                    </div>

                                                    <c:if test="${not empty feedback.attachmentPath}">
                                                        <div class="attachment-preview mt-3">
                                                            <img src="${feedback.attachmentPath}" alt="Attachment" 
                                                                 class="img-fluid rounded" style="max-height: 150px; width: 100%; object-fit: cover;">
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="col-12">
                                    <div class="empty-state">
                                        <i class="fas fa-comment-alt fa-3x mb-3"></i>
                                        <h4>Chưa có phản hồi nào</h4>
                                        <p>Hiện tại chưa có phản hồi nào từ khách hàng.</p>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
            </div>
        </section>
    </main>
    <style>
        /* ... existing styles ... */

        /* Enhanced styles */
        .dashboard {
            background-color: #f8f9fa;
            min-height: 100vh;
            padding: 2rem 0;
        }

        .feedback-card {
            transition: all 0.3s ease;
            border: none;
            border-radius: 15px;
            background: linear-gradient(to bottom right, #ffffff, #f8f9fa);
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }

        .feedback-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.1);
        }

        .rating-stars {
            color: #ffc107;
            font-size: 1.1rem;
            display: inline-block;
            transition: all 0.2s ease;
        }

        .rating-stars:hover {
            transform: scale(1.1);
        }

        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .status-badge.bg-success {
            background-color: #28a745 !important;
        }

        .status-badge.bg-warning {
            background-color: #ffc107 !important;
        }

        .feedback-content {
            background-color: #fff;
            padding: 1.5rem;
            border-radius: 10px;
            position: relative;
            overflow: hidden;
        }

        .feedback-content::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: #0d6efd;
            border-radius: 4px;
        }

        .form-select {
            border-radius: 10px;
            padding: 0.75rem;
            border-color: #dee2e6;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .form-select:hover {
            border-color: #0d6efd;
        }

        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }

        .empty-state i {
            color: #0d6efd;
            margin-bottom: 1.5rem;
        }

        /* Animation classes */
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>

    <!-- Add before closing </head> tag -->
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
    <!-- Add these styles -->
    <style>
        /* ... existing styles ... */

        /* Search bar styling */
        .search-container {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .search-input {
            padding-left: 2.5rem;
            border-radius: 20px;
            border: 1px solid #dee2e6;
            transition: all 0.3s ease;
        }

        .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }

        /* Statistics cards */
        .stats-card {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }

        .stats-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.1);
        }

        /* Tag styling */
        .feedback-tag {
            display: inline-block;
            padding: 0.3rem 0.8rem;
            border-radius: 15px;
            font-size: 0.8rem;
            margin: 0.2rem;
            background: #e9ecef;
            color: #495057;
            transition: all 0.2s ease;
        }

        .feedback-tag:hover {
            background: #0d6efd;
            color: white;
            cursor: pointer;
        }

        /* Export button */
        .export-btn {
            border-radius: 20px;
            padding: 0.5rem 1.2rem;
            transition: all 0.3s ease;
        }

        /* Pagination styling */
        .custom-pagination {
            margin-top: 2rem;
        }

        .custom-pagination .page-link {
            border-radius: 50%;
            margin: 0 0.3rem;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
    <!-- Back to top -->
    <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
    <!-- Back to top -->
</body>
</html>
