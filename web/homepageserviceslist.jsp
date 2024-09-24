<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title> Home | Services List</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/manager/services.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <!-- google font link -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wdth,wght@0,62.5..100,100..900;1,62.5..100,100..900&display=swap"
            rel="stylesheet">
        <!-- cdn link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- google icon -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <!-- css link -->
        <link rel="stylesheet" href="styles.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/jpg" href="Images/1.png" />
    </head>
    <style>
        /* Modern search form styles */
        .search-form {
            margin: 20px 0;
            display: flex;
            justify-content: center;
        }

        .search-form input[type="text"] {
            width: 700px;
            padding: 13px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 25px 0 0 25px;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .search-form input[type="text"]:focus {
            border-color: #4a90e2;
        }

        .search-form button {
            padding: 12px 15px;
            background-color: #f5f5f5;
            color: #333;
            border: 1px solid #e0e0e0;
            border-left: none;
            border-radius: 0 25px 25px 0;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .search-form button:hover {
            background-color: #212529;
            color: #fff;
        }

        .search-form button .material-symbols-outlined {
            font-size: 24px;
        }
        .center-align {
            text-align: center;
        }
        .modern-table {
            width: 100%;
            border-collapse: collapse;
        }

        .modern-table th, .modern-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .material-symbols-outlined {
            vertical-align: middle;
            margin-right: 5px;
        }

    </style>
    <body>
        <header>
            <div class="header-container" id="headerContainer">
                <div class="header_top">
                    <div class="logo">
                        <a href="<%= request.getContextPath() %>/home.jsp">
                            <img src="img/final.png" alt="Logo">
                        </a>
                    </div>
                    <div class="headsearch">
                        <div class="input_search">
                            <input type="search" placeholder="Bạn đang tìm gì?">
                        </div>
                        <div class="icon_search">
                            <span class="material-symbols-outlined">
                                search
                            </span>
                        </div>
                    </div>
                    <div class="headsec5 headhover">
                        <div class="hs5_icon">
                            <a href="" class="link-style">
                                <span class="material-symbols-outlined">
                                    book
                                </span>
                            </a>
                        </div>
                        <div class="hs5_para">
                            <a href="" class="link-style">
                                <p class="up">Blog</p>
                                <p class="down">Chúng Tôi</p>
                            </a>
                        </div>
                    </div>
                    <div class="headsec5 headhover">
                        <a href="" class="link-style">
                            <div class="carticon">
                                <span class="material-symbols-outlined">
                                    shopping_bag
                                </span>
                        </a>
                    </div>
                    <div class="hs5_para">
                        <a href="" class="link-style">
                            <p class="up">Giỏ</p>
                            <p class="down">Hàng</p>
                        </a>
                    </div>
                </div>
                <div class="headsec5 headhover">
                    <div class="hs5_icon">
                        <a href="" class="link-style">
                            <span class="material-symbols-outlined">
                                account_circle
                            </span>
                        </a>
                    </div>
                    <div class="hs5_para">
                        <a href="" class="link-style">
                            <p class="up">Đăng Nhập</p>
                            <p class="down">Tài Khoản</p>
                        </a>
                    </div>
                </div>
            </div>
            <!-- header btm -->
            <div class="header_bootom">
                <div class="headbtm_left">
                    <div class="hbtm_left">
                        <div class="hbleft_icon">
                            <!-- Set the href attribute to the desired URL -->
                            <a href="http://localhost:9999/G6_ChildrenCare/feedback.jsp" class="link-style">
                                <span class="material-symbols-outlined">
                                    chat_info
                                </span>
                            </a>
                        </div>
                        <div class="hbleft_info">
                            <!-- Set the href attribute to the desired URL -->
                            <a href="http://localhost:9999/G6_ChildrenCare/feedback.jsp" class="link-style">
                                <p class="underline">Phản hồi lại chúng tôi </p>
                            </a>
                        </div>
                        <div class="hbleft_icon">
                            <!-- Set the href attribute to the desired URL -->
                            <a href="http://localhost:9999/G6_ChildrenCare/contact-us.jsp" class="link-style">
                                <span class="material-symbols-outlined">
                                    support_agent
                                </span>
                            </a>
                        </div>
                        <div class="hbleft_info">
                            <!-- Set the href attribute to the desired URL -->
                            <a href="http://localhost:9999/G6_ChildrenCare/contact-us.jsp" class="link-style">
                                <p class="underline">Liên Hệ tới Chúng Tôi</p>
                            </a>
                        </div>
                    </div>
                </div>            
                <div class="headbtm_right">
                    <a href="" class="link-style">
                        <p class="underline">Trung Tâm Chăm Sóc Trẻ</p>
                    </a>
                    <a href="" class="link-style">
                        <p class="underline">Dịch Vụ Hỗ Trợ Phụ Huynh</p>
                    </a>
                    <a href="" class="link-style">
                        <p class="underline">Chương Trình Đặc Biệt</p>
                    </a>
                    <a href="" class="link-style">
                        <p class="underline">Chăm Sóc Khẩn Cấp</p>
                    </a>
                    <a href="" class="link-style">
                        <p class="underline">Chăm Sóc Sau Giờ Học</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<br>
<br>
<br>
<div> 
    <div>
        <a class="link-style" onclick="goBack()">
            <button class="rounded-arrow-btn1" type="button" onclick="goBack()">
                <span class="material-symbols-outlined">arrow_back</span>
            </button>
            <p class="headnews">Quay lại</p>
        </a>
    </div>
    <p class="mainguide0">
        <span class="material-symbols-outlined" style="font-size: 56px;">service_toolbox</span>
        Danh sách dịch vụ
    </p>
</div>
<br>
<div>
    <p class="mainfont1 mainfont_italic">Cập nhật hàng ngày</p>
    <p class="mainfont1">
        Tại Trung Tâm Chăm Sóc Trẻ của chúng tôi, chúng tôi hiểu rằng mỗi bé là một cá thể độc đáo với những nhu cầu, sở thích và tốc độ phát triển riêng biệt.<br>Chính vì thế, sự phát triển toàn diện về cả thể chất, trí tuệ, cảm xúc và xã hội của bé luôn là ưu tiên hàng đầu trong mọi hoạt động và dịch vụ<br>mà chúng tôi cung cấp. Chúng tôi không chỉ đảm bảo sự an toàn tuyệt đối cho bé trong môi trường được giám sát chặt chẽ, mà <br>còn khuyến khích các bé phát triển kỹ năng tự lập, khả năng sáng tạo, và khả năng tương tác xã hội.
    </p>

    <!-- Search Form -->
    <form action="searchService" method="get" class="search-form">
        <input type="text" name="query" placeholder="Tìm kiếm dịch vụ">
        <button type="submit">
            <span class="material-symbols-outlined">search</span>
        </button>
    </form>

    <table class="modern-table">
        <thead>
            <tr>
                <th style="text-align: center;">Số thứ tự</th>
                <th style="text-align: center;">Tên dịch vụ</th>
                <th style="text-align: center;">Ảnh</th>
                <th style="text-align: center;">Độ tuổi</th>
                <th style="text-align: center;">Giá</th>
                <th style="text-align: center;">Thời gian tối đa</th>
                <th style="text-align: center;">Mô tả dịch vụ</th>
                <th style="text-align: center;">Trạng thái</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="service" items="${services}" varStatus="status">
                <tr>
                    <td style="text-align: center;">${status.index + 1}</td>
                    <td style="text-align: center;">${service.serviceName}</td>
                    <td style="text-align: center;">
                        <img src="${service.serviceImage}" alt="${service.serviceName}" width="75" height="50">
                    </td>
                    <td style="text-align: center;">
                        <c:forEach var="ageLimit" items="${ageLimits}">
                            <c:if test="${ageLimit.ageLimitID == service.ageLimitID}">
                                ${ageLimit.ageLimit}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td style="text-align: center;">
                        <fmt:formatNumber value="${service.price}" type="number" groupingUsed="true" />
                    </td>
                    <td style="text-align: center;">
                        <c:if test="${service.duration == 0}">
                            Theo lịch đặt
                        </c:if>
                        <c:if test="${service.duration != 0}">
                            ${service.duration} phút
                        </c:if>
                    </td>
                    <td style="text-align: center;">${service.description}</td>
                    <td style="text-align: center;">
                        <c:if test="${service.isActive}">
                            <span class="material-symbols-outlined">check_circle</span>
                            Hoạt Động
                        </c:if>
                        <c:if test="${!service.isActive}">
                            <span class="material-symbols-outlined">cancel</span>
                            Không Hoạt Động
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>
</div>
<button id="backToTop" title="Lên đầu trang">
    <span class="material-symbols-outlined" style="font-size: 12px;" color="white">
        arrow_upward
    </span>
    <span class="back-to-top-text">Lên đầu trang</span>
</button>
<script src="script.js"></script>
</header>
<div id="footer"></div>
<script>
                document.addEventListener("DOMContentLoaded", function () {
                    fetch('footer.jsp')
                            .then(response => response.text())
                            .then(data => {
                                document.getElementById('footer').innerHTML = data;
                            });
                });
</script>
</body>
</html>
