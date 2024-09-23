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
        <title>Tiny Tots - Trang Chủ</title>
    </head>

    <body>
        <header>
            <div class="header-container" id="headerContainer">
                <div class="header_top">
                    <div class="logo">
                        <a href="<%= request.getContextPath() %>/home.jsp">
                            <img src="Images/final.png" alt="Logo">
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
<div class="changeup"></div>
<div class="video-text-container">
    <div class="video-container">
        <video class="video1" width="1080" height="auto" autoplay muted loop>
            <source src="Videos/1campaign.mp4" type="video/mp4">
            Trình duyệt của bạn không hỗ trợ thẻ video.
        </video>
        <div class="text-container">
            <h2>Hiểu Cách Chăm Sóc Trẻ<br>Được Quy Định để Giữ <br>An Toàn cho Trẻ Em</h2>
            <p>Tìm hiểu ý nghĩa của việc một chương trình chăm sóc trẻ em được cấp phép<br>và tại sao điều đó quan trọng để giữ an toàn cho trẻ em.</p>
            <div class="header_top">
                <button onclick="window.location.href = ''" class="shop-now-btnget shop-now-btnfooter">Tìm hiểu thêm</button>
            </div>
        </div>
    </div>
</div>
<div>
    <p class="mainfont" id="rainbowText">Trung Tâm Chăm Sóc Trẻ: Nuôi Dưỡng Sự Phát Triển và Trưởng Thành</p>
</div>
<div>
    <p class="mainfont1">Tổng quan về các trung tâm chăm sóc trẻ, nơi trẻ em được chăm sóc, giáo dục và xã hội hóa trong một môi trường an toàn và hỗ trợ.</p>
    <div class="header_top">
        <button class="shop-now-btn shop-now-btn1" onclick="window.location.href = ''">Xem thêm</button>
    </div>
</div>
</div>
<div class="color-container">
    <div class="color1">
        <img class="bordered-image" src="Images/cam1.jpg" alt="">
    </div>
    <div class="color1">
        <img class="bordered-image" src="Images/cam2.jpg" alt="">
    </div>
    <div class="color1">
        <img class="bordered-image" src="Images/cam3.jpg" alt="">
    </div>
</div>
<div class="video-text-container1">
    <div class="text-container1">
        <h2>Sức mạnh của người chăm sóc trẻ</h2>
        <p>Gặp gỡ Sam, một người chăm sóc trẻ và nhà giáo dục mầm non tận tâm. Cô chia sẻ về việc bắt đầu công việc chăm sóc trẻ của mình thông qua một cơ quan chăm sóc trẻ là một quá trình đơn giản đã đưa cô vào một cộng đồng hỗ trợ - và cô không hề hối tiếc kể từ đó. Đọc thêm trên blog của chúng tôi!</p>
    </div>
    <div class="video-container1">
        <video class="video1" width="1080" height="auto" autoplay muted loop>
            <source src="Videos/2campaign.mp4" type="video/mp4">
            Trình duyệt của bạn không hỗ trợ thẻ video.
        </video>
    </div>
</div>
<div class="square-container">
    <div class="square-text-box">
        <p class="member-text">Khám Phá Chương Trình Đặc Biệt Mới của Chúng Tôi cho Chăm Sóc Trẻ</p>
    </div>
</div>
<div>
    <p class="member-text1">Khám phá các chương trình đặc biệt mới được thiết kế để nâng cao sự phát triển của trẻ nhỏ. Từ nghệ thuật sáng tạo đến các hoạt động STEM, những chương trình<br>được điều chỉnh này mang đến những trải nghiệm học tập độc đáo nuôi dưỡng sự tò mò, sáng tạo và phát triển ở mọi trẻ em.</p>
    <div class="header_top">
        <button class="shop-now-btn shop-now-btn-second" onclick="window.location.href = ''">Kiểm Tra Ngay</button>
    </div>
