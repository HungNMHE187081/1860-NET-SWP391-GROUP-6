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
        <title>Tiny Tots - Chính sách bảo mật</title>
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
                    admin_panel_settings
                </span>
                Chính sách bảo mật</p>
        </div>
        </br>
        <div>
            <p class="mainfont1 mainfont_italic">Cập nhật ngày 28 tháng 2 năm 2024</p>
            <p class="mainfont1">Chúng tôi vừa cập nhật Chính sách bảo mật của mình.</p>
            <br>
            <p class="mainfont1 mainfont_bold">Về Chính sách bảo mật này</p>
            <br>
            <p class="mainfont1">Chúng tôi hiểu tầm quan trọng của việc bạn hiểu cách chúng tôi sử dụng thông tin cá nhân của bạn.
                Chính sách bảo mật này <br>quy định cách thức và lý do Những Đứa Trẻ Nhỏ North America Services, LLC và các công ty liên kết tại Hoa Kỳ
                ("Những Đứa Trẻ Nhỏ", "chúng tôi," "của chúng tôi," hoặc "chúng tôi") thu thập, lưu trữ,<br>xử lý và chia sẻ thông tin cá nhân của bạn. Chúng tôi cố gắng minh bạch
                với bạn về những gì chúng tôi làm với thông tin cá nhân của bạn.</p>
            <br>
            <p class="mainfont1">Chính sách bảo mật này áp dụng cho các cửa hàng tại Hoa Kỳ, trải nghiệm trực tuyến tại Hoa Kỳ (bao gồm trang web
                và ứng dụng di động), trung tâm tại Hoa Kỳ, và <br>các địa điểm khác tại Hoa Kỳ nơi bạn có thể tương tác với chúng tôi. Chính
                sách bảo mật này cũng mô tả các lựa chọn bạn có thể thực hiện về cách<br>chúng tôi thu thập và sử dụng thông tin cá nhân của bạn. Chính
                sách bảo mật này được kết hợp vào và tuân theo Điều khoản sử dụng.</p>
            <br>
            <br>
            <p class="mainfont1 mainfont_bold"> Thông báo về quyền riêng tư của tiểu bang Hoa Kỳ và Thông báo thu thập của California: Quyền riêng tư của bạn
                đối với thông tin cá nhân của bạn là gì?</p>
            <br>
            <p class="mainfont1">California, Colorado, Connecticut, Tennessee, Texas, Utah và Virginia đã ban hành luật bảo vệ quyền riêng tư của người tiêu dùng
                cấp cho cư dân của họ<br>một số quyền nhất định và yêu cầu thêm các tiết lộ
                ("Luật bảo vệ quyền riêng tư của tiểu bang"). Những luật này hoặc đã có hiệu lực hoặc sẽ sớm có hiệu lực. Nếu bạn là<br>cư dân của một trong
                những tiểu bang này, phần này áp dụng cho bạn. Nếu bạn muốn nói chuyện với chúng tôi về bất kỳ quyền nào của bạn, vui lòng liên hệ với chúng tôi</p>
            <br>
            <br>
            <p class="mainfont1 mainfont_bold">QUYỀN RIÊNG TƯ </p>
            <p class="mainfont1">Theo một số ngoại lệ nhất định, bạn có quyền riêng tư dữ liệu theo Luật bảo vệ quyền riêng tư của tiểu bang,
                bao gồm quyền yêu cầu thông tin về <br>việc thu thập thông tin cá nhân của bạn bởi
                Những Đứa Trẻ Nhỏ, để truy cập thông tin cá nhân của bạn ở định dạng có thể chuyển đổi, và để sửa hoặc xóa<br>thông tin
                cá nhân của bạn.</p>
            <br>
            <p class="mainfont1">Quyền truy cập bao gồm thông tin về:</p>
            <br>
            <p class="mainfont1">Các danh mục thông tin cá nhân chúng tôi đã thu thập về bạn.<br>
                <br>Các danh mục nguồn thông tin cá nhân chúng tôi đã thu thập về bạn.<br>
                <br>Mục đích kinh doanh hoặc thương mại của chúng tôi để thu thập hoặc bán thông tin cá nhân đó.<br>
                <br>Các danh mục bên thứ ba mà chúng tôi đã tiết lộ hoặc bán thông tin cá nhân đó.<br><br>Các danh mục
                thông tin cá nhân chúng tôi đã tiết lộ hoặc bán cho mỗi danh mục bên thứ ba.<br>
                <br>Các mẩu thông tin cá nhân cụ thể chúng tôi đã thu thập về bạn.
            </p>
            <br>
            <br>
            <p class="mainfont1">Bạn cũng có thể yêu cầu truy cập (tính khả chuyển dữ liệu) vào dữ liệu cá nhân mà Những Đứa Trẻ Nhỏ đã thu thập và
                duy trì về bạn và, tùy thuộc vào một số ngoại lệ nhất định, <br>Những Đứa Trẻ Nhỏ sẽ cung cấp thông tin đó cho
                bạn thông qua một phương thức an toàn trong một định dạng điện tử thông dụng.</p>
            <br>
            <p class="mainfont1">Nếu bạn tin rằng chúng tôi lưu trữ thông tin không chính xác về bạn, chẳng hạn như tên hoặc địa chỉ của bạn,
                bạn có thể yêu cầu chúng tôi sửa điều này.</p>
            <br>
            <p class="mainfont1">Bạn cũng có quyền yêu cầu chúng tôi xóa bất kỳ thông tin cá nhân nào của bạn mà
                chúng tôi đã thu thập từ bạn và giữ lại, tùy thuộc vào<br>một số ngoại lệ nhất định.</p>
            <br>
            <p class="mainfont1">Chúng tôi không thể đáp ứng yêu cầu của bạn hoặc cung cấp cho bạn thông tin cá nhân nếu chúng tôi không thể
                xác minh danh tính hoặc thẩm quyền của bạn để thực hiện yêu cầu<br> và xác nhận thông tin cá nhân liên quan đến
                bạn. Việc thực hiện yêu cầu người tiêu dùng có thể xác minh không yêu cầu bạn tạo tài khoản với chúng tôi. <br>Chúng tôi sẽ chỉ
                sử dụng thông tin cá nhân được cung cấp trong yêu cầu người tiêu dùng có thể xác minh để xác minh danh tính của người yêu cầu hoặc
                thẩm quyền thực hiện yêu cầu.</p>
            <br>
            <p class="mainfont1">Bạn chỉ có thể thực hiện yêu cầu người tiêu dùng có thể xác minh để truy cập hoặc chuyển giao dữ liệu hai lần
                trong khoảng thời gian 12 tháng.</p>
            <br>
            <p class="mainfont1">Nếu chúng tôi từ chối yêu cầu của bạn để truy cập/chuyển giao, sửa chữa hoặc xóa thông tin cá nhân của bạn,
                bạn cũng có thể có quyền kháng cáo việc từ chối bất kỳ quyền nào trong số này <br>tùy thuộc vào tiểu bang cư trú của bạn bằng cách
                gửi một mẫu đơn sẽ được cung cấp cho bạn nếu chúng tôi từ chối yêu cầu của bạn. Tùy thuộc vào lựa chọn dữ liệu của bạn,
                <br>một số dịch vụ nhất định có thể bị hạn chế hoặc không khả dụng.
            </p>
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