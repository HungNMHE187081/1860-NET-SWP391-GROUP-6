<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
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
        <title>Tiny Tots - Chính sách cookie</title>
    </head>

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
                            <a href="http://127.0.0.1:5501/Website/contact-us.html" class="link-style">
                                <span class="material-symbols-outlined">
                                    chat_info
                                </span>
                            </a>
                        </div>
                        <div class="hbleft_info">
                            <!-- Set the href attribute to the desired URL -->
                            <a href="http://127.0.0.1:5501/Website/contact-us.html" class="link-style">
                                <p class="underline">Phản hồi lại chúng tôi </p>
                            </a>
                        </div>
                        <div class="hbleft_icon">
                            <!-- Set the href attribute to the desired URL -->
                            <a href="http://127.0.0.1:5501/Website/contact-us.html" class="link-style">
                                <span class="material-symbols-outlined">
                                    support_agent
                                </span>
                            </a>
                        </div>
                        <div class="hbleft_info">
                            <!-- Set the href attribute to the desired URL -->
                            <a href="http://127.0.0.1:5501/Website/contact-us.html" class="link-style">
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
<body>
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
            <span class="material-symbols-outlined" style="font-size: 56px;">cookie</span>
            Chính sách cookie
        </p>
    </div>
    <br>
    <div>
        <p class="mainfont1 mainfont_italic">Cập nhật ngày 30 tháng 6 năm 2023</p>
        <p class="mainfont1">
            Tại Tiny Tots, chúng tôi sử dụng cookie để cung cấp trải nghiệm tốt hơn và cá nhân hóa hơn cho bạn và các bé. 
            Một số cookie là cần thiết cho một số dịch vụ hoạt động chính xác, trong khi những cookie khác giúp chúng tôi hiểu cách bạn sử dụng trang web, 
            để chúng tôi có thể làm cho nó thuận tiện và hữu ích hơn cho bạn. Một số cookie là tạm thời và sẽ biến mất khi bạn đóng trình duyệt, 
            trong khi những cookie khác là cố định và sẽ ở lại máy tính của bạn trong một thời gian. Chúng tôi cũng sử dụng cookie liên quan đến các sự kiện hoặc 
            chương trình khuyến mãi cụ thể, sẽ hết hạn khi sự kiện kết thúc. Thêm vào đó, chúng tôi sử dụng cookie tiếp thị để cung cấp nội dung và quảng cáo phù hợp với sở thích của bạn.
        </p>
        <br>
        <p class="mainfont1">
            Một số cookie là cần thiết tuyệt đối cho trang web của chúng tôi hoạt động, trong khi những cookie khác giúp nâng cao trải nghiệm duyệt web của bạn 
            hoặc hiển thị thông tin có thể quan tâm đến bạn.
        </p>
        <br>
        <p class="mainfont1 mainfont_bold">Cookie chức năng được sử dụng để:</p>
        <br>
        <p class="mainfont1">
            Nhớ thông tin đăng nhập của bạn<br>
            Giữ nguyên sở thích của bạn cho dịch vụ chăm sóc trẻ em<br>
            Theo dõi tiến trình của bạn trong quá trình đăng ký<br>
        </p>
        <br>
        <p class="mainfont1 mainfont_bold">Cookie cần thiết tuyệt đối được sử dụng để:</p>
        <br>
        <p class="mainfont1">
            Đảm bảo trang web hoạt động đúng cách<br>
            Duy trì bảo mật trong khi bạn đang đăng nhập<br>
            Giữ cho trang web đồng nhất về mặt hiển thị<br>
            Cung cấp quyền truy cập vào hỗ trợ trò chuyện trực tiếp cho các câu hỏi về dịch vụ chăm sóc trẻ em của chúng tôi<br>
        </p>
        <br>
        <p class="mainfont1 mainfont_bold">Cookie hiệu suất được sử dụng để:</p>
        <br>
        <p class="mainfont1">
            Phân tích, đánh giá và cải thiện hiệu suất của trang web của chúng tôi<br>
            Cải thiện trải nghiệm người dùng tổng thể<br>
        </p>
        <br>
        <p class="mainfont1 mainfont_bold">Cookie nhắm mục tiêu, quảng cáo hoặc tiếp thị được sử dụng để:</p>
        <br>
        <p class="mainfont1">
            Cho phép bạn chia sẻ và thích nội dung về dịch vụ chăm sóc trẻ em của chúng tôi<br>
            Gửi thông tin đến các trang web khác để tùy chỉnh quảng cáo của họ<br>
        </p>
        <br>
        <p class="mainfont1">
            Cookie cần thiết tuyệt đối không thể bị vô hiệu hóa. Tất cả các cookie khác có thể được quản lý. 
            Vui lòng lưu ý rằng việc từ chối cookie không cần thiết có thể ảnh hưởng đến một số chức năng của trang web của chúng tôi, 
            chẳng hạn như truy cập vào một số tính năng liên quan đến dịch vụ chăm sóc trẻ em.
        </p>
        <p class="mainfont1">
            Nếu bạn muốn xóa cookie đã có trên máy tính của mình, vui lòng tham khảo hướng dẫn của trình duyệt bằng cách nhấp vào “Trợ giúp” trong menu trình duyệt.
        </p>
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