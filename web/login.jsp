<%-- 
    Document   : Login
    Created on : Sep 13, 2024, 3:31:29 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
        <h2 class="text-center text-3xl font-bold text-gray-700 mb-4">Login</h2>
        <form>
            <div class="mb-4">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" type="email" placeholder="Username">
            </div>
            <div class="mb-6">
                <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" type="password" placeholder="Password">
                <a href="#" class="text-blue-500 hover:text-blue-700 text-sm float-right">Forgot Password?</a>
            </div>
            <div class="mb-6">
                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 w-full rounded focus:outline-none focus:shadow-outline" type="button">Login</button>
            </div>
            <div class="flex items-center justify-between mb-6">
                <hr class="w-full" /> <span class="p-2 text-gray-400 mb-1">OR</span> <hr class="w-full" />
            </div>
            <div class="mb-4">
                <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 w-full rounded focus:outline-none focus:shadow-outline" type="button">Sign Up with Email</button>
            </div>
            <p class="text-center text-gray-600 text-sm">
                Don't have an account? <a href="#" class="text-blue-500 hover:text-blue-700">Sign Up</a>
            </p>
        </form>
    </div>
</body>
</html>