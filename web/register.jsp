<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng kí</title>
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
        <h2 class="text-center text-3xl font-bold text-gray-700 mb-4">Đăng kí</h2>
        
        <c:if test="${not empty error}">
            <div class="mb-4 text-center text-red-500 text-sm">
                ${error}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="mb-4">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                       type="text" 
                       id="username" 
                       name="username" 
                       placeholder="Tên đăng nhập"
                       value="${username}"
                       required>
            </div>
            <div class="mb-4">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                       type="email" 
                       id="email" 
                       name="email" 
                       placeholder="Email"
                       value="${email}"
                       required>
            </div>
            <div class="mb-4">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                       type="password" 
                       id="password" 
                       name="password" 
                       placeholder="Mật khẩu" 
                       required>
            </div>
            <div class="mb-6">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                       type="password" 
                       id="repassword" 
                       name="repassword" 
                       placeholder="Nhập lại mật khẩu" 
                       required>
            </div>
            <div class="mb-6">
                <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 w-full rounded focus:outline-none focus:shadow-outline" 
                        type="submit">Đăng kí</button>
            </div>
        </form>
    </div>
</body>
</html>