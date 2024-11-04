<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Child Care</title>
    <link rel="stylesheet" href="css/styles.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .error-container {
            text-align: center;
            padding: 20px;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 48px;
            color: #dc3545; /* Bootstrap danger color */
        }
        p {
            font-size: 18px;
        }
        .button-group {
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff; /* Bootstrap primary color */
            border: none;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1><i class="fas fa-exclamation-triangle"></i> Đã xảy ra lỗi!</h1>
        <p>${errorMessage != null ? errorMessage : "Xin vui lòng thử lại sau."}</p>
        <div class="button-group">
            <a href="staffhomepage" class="btn"><i class="fas fa-home"></i> Quay lại Trang Chủ</a>
            <a href="javascript:history.back()" class="btn"><i class="fas fa-arrow-left"></i> Quay lại</a>
        </div>
    </div>
</body>
</html>
