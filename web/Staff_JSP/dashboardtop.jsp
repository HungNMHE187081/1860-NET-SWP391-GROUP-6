
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <header>
            <div class="container">
                <h1><i class="fas fa-hospital"></i> Child Care</h1>
                <nav>
                    <ul>
                        <li><a href="staffhomepage"><i class="fas fa-home"></i> Trang chủ</a></li>
                        <li><a href="${pageContext.request.contextPath}/staff/viewprofile"><i class="fas fa-user"></i> Thông tin cá nhân</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
                    </ul>
                </nav>
            </div>
        </header>
</html>
