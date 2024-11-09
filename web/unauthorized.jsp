<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Không có quyền truy cập</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container text-center mt-5">
        <h1 class="display-4">Không có quyền truy cập</h1>
        <p class="lead">Bạn không có quyền truy cập vào trang này.</p>
        
        <!-- Kiểm tra role của user và hiển thị link trang chủ tương ứng -->
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <c:set var="roles" value="${userDAO.getUserRoles(sessionScope.user.userID)}" />
                <c:choose>
                    <c:when test="${roles.contains('Administrator')}">
                        <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-primary">Quay về trang chủ</a>
                    </c:when>
                    <c:when test="${roles.contains('Manager')}">
                        <a href="${pageContext.request.contextPath}/manager/serviceslist" class="btn btn-primary">Quay về trang chủ</a>
                    </c:when>
                    <c:when test="${roles.contains('Staff')}">
                        <a href="${pageContext.request.contextPath}/staff/staffhomepage" class="btn btn-primary">Quay về trang chủ</a>
                    </c:when>
                    <c:when test="${roles.contains('Customer')}">
                        <a href="${pageContext.request.contextPath}/customer/homepage" class="btn btn-primary">Trang chủ</a>
                    </c:when>
                </c:choose>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/guest/homepage" class="btn btn-primary">Trang chủ</a>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-secondary">Đăng nhập</a>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>