</div>
<div class="video-text-container">
    <div class="video-container">
        <video class="video1" width="1080" height="auto" autoplay muted loop>
            <source src="Videos/4campaign.mp4" type="video/mp4">
            Trình duyệt của bạn không hỗ trợ thẻ video.
        </video>
        <div class="text-container">
            <h2>Hợp Tác Thú Vị với BayCare</h2>
            <p>Chúng tôi rất vui mừng thông báo về sự hợp tác của chúng tôi với BayCare,<br>mang đến các bác sĩ và y tá chuyên dụng để hỗ trợ sức khỏe <br>và sự khỏe mạnh của trẻ em trong sự chăm sóc của chúng tôi. Cùng nhau, chúng tôi đang tạo ra<br>một môi trường an toàn và khỏe mạnh hơn cho mọi trẻ em.</p>
            <div class="header_top">
                <button class="shop-now-btnget shop-now-btnfooter">Kiểm Tra Trung Tâm Chăm Sóc Trẻ</button>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<div class="flex-container">
    <div class="flex-box">
        <p class="center-text underline">
            Trung Tâm Chăm Sóc Trẻ</p>
        <button class="shop-now-btn shop-now-btn-third" onclick="window.location.href = ''">Kiểm Tra</button>
    </div>
    <div class="flex-box">
        <p class="center-text underline">Dịch Vụ Hỗ Trợ Phụ Huynh </p>
        <button class="rounded-arrow-btn">
            <span class="material-symbols-outlined">
                arrow_right_alt
            </span>
        </button>
    </div>
    <div class="flex-box">
        <p class="center-text underline">Chương Trình Đặc Biệt</p>
        <button class="rounded-arrow-btn">
            <span class="material-symbols-outlined">
                arrow_right_alt
            </span>
        </button>
    </div>
    <div class="flex-box">
        <p class="center-text underline">Chăm Sóc Khẩn Cấp</p>
        <button class="rounded-arrow-btn">
            <span class="material-symbols-outlined">
                arrow_right_alt
            </span>
        </button>
    </div>
    <div class="flex-box">
        <p class="center-text underline">Chăm Sóc Sau Giờ Học</p>
        <button class="rounded-arrow-btn">
            <span class="material-symbols-outlined">
                arrow_right_alt
            </span>
        </button>
    </div>
    <div class="flex-box">
        <p class="center-text underline">Giỏ Hàng</p>
        <button class="rounded-arrow-btn">
            <span class="material-symbols-outlined">
                arrow_right_alt
            </span>
        </button>
    </div>
    <div class="flex-box">
        <p class="center-text underline">Phản Hồi</p>
        <button class="rounded-arrow-btn">
            <span class="material-symbols-outlined">
                arrow_right_alt
            </span>
        </button>
    </div>
</div>
<div>
    <p class="mainfont">Chào mừng đến với Bé Nhỏ – Đối Tác Đáng Tin Cậy của Bạn trong Chăm Sóc Trẻ!</p>
</div>
<div>
    <p class="mainfont1">Tại Bé Nhỏ, chúng tôi cung cấp một loạt các dịch vụ chăm sóc trẻ xuất sắc được thiết kế để đáp ứng nhu cầu của mọi gia đình.<br>Mục tiêu của chúng tôi là tạo ra một môi trường nuôi dưỡng, an toàn và kích thích nơi trẻ em có thể học hỏi, phát triển và thịnh vượng.</p>
    <br>
</div>
<div>
    <p class="mainfont">Trung Tâm Chăm Sóc Trẻ</p>
</div>
<div>
    <p class="mainfont1">Các trung tâm chăm sóc trẻ của Bé Nhỏ cung cấp các lựa chọn chăm sóc toàn thời gian và bán thời gian. Với trọng tâm vào sự phát triển của trẻ nhỏ, <br>các trung tâm của chúng tôi cung cấp một thời gian biểu có cấu trúc đầy các hoạt động giáo dục và vui chơi, bao gồm kể chuyện, chơi sáng tạo <br>và các buổi học tập sớm. Các bữa ăn và đồ ăn nhẹ lành mạnh cũng được cung cấp để hỗ trợ sức khỏe tổng thể <br>của con bạn.</p>
    <br>
</div>
<div>
    <p class="mainfont">Dịch Vụ Hỗ Trợ Phụ Huynh</p>
    <p class="mainfont1">Chúng tôi tin vào việc hỗ trợ không chỉ trẻ em mà còn cả gia đình. Các dịch vụ hỗ trợ phụ huynh của chúng tôi bao gồm các hội thảo, <br>các buổi đào tạo và các nhóm hỗ trợ được thiết kế để giúp phụ huynh vượt qua các thách thức của việc nuôi dạy con cái. Chúng tôi cung cấp <br>các nguồn tài nguyên quý giá về sự phát triển của trẻ em, quản lý gia đình và nhiều hơn nữa.</p>
</div>
<div>
    <p class="mainfont">Chương Trình Đặc Biệt</p>
    <p class="mainfont1">Bé Nhỏ cung cấp các chương trình đặc biệt được thiết kế để đáp ứng nhu cầu của mọi trẻ em. Điều này bao gồm các chương trình cho trẻ em <br>có nhu cầu đặc biệt, chương trình ngôn ngữ, và các phương pháp giáo dục độc đáo như Montessori và Waldorf. Chúng tôi <br>cũng cung cấp các trại hè theo mùa và chăm sóc trong kỳ nghỉ để giữ cho con bạn luôn tham gia và học hỏi suốt năm.</p>
</div>
<div>
    <p class="mainfont">Chăm Sóc Khẩn Cấp</p>
    <p class="mainfont1">Đối với phụ huynh cần các lựa chọn chăm sóc trẻ linh hoạt, Bé Nhỏ cung cấp dịch vụ chăm sóc đột xuất hoặc khẩn cấp. Dịch vụ này <br>hoàn hảo cho những khoảnh khắc bất ngờ khi bạn cần chăm sóc trẻ trong thời gian ngắn. Đội ngũ nhân viên có kinh nghiệm của chúng tôi sẵn sàng <br>cung cấp dịch vụ chăm sóc theo giờ hoặc theo ngày, đảm bảo con bạn an toàn và hạnh phúc.</p>
</div>
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