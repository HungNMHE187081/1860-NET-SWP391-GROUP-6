
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <% if ((Boolean)request.getAttribute("paymentSuccess")) { %>
                        <div class="alert alert-success">
                            <h3>Thanh toán thành công!</h3>
                            <p>Cảm ơn bạn đã sử dụng dịch vụ.</p>
                        </div>
                    <% } else { %>
                        <div class="alert alert-danger">
                            <h3>Thanh toán thất bại!</h3>
                            <p>Vui lòng thử lại sau.</p>
                        </div>
                    <% } %>
                    <a href="${pageContext.request.contextPath}/customer/homepage" class="btn btn-primary">Về trang chủ</a>
                    
                    
                    
                </div>
            </div>
        </div>
    </body>
</html>
