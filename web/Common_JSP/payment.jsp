<%-- 
    Document   : payment
    Created on : Nov 5, 2024, 3:33:44 AM
    Author     : HÙNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="model.ReservationInfo"%>
<%@page import="java.util.Map"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ChildCare</title>
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        
        <!-- Icons -->
        <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/remixicon.css" rel="stylesheet" type="text/css"/>
        
        <!-- Css -->
        <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="dashboardtop.jsp" %>
        
        <section class="section mt-60">
            <div class="container mt-lg-3">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card border-0 shadow rounded">
                            <div class="card-header bg-transparent">
                                <h3 class="text-center mb-0">Xác nhận thông tin thanh toán</h3>
                            </div>
                            <div class="card-body p-4">
                                <!-- Debug info -->
                                <% 
                                    System.out.println("ReservationInfo in JSP: " + session.getAttribute("reservationInfo")); 
                                    Map<String, Object> reservationInfo = (Map<String, Object>) session.getAttribute("reservationInfo");
                                %>
                                
                                <div class="row mb-4">
                                    <div class="col-md-6">
                                        <div class="p-4 border rounded bg-light">
                                            <h5 class="text-primary">Thông tin dịch vụ:</h5>
                                            <p class="mb-2"><strong>Tên dịch vụ:</strong> ${reservationInfo.service.serviceName}</p>
                                            <p class="mb-0"><strong>Giá:</strong> 
                                                <span class="text-primary">
                                                    <fmt:formatNumber value="${reservationInfo.service.price}" pattern="#,###"/> VNĐ
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="p-4 border rounded bg-light">
                                            <h5 class="text-primary">Thông tin lịch hẹn:</h5>
                                            <p class="mb-2"><strong>Ngày khám:</strong> ${reservationInfo.reservationDate}</p>
                                            <p class="mb-0"><strong>Giờ khám:</strong> ${reservationInfo.startTime}</p>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row mb-4">
                                    <div class="col-12">
                                        <div class="alert alert-info text-center">
                                            <h5 class="mb-0">Tổng tiền thanh toán: 
                                                <span class="text-primary">
                                                    <fmt:formatNumber value="${reservationInfo.service.price}" pattern="#,###"/> VNĐ
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-12 text-center">
                                        <form action="${pageContext.request.contextPath}/payment" method="POST">
                                            <input type="hidden" name="action" value="process">
                                            <button type="submit" class="btn btn-primary">
                                                Tiến hành thanh toán
                                            </button>
                                            <a href="${pageContext.request.contextPath}/customer/services" 
                                               class="btn btn-soft-secondary ms-2">
                                                Hủy
                                            </a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
