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
        .input-wrapper {
            position: relative;
        }

        .input-wrapper input {
            width: 100%;
        }

        .input-wrapper input:placeholder-shown + .requirements {
            display: none;
        }

        .input-wrapper:hover .requirements {
            display: block;
            position: absolute;
            bottom: -25px;
            left: 0;
            right: 0;
            text-align: center;
            background-color: #f8f9fa;
            border: 1px solid #e2e8f0;
            border-radius: 0.25rem;
            padding: 0.375rem 0.75rem;
            font-size: 0.875rem;
            color: #6c757d;
        }
    </style>
</head>
<body class="flex items-center justify-center h-screen bg-blue-50">
    <div class="bg-white p-10 rounded-lg shadow-md w-full max-w-sm">
        <div class="flex justify-center mb-6">
            <div class="logo rounded-full"></div>
        </div>
        <h2 class="text-center text-3xl font-bold text-gray-700 mb-4">Đăng kí</h2>
        
        <c:if test="${not empty errors}">
            <div class="mb-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded">
                <ul class="list-disc list-inside">
                    <c:forEach items="${errors}" var="error">
                        <li class="text-sm">${error}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="mb-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded">
                <p class="text-sm">${error}</p>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/register" method="post" class="space-y-4">
            <div class="space-y-2">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline
                       ${not empty errors && empty username ? 'border-red-500' : ''}" 
                       type="text" 
                       id="username" 
                       name="username" 
                       placeholder="Tên đăng nhập"
                       value="${username}"
                       required>
                <p class="text-xs text-gray-500">Tên đăng nhập phải từ 3-50 ký tự</p>
            </div>

            <div class="space-y-2">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline
                       ${not empty errors && empty email ? 'border-red-500' : ''}" 
                       type="email" 
                       id="email" 
                       name="email" 
                       placeholder="Email"
                       value="${email}"
                       required>
                <p class="text-xs text-gray-500">Nhập email hợp lệ </p>
            </div>

            <div class="space-y-2">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline
                       ${not empty errors && empty password ? 'border-red-500' : ''}" 
                       type="password" 
                       id="password" 
                       name="password" 
                       placeholder="Mật khẩu" 
                       required>
                <p class="text-xs text-gray-500">Mật khẩu phải có ít nhất 8 ký tự</p>
            </div>

            <div class="space-y-2">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline
                       ${not empty errors && empty repassword ? 'border-red-500' : ''}" 
                       type="password" 
                       id="repassword" 
                       name="repassword" 
                       placeholder="Nhập lại mật khẩu" 
                       required>
            </div>

            <div class="pt-4">
                <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 w-full rounded focus:outline-none focus:shadow-outline transition duration-200" 
                        type="submit">
                    Đăng kí
                </button>
            </div>

            <div class="text-center mt-4">
                <p class="text-sm text-gray-600">
                    Đã có tài khoản? 
                    <a href="${pageContext.request.contextPath}/login" class="text-green-500 hover:text-green-700">
                        Đăng nhập
                    </a>
                </p>
            </div>
        </form>
    </div>

    <script>
        document.querySelector('form').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const repassword = document.getElementById('repassword').value;
            
            if (password !== repassword) {
                e.preventDefault();
                alert('Mật khẩu nhập lại không khớp!');
            }
        });

        // Xử lý hiển thị/ẩn requirements cho tất cả các input
        document.querySelectorAll('input[data-requirements]').forEach(input => {
            const requirementsDiv = input.nextElementSibling;
            
            // Ẩn requirements khi input được focus
            input.addEventListener('focus', () => {
                requirementsDiv.style.opacity = '0';
            });

            // Hiện requirements khi blur và input trống
            input.addEventListener('blur', () => {
                if (!input.value) {
                    requirementsDiv.style.opacity = '1';
                }
            });

            // Ẩn requirements nếu input có giá trị
            input.addEventListener('input', () => {
                if (input.value) {
                    requirementsDiv.style.opacity = '0';
                }
            });
        });
    </script>
</body>
</html>