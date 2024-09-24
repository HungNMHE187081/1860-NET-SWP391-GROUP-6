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
        <title>Tiny Tots - Liên hệ</title>
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
            <button class="rounded-arrow-btn1" onclick="goBack()">
                <script>
                    function goBack() {
                        window.history.back();
                    }
                </script>
                <span class="material-symbols-outlined">
                    arrow_back
                </span>
            </button>
            <p class="headnews">
                Quay lại
            </p>
        </a>
    </div>
    <p class="mainguide0"><span class="material-symbols-outlined" style="font-size: 56px;">
        support_agent
        </span>
        Liên hệ với chúng tôi</p>
</div>
<p class="mainfont2">Liên hệ với chúng tôi</p>
<p class="mainfont1">Chúng tôi rất coi trọng phản hồi của bạn và sẵn sàng giúp đỡ bất kỳ câu hỏi hoặc thắc mắc nào bạn có thể có.
    <br>Vui lòng liên hệ với chúng tôi qua các phương thức sau:
</p>
<br>
<p class="mainfont1 mainfont_bold">Điện thoại</p>
<p class="mainfont1">Bạn có thể gọi cho chúng tôi qua số:</p>
<br>
<p class="mainfont1">Hỗ trợ khách hàng: (123) 456-7890</p>
<p class="mainfont1">Yêu cầu bán hàng: (987) 654-3210</p>
<br>
<p class="mainfont1">Đường dây điện thoại của chúng tôi mở từ 9:00 AM đến 6:00 PM, từ Thứ Hai đến Thứ Sáu.</p>
<br>
<br>
<p class="mainfont1 mainfont_bold">Email</p>
<p class="mainfont1">Đối với bất kỳ yêu cầu hoặc phản hồi nào, bạn có thể gửi email cho chúng tôi tại:</p>
<br>
<p class="mainfont1">Yêu cầu chung: Tinytots.info@tinytots.com</p>
<p class="mainfont1">Hỗ trợ: Tinytots.support@tinytots.com</p>
<p class="mainfont1">Bán hàng: Tinytots.sales@tinytots.com</p>
<br>
<p class="mainfont1">Chúng tôi cố gắng trả lời tất cả các email trong vòng 24 giờ vào các ngày làm việc.</p>
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