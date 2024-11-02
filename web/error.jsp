<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Error Page</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            .error-container {
                text-align: center;
                padding: 100px 20px;
            }
            .error-icon {
                color: #dc3545;
                font-size: 48px;
                margin-bottom: 20px;
            }
            .error-message {
                color: #666;
                margin-bottom: 30px;
            }
            .btn-home {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="error-container">
                <i class="fas fa-exclamation-circle error-icon"></i>
                <h2>Oops! Something went wrong</h2>
                <div class="error-message">
                    <p>${error}</p>
                </div>
                <a href="${pageContext.request.contextPath}/homepage" class="btn btn-primary btn-home">
                    <i class="fas fa-home"></i> Back to Home
                </a>
            </div>
        </div>
    </body>
</html>
