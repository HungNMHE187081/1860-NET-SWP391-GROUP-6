<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kết quả thanh toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp"/>
    
    <div class="container mt-5">
        <c:if test="${paymentSuccess}">
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">Thanh toán thành công!</h4>
                <p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.</p>
                <hr>
                <p class="mb-0">
                    <a href="${pageContext.request.contextPath}/customer/listreservations" 
                       class="btn btn-primary">Xem lịch hẹn của bạn</a>
                </p>
            </div>
        </c:if>
        <c:if test="${not paymentSuccess}">
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Thanh toán thất bại!</h4>
                <p>Đã có lỗi xảy ra trong quá trình thanh toán.</p>
                <hr>
                <p class="mb-0">
                    <a href="${pageContext.request.contextPath}/customer/services" 
                       class="btn btn-primary">Quay lại trang dịch vụ</a>
                </p>
            </div>
        </c:if>
    </div>
    
    <jsp:include page="footer.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 