<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-image: url('img/licensed-image (1).jfif');
            background-size: cover;
            background-position: center;
        }
        .logo {
            background-image: url('img/z5806496117813_5fbdeed55eace550e4d22bddf0282af8.jpg');
            height: 120px;
            width: 120px;
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body class="flex items-center justify-center h-screen bg-blue-50">
    <div class="bg-white p-10 rounded-lg shadow-md w-full max-w-sm">
        <div class="flex justify-center mb-6">
            <div class="logo rounded-full"></div>
        </div>
        <h2 class="text-center text-3xl font-bold text-gray-700 mb-4">Đặt lại mật khẩu</h2>
        <form action="${pageContext.request.contextPath}/resetpassword" method="POST">
            <input type="hidden" name="code" value="${param.code}">
            <div class="mb-4">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                       type="password" name="password" placeholder="Mật khẩu mới" required>
            </div>
            <div class="mb-4">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                       type="password" name="confirmPassword" placeholder="Xác nhận mật khẩu" required>
            </div>
            <div class="mb-6">
                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 w-full rounded focus:outline-none focus:shadow-outline" 
                        type="submit">Đặt lại mật khẩu</button>
            </div>
            <% if (request.getParameter("error") != null) { %>
                <p class="text-center text-red-500 text-sm">
                    <%= java.net.URLDecoder.decode(request.getParameter("error"), "UTF-8") %>
                </p>
            <% } %>
        </form>
    </div>
</body>
</html>
