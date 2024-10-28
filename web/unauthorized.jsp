<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unauthorized</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container text-center mt-5">
        <h1 class="display-4">Unauthorized</h1>
        <p class="lead">You do not have permission to access this page.</p>
        <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Go to Login</a>
    </div>
</body>
</html>