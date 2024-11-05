<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lỗi</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center">
                    <div class="alert alert-danger">
                        <h3>Đã xảy ra lỗi!</h3>
                        <p>Vui lòng thử lại sau hoặc liên hệ hỗ trợ.</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/customer/homepage" class="btn btn-primary">
                        Về trang chủ
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>