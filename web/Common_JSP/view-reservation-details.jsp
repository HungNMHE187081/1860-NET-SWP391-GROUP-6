<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>ChildCare</title>
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        
        <!-- Icons -->
        <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/remixicon.css" rel="stylesheet" type="text/css"/>
        
        <!-- Css -->
        <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet" type="text/css"/>
        
        <style>
            .reservation-details {
                background-color: #f8f9fa;
                border-radius: 15px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
            }
            
            .details-section {
                background: white;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            }
            
            .section-title {
                color: #2f55d4;
                font-size: 18px;
                font-weight: 600;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid #e9ecef;
            }
            
            .info-label {
                color: #6c757d;
                font-weight: 500;
                margin-bottom: 5px;
            }
            
            .info-value {
                color: #212529;
                font-weight: 400;
                margin-bottom: 15px;
            }
            
            .badge {
                padding: 8px 12px;
                font-size: 12px;
                border-radius: 20px;
            }
            
            .badge.bg-success {
                background-color: #2eca8b !important;
            }
            
            .badge.bg-warning {
                background-color: #f17425 !important;
                color: white;
            }
            
            .btn-return {
                padding: 10px 30px;
                border-radius: 30px;
                font-weight: 500;
                transition: all 0.3s ease;
            }
            
            .btn-return:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }
        </style>
    </head>
    <body>
        <%@include file="dashboardtop.jsp" %>
        
        <!-- Start -->
        <section class="section mt-60">
            <div class="container mt-lg-3">
                <div class="row">
                    <div class="col-12">
                        <div class="card reservation-details border-0">
                            <div class="card-body p-4">
                                <div class="row align-items-center">
                                    <div class="col-lg-9">
                                        <h4 class="mb-0">Chi tiết lịch hẹn #${details.reservationID}</h4>
                                    </div>
                                    <div class="col-lg-3 text-lg-end mt-3 mt-lg-0">
                                        <c:choose>
                                            <c:when test="${details.isCheckOut}">
                                                <span class="badge bg-success">Đã thanh toán</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-warning">Chưa thanh toán</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                                <div class="row mt-4">
                                    <div class="col-md-6">
                                        <div class="details-section">
                                            <h5 class="section-title">Thông tin lịch hẹn</h5>
                                            <div class="info-item">
                                                <p class="info-label">Ngày khám</p>
                                                <p class="info-value">${details.reservationDate}</p>
                                            </div>
                                            <div class="info-item">
                                                <p class="info-label">Giờ khám</p>
                                                <p class="info-value">${details.startTime}</p>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <div class="details-section">
                                            <h5 class="section-title">Thông tin bệnh nhân</h5>
                                            <div class="info-item">
                                                <p class="info-label">Họ và tên</p>
                                                <p class="info-value">${details.childName}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="details-section">
                                            <h5 class="section-title">Thông tin dịch vụ</h5>
                                            <div class="info-item">
                                                <p class="info-label">Tên dịch vụ</p>
                                                <p class="info-value">${details.serviceName}</p>
                                            </div>
                                            <div class="info-item">
                                                <p class="info-label">Giá dịch vụ</p>
                                                <p class="info-value fw-bold text-primary">
                                                    <fmt:formatNumber value="${details.totalPrice}" pattern="#,###"/> VNĐ
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <div class="details-section">
                                            <h5 class="section-title">Thông tin bác sĩ</h5>
                                            <div class="info-item">
                                                <p class="info-label">Họ và tên</p>
                                                <p class="info-value">${details.staffName}</p>
                                            </div>
                                            <div class="info-item">
                                                <p class="info-label">Email</p>
                                                <p class="info-value">${details.staffEmail}</p>
                                            </div>
                                            <div class="info-item">
                                                <p class="info-label">Số điện thoại</p>
                                                <p class="info-value">${details.staffPhone}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="text-center mt-4">
                                    <a href="${pageContext.request.contextPath}/customer/listreservations" 
                                       class="btn btn-soft-primary btn-return">
                                        <i class="ri-arrow-left-line me-1"></i> Quay lại danh sách
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--end section-->
        <!-- End -->
        
        <%@include file="footer.jsp" %>
    </body>
</html>