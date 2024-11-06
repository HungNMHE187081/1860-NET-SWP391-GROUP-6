<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kết quả thanh toán</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center">
                    <% 
                        Boolean paymentSuccess = (Boolean)request.getAttribute("paymentSuccess");
                        String transactionNo = (String)request.getAttribute("transactionNo");
                    %>
                    
                    <% if (Boolean.TRUE.equals(paymentSuccess)) { %>
                        <div class="alert alert-success">
                            <h3>Thanh toán thành công!</h3>
                            <p>Mã giao dịch: <%= transactionNo %></p>
                            <p>Cảm ơn bạn đã sử dụng dịch vụ.</p>
                        </div>
                    <% } else { %>
                        <div class="alert alert-danger">
                            <h3>Thanh toán thất bại!</h3>
                            <p>Mã giao dịch: <%= transactionNo %></p>
                            <p>Vui lòng thử lại sau.</p>
                        </div>
                    <% } %>
                    
                    <a href="${pageContext.request.contextPath}/customer/listreservations" 
                       class="btn btn-primary">Xem danh sách đặt lịch</a>
                </div>
            </div>
        </div>
    </body>
</html>
