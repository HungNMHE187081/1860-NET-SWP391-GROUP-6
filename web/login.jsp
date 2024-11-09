<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
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
        .requirements {
            display: none;
            position: absolute;
            bottom: -20px;
            left: 0;
            font-size: 0.75rem;
            color: #6b7280;
            transition: all 0.3s ease;
        }
        .input-wrapper:focus-within .requirements {
            display: block;
        }
    </style>
</head>
<body class="flex items-center justify-center h-screen bg-blue-50">
    <div class="bg-white p-10 rounded-lg shadow-md w-full max-w-sm">
        <div class="flex justify-center mb-6">
            <div class="logo rounded-full"></div>
        </div>
        <h2 class="text-center text-3xl font-bold text-gray-700 mb-4">Đăng nhập</h2>
        
        <%-- Hiển thị thông báo lỗi --%>
        <c:if test="${not empty errors}">
            <div class="mb-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded">
                <ul class="list-disc list-inside">
                    <c:forEach items="${errors}" var="error">
                        <li class="text-sm">${error}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-4">
            <div class="input-wrapper">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline
                       ${not empty errors ? 'border-red-500' : ''}" 
                       type="text" 
                       name="username" 
                       placeholder="Tên đăng nhập"
                       value="${username}"
                       required>
                <div class="requirements">
                    Tên đăng nhập phải từ 3-50 ký tự
                </div>
            </div>

            <div class="input-wrapper">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline
                       ${not empty errors ? 'border-red-500' : ''}" 
                       type="password" 
                       name="password" 
                       placeholder="Mật khẩu"
                       required>
                <div class="requirements">
                    Vui lòng nhập mật khẩu
                </div>
            </div>

            <div class="text-center mt-4">
                <a href="${pageContext.request.contextPath}/forgotpassword" 
                   class="text-blue-500 hover:text-blue-700">Quên mật khẩu?</a>
            </div>

            <div class="mb-6">
                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 w-full rounded focus:outline-none focus:shadow-outline transition duration-200" 
                        type="submit">
                    Đăng nhập
                </button>
            </div>

            <div class="flex items-center justify-between mb-6">
                <hr class="w-full" /> 
                <span class="p-2 text-gray-400 mb-1">Hoặc</span> 
                <hr class="w-full" />
            </div>

            <p class="text-center text-gray-600 text-sm">
                Chưa có tài khoản? 
                <a href="${pageContext.request.contextPath}/register" 
                   class="text-blue-500 hover:text-blue-700">
                    Đăng kí
                </a>
            </p>
        </form>
    </div>

    <script>
        // Xử lý hiển thị/ẩn requirements
        document.querySelectorAll('.input-wrapper input').forEach(input => {
            const requirements = input.nextElementSibling;
            
            input.addEventListener('focus', () => {
                if (!input.value) {
                    requirements.style.display = 'block';
                }
            });

            input.addEventListener('blur', () => {
                requirements.style.display = 'none';
            });

            input.addEventListener('input', () => {
                if (input.value) {
                    requirements.style.display = 'none';
                }
            });
        });

        // Client-side validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const username = document.querySelector('input[name="username"]').value;
            const password = document.querySelector('input[name="password"]').value;
            let hasError = false;

            if (username.length < 3 || username.length > 50) {
                e.preventDefault();
                hasError = true;
            }

            if (password.trim() === '') {
                e.preventDefault();
                hasError = true;
            }

            if (hasError) {
                document.querySelectorAll('input').forEach(input => {
                    input.classList.add('border-red-500');
                });
            }
        });
    </script>
</body>
</html>