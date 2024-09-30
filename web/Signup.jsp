<%-- 
    Document   : Signup
    Created on : Sep 14, 2024, 4:45:39 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-image: url('img/licensed-image (1).jfif'); /* Ảnh nền */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-wrapper {
            background-color: rgba(255, 255, 255, 0.85); /* Nền trắng với độ trong suốt 85% */
            border-radius: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 0;
            display: flex;
            max-width: 900px;
            overflow: hidden;
        }
        .form-wrapper img {
            border-radius: 50px;
            width: 100%;
            height: 100%;
            object-fit: cover;
            
        }
        .img-fluid{
            padding-left: 20px;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        
        .form-wrapper .form-section {
            padding: 40px;
        }
        .btn-create-account {
            background-color: #E80F2C;
            color: white;
            border-radius: 30px;
        }
        .btn-create-account:hover {
            background-color: #d00b29;
        }
    </style>
</head>
<body>

<div class="container-fluid form-container">
    <div class="form-wrapper row">
        <!-- Image Section -->
        <div class="col-md-6 p-0">
            <img src="img/v1_8.png" alt="Children learning" class="img-fluid">
        </div>
        <!-- Form Section -->
        <div class="col-md-6 form-section">
            <div class="text-center">
                <img src="img/v1_16.png" alt="Logo" style="width: 100px;">
                <h2 class="mt-3">Create Account</h2>
            </div>
            <form>
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" placeholder="Enter your username">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Enter your password">
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter your email">
                </div>
                <div class="mb-3">
                    <label for="repassword" class="form-label">Enter re-password</label>
                    <input type="password" class="form-control" id="repassword" placeholder="Re-enter your password">
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-create-account">Create Account</button>
                </div>
            </form>
            <div class="text-center mt-3">
                <a href="#" class="text-secondary">I have already an account?</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


