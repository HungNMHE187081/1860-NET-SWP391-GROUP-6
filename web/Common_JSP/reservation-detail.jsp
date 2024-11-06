<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết đặt lịch | Tiny Tots</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico.png">
        <!-- CSS Files -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/remixicon.css" rel="stylesheet" type="text/css"/>
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom CSS -->
        <style>
            .reservation-status {
                padding: 8px 15px;
                border-radius: 50px;
                font-size: 14px;
                font-weight: 500;
            }
            .status-success {
                background-color: rgba(40, 167, 69, 0.1);
                color: #28a745;
            }
            .status-pending {
                background-color: rgba(255, 193, 7, 0.1);
                color: #ffc107;
            }
            .info-card {
                transition: all 0.3s ease;
                border: none;
                box-shadow: 0 0 20px rgba(0,0,0,0.05);
            }
            .info-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 25px rgba(0,0,0,0.1);
            }
            .detail-label {
                color: #6c757d;
                font-size: 0.9rem;
                margin-bottom: 5px;
            }
            .detail-value {
                color: #2f55d4;
                font-weight: 600;
                font-size: 1.1rem;
            }
            .service-description {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 10px;
                margin-top: 20px;
            }
            .payment-info {
                background: linear-gradient(45deg, #2f55d4, #4466e5);
                color: white;
                padding: 25px;
                border-radius: 15px;
            }
            .payment-info h5 {
                color: white;
                border-bottom: 1px solid rgba(255,255,255,0.2);
                padding-bottom: 15px;
            }
            .payment-detail {
                margin: 15px 0;
            }
            .payment-label {
                font-size: 0.9rem;
                opacity: 0.8;
            }
            .payment-value {
                font-size: 1.1rem;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <%@include file="dashboardtop.jsp" %>

        <!-- Hero Section -->
        <section class="bg-half-170 d-table w-100" style="background: url('${pageContext.request.contextPath}/assets/images/bg/banner.jpg') center; background-size: cover;">
            <div class="bg-overlay bg-gradient-overlay"></div>
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center">
                            <h3 class="sub-title mb-4 text-white title-dark">Chi tiết đặt lịch #${reservation.reservationID}</h3>
                            <nav aria-label="breadcrumb" class="d-inline-block mt-3">
                                <ul class="breadcrumb bg-light rounded mb-0 py-1 px-2">
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/customer/homepage">Trang chủ</a></li>
                                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/customer/listreservations">Đặt lịch</a></li>
                                    <li class="breadcrumb-item active">Chi tiết</li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Content Section -->
        <section class="section">
            <div class="container">
                <div class="row">
                    <!-- Thông tin đặt lịch -->
                    <div class="col-lg-8">
                        <div class="card info-card mb-4">
                            <div class="card-body p-4">
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <h5 class="card-title mb-0">Thông tin lịch hẹn</h5>
                                    <span class="reservation-status ${payment.paymentStatus == 'SUCCESS' ? 'status-success' : 'status-pending'}">
                                        ${payment.paymentStatus == 'SUCCESS' ? 'Đã thanh toán' : 'Chờ thanh toán'}
                                    </span>
                                </div>
                                
                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <div class="detail-label">Ngày khám</div>
                                            <div class="detail-value">${reservation.reservationDate}</div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="detail-label">Giờ khám</div>
                                            <div class="detail-value">${reservation.startTime}</div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="detail-label">Dịch vụ</div>
                                            <div class="detail-value">${service.serviceName}</div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <div class="detail-label">Bệnh nhân</div>
                                            <div class="detail-value">${child.firstName} ${child.middleName} ${child.lastName}</div>
                                        </div>
                        
                                    </div>
                                </div>

                                <div class="service-description">
                                    <h6 class="mb-3">Mô tả dịch vụ</h6>
                                    <p class="text-muted mb-0">${service.description}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Thông tin thanh toán -->
                    <div class="col-lg-4">
                        <div class="payment-info mb-4">
                            <h5 class="mb-4">Thông tin thanh toán</h5>
                            
                            <div class="payment-detail">
                                <div class="payment-label">Mã giao dịch</div>
                                <div class="payment-value">${payment.transactionNo}</div>
                            </div>
                            
                            <div class="payment-detail">
                                <div class="payment-label">Phương thức</div>
                                <div class="payment-value">${payment.paymentMethod}</div>
                            </div>
                            
                            <div class="payment-detail">
                                <div class="payment-label">Ngày thanh toán</div>
                                <div class="payment-value">${payment.paymentDate}</div>
                            </div>
                            
                            <div class="payment-detail">
                                <div class="payment-label">Tổng tiền</div>
                                <div class="payment-value"><fmt:formatNumber value="${payment.amount}" pattern="#,###"/> VNĐ</div>
                            </div>
                        </div>

                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/customer/listreservations" 
                               class="btn btn-primary rounded-pill px-4">
                                <i class="uil uil-arrow-left me-2"></i>Quay lại danh sách
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Back to top -->
        <a href="#" onclick="topFunction()" class="btn btn-icon btn-pills btn-primary back-to-top">
            <i data-feather="arrow-up" class="icons"></i>
        </a>

        <!-- JavaScript -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/app.js"></script>
    </body>
</html>
</html>