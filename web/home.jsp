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
        <link rel="stylesheet" href="/css/styles.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/jpg" href="img/1.png" />
        <title>Tiny Tots - Trang Chá»§</title>
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
                            <input type="search" placeholder="Báº¡n Äang tÃ¬m gÃ¬?">
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
                                <p class="down">ChÃºng TÃ´i</p>
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
                            <p class="up">Giá»</p>
                            <p class="down">HÃ ng</p>
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
                            <p class="up">ÄÄng Nháº­p</p>
                            <p class="down">TÃ i Khoáº£n</p>
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
                                <p class="underline">Pháº£n há»i láº¡i chÃºng tÃ´i </p>
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
                                <p class="underline">LiÃªn Há» tá»i ChÃºng TÃ´i</p>
                            </a>
                        </div>
                    </div>
                </div>            
                <div class="headbtm_right">
                    <a href="" class="link-style">
                        <p class="underline">Trung TÃ¢m ChÄm SÃ³c Tráº»</p>
                    </a>
                    <a href="" class="link-style">
                        <p class="underline">Dá»ch Vá»¥ Há» Trá»£ Phá»¥ Huynh</p>
                    </a>
                    <a href="" class="link-style">
                        <p class="underline">ChÆ°Æ¡ng TrÃ¬nh Äáº·c Biá»t</p>
                    </a>
                    <a href="" class="link-style">
                        <p class="underline">ChÄm SÃ³c Kháº©n Cáº¥p</p>
                    </a>
                    <a href="" class="link-style">
                        <p class="underline">ChÄm SÃ³c Sau Giá» Há»c</p>
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
            TrÃ¬nh duyá»t cá»§a báº¡n khÃ´ng há» trá»£ tháº» video.
        </video>
        <div class="text-container">
            <h2>Hiá»u CÃ¡ch ChÄm SÃ³c Tráº»<br>ÄÆ°á»£c Quy Äá»nh Äá» Giá»¯ <br>An ToÃ n cho Tráº» Em</h2>
            <p>TÃ¬m hiá»u Ã½ nghÄ©a cá»§a viá»c má»t chÆ°Æ¡ng trÃ¬nh chÄm sÃ³c tráº» em ÄÆ°á»£c cáº¥p phÃ©p<br>vÃ  táº¡i sao Äiá»u ÄÃ³ quan trá»ng Äá» giá»¯ an toÃ n cho tráº» em.</p>
            <div class="header_top">
                <button onclick="window.location.href = ''" class="shop-now-btnget shop-now-btnfooter">TÃ¬m hiá»u thÃªm</button>
            </div>
        </div>
    </div>
</div>
<div>
    <p class="mainfont" id="rainbowText">Trung TÃ¢m ChÄm SÃ³c Tráº»: NuÃ´i DÆ°á»¡ng Sá»± PhÃ¡t Triá»n vÃ  TrÆ°á»ng ThÃ nh</p>
</div>
<div>
    <p class="mainfont1">Tá»ng quan vá» cÃ¡c trung tÃ¢m chÄm sÃ³c tráº», nÆ¡i tráº» em ÄÆ°á»£c chÄm sÃ³c, giÃ¡o dá»¥c vÃ  xÃ£ há»i hÃ³a trong má»t mÃ´i trÆ°á»ng an toÃ n vÃ  há» trá»£.</p>
    <div class="header_top">
        <button class="shop-now-btn shop-now-btn1" onclick="window.location.href = ''">Xem thÃªm</button>
    </div>
</div>
</div>
<div class="color-container">
    <div class="color1">
        <img class="bordered-image" src="img/cam1.jpg" alt="">
    </div>
    <div class="color1">
        <img class="bordered-image" src="img/cam2.jpg" alt="">
    </div>
    <div class="color1">
        <img class="bordered-image" src="img/cam3.jpg" alt="">
    </div>
</div>
<div class="video-text-container1">
    <div class="text-container1">
        <h2>Sá»©c máº¡nh cá»§a ngÆ°á»i chÄm sÃ³c tráº»</h2>
        <p>Gáº·p gá»¡ Sam, má»t ngÆ°á»i chÄm sÃ³c tráº» vÃ  nhÃ  giÃ¡o dá»¥c máº§m non táº­n tÃ¢m. CÃ´ chia sáº» vá» viá»c báº¯t Äáº§u cÃ´ng viá»c chÄm sÃ³c tráº» cá»§a mÃ¬nh thÃ´ng qua má»t cÆ¡ quan chÄm sÃ³c tráº» lÃ  má»t quÃ¡ trÃ¬nh ÄÆ¡n giáº£n ÄÃ£ ÄÆ°a cÃ´ vÃ o má»t cá»ng Äá»ng há» trá»£ - vÃ  cÃ´ khÃ´ng há» há»i tiáº¿c ká» tá»« ÄÃ³. Äá»c thÃªm trÃªn blog cá»§a chÃºng tÃ´i!</p>
    </div>
    <div class="video-container1">
        <video class="video1" width="1080" height="auto" autoplay muted loop>
            <source src="Videos/2campaign.mp4" type="video/mp4">
            TrÃ¬nh duyá»t cá»§a báº¡n khÃ´ng há» trá»£ tháº» video.
        </video>
    </div>
</div>
<div class="square-container">
    <div class="square-text-box">
        <p class="member-text">KhÃ¡m PhÃ¡ ChÆ°Æ¡ng TrÃ¬nh Äáº·c Biá»t Má»i cá»§a ChÃºng TÃ´i cho ChÄm SÃ³c Tráº»</p>
    </div>
</div>
<div>
    <p class="member-text1">KhÃ¡m phÃ¡ cÃ¡c chÆ°Æ¡ng trÃ¬nh Äáº·c biá»t má»i ÄÆ°á»£c thiáº¿t káº¿ Äá» nÃ¢ng cao sá»± phÃ¡t triá»n cá»§a tráº» nhá». Tá»« nghá» thuáº­t sÃ¡ng táº¡o Äáº¿n cÃ¡c hoáº¡t Äá»ng STEM, nhá»¯ng chÆ°Æ¡ng trÃ¬nh<br>ÄÆ°á»£c Äiá»u chá»nh nÃ y mang Äáº¿n nhá»¯ng tráº£i nghiá»m há»c táº­p Äá»c ÄÃ¡o nuÃ´i dÆ°á»¡ng sá»± tÃ² mÃ², sÃ¡ng táº¡o vÃ  phÃ¡t triá»n á» má»i tráº» em.</p>
    <div class="header_top">
        <button class="shop-now-btn shop-now-btn-second" onclick="window.location.href = ''">Kiá»m Tra Ngay</button>
    </div>
</div>
<div class="video-text-container">
    <div class="video-container">
        <video class="video1" width="1080" height="auto" autoplay muted loop>
            <source src="Videos/4campaign.mp4" type="video/mp4">
            TrÃ¬nh duyá»t cá»§a báº¡n khÃ´ng há» trá»£ tháº» video.
        </video>
        <div class="text-container">
            <h2>Há»£p TÃ¡c ThÃº Vá» vá»i BayCare</h2>
            <p>ChÃºng tÃ´i ráº¥t vui má»«ng thÃ´ng bÃ¡o vá» sá»± há»£p tÃ¡c cá»§a chÃºng tÃ´i vá»i BayCare,<br>mang Äáº¿n cÃ¡c bÃ¡c sÄ© vÃ  y tÃ¡ chuyÃªn dá»¥ng Äá» há» trá»£ sá»©c khá»e <br>vÃ  sá»± khá»e máº¡nh cá»§a tráº» em trong sá»± chÄm sÃ³c cá»§a chÃºng tÃ´i. CÃ¹ng nhau, chÃºng tÃ´i Äang táº¡o ra<br>má»t mÃ´i trÆ°á»ng an toÃ n vÃ  khá»e máº¡nh hÆ¡n cho má»i tráº» em.</p>
            <div class="header_top">
                <button class="shop-now-btnget shop-now-btnfooter">Kiá»m Tra Trung TÃ¢m ChÄm SÃ³c Tráº»</button>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<div class="flex-container">
    
    <div class="flex-box">
        <p class="center-text underline">
            Danh SÃ¡ch cÃ¡c Dá»ch Vá»¥</p>
        <button class="shop-now-btn shop-now-btn-third" onclick="window.location.href = 'homepageserviceslist'">Xem Ngay</button>
    </div>
    <div class="flex-box">
        <p class="center-text underline">Dá»ch Vá»¥ Há» Trá»£ Phá»¥ Huynh </p>
        <button class="rounded-arrow-btn">
            <span class="material-symbols-outlined">
                arrow_right_alt
            </span>
        </button>
    </div>
    <div class="flex-box">
        <p class="center-text underline">ChÆ°Æ¡ng TrÃ¬nh Äáº·c Biá»t</p>
        <button class="rounded-arrow-btn">
            <span class="material-symbols-outlined">
                arrow_right_alt
            </span>
        </button>
    </div>
    <div class="flex-box">
        <p class="center-text underline">ChÄm SÃ³c Kháº©n Cáº¥p</p>
        <button class="rounded-arrow-btn">
            <span class="material-symbols-outlined">
                arrow_right_alt
            </span>
        </button>
    </div>
    <div class="flex-box">
        <p class="center-text underline">ChÄm SÃ³c Sau Giá» Há»c</p>
        <button class="rounded-arrow-btn">
            <span class="material-symbols-outlined">
                arrow_right_alt
            </span>
        </button>
    </div>
    <div class="flex-box">
        <p class="center-text underline">Giá» HÃ ng</p>
        <button class="rounded-arrow-btn">
            <span class="material-symbols-outlined">
                arrow_right_alt
            </span>
        </button>
    </div>
    <div class="flex-box">
        <p class="center-text underline">Pháº£n Há»i</p>
        <button class="rounded-arrow-btn">
            <span class="material-symbols-outlined">
                arrow_right_alt
            </span>
        </button>
    </div>
</div>
<div>
    <p class="mainfont">ChÃ o má»«ng Äáº¿n vá»i BÃ© Nhá» â Äá»i TÃ¡c ÄÃ¡ng Tin Cáº­y cá»§a Báº¡n trong ChÄm SÃ³c Tráº»!</p>
</div>
<div>
    <p class="mainfont1">Táº¡i BÃ© Nhá», chÃºng tÃ´i cung cáº¥p má»t loáº¡t cÃ¡c dá»ch vá»¥ chÄm sÃ³c tráº» xuáº¥t sáº¯c ÄÆ°á»£c thiáº¿t káº¿ Äá» ÄÃ¡p á»©ng nhu cáº§u cá»§a má»i gia ÄÃ¬nh.<br>Má»¥c tiÃªu cá»§a chÃºng tÃ´i lÃ  táº¡o ra má»t mÃ´i trÆ°á»ng nuÃ´i dÆ°á»¡ng, an toÃ n vÃ  kÃ­ch thÃ­ch nÆ¡i tráº» em cÃ³ thá» há»c há»i, phÃ¡t triá»n vÃ  thá»nh vÆ°á»£ng.</p>
    <br>
</div>
<div>
    <p class="mainfont">Trung TÃ¢m ChÄm SÃ³c Tráº»</p>
</div>
<div>
    <p class="mainfont1">CÃ¡c trung tÃ¢m chÄm sÃ³c tráº» cá»§a BÃ© Nhá» cung cáº¥p cÃ¡c lá»±a chá»n chÄm sÃ³c toÃ n thá»i gian vÃ  bÃ¡n thá»i gian. Vá»i trá»ng tÃ¢m vÃ o sá»± phÃ¡t triá»n cá»§a tráº» nhá», <br>cÃ¡c trung tÃ¢m cá»§a chÃºng tÃ´i cung cáº¥p má»t thá»i gian biá»u cÃ³ cáº¥u trÃºc Äáº§y cÃ¡c hoáº¡t Äá»ng giÃ¡o dá»¥c vÃ  vui chÆ¡i, bao gá»m ká» chuyá»n, chÆ¡i sÃ¡ng táº¡o <br>vÃ  cÃ¡c buá»i há»c táº­p sá»m. CÃ¡c bá»¯a Än vÃ  Äá» Än nháº¹ lÃ nh máº¡nh cÅ©ng ÄÆ°á»£c cung cáº¥p Äá» há» trá»£ sá»©c khá»e tá»ng thá» <br>cá»§a con báº¡n.</p>
    <br>
</div>
<div>
    <p class="mainfont">Dá»ch Vá»¥ Há» Trá»£ Phá»¥ Huynh</p>
    <p class="mainfont1">ChÃºng tÃ´i tin vÃ o viá»c há» trá»£ khÃ´ng chá» tráº» em mÃ  cÃ²n cáº£ gia ÄÃ¬nh. CÃ¡c dá»ch vá»¥ há» trá»£ phá»¥ huynh cá»§a chÃºng tÃ´i bao gá»m cÃ¡c há»i tháº£o, <br>cÃ¡c buá»i ÄÃ o táº¡o vÃ  cÃ¡c nhÃ³m há» trá»£ ÄÆ°á»£c thiáº¿t káº¿ Äá» giÃºp phá»¥ huynh vÆ°á»£t qua cÃ¡c thÃ¡ch thá»©c cá»§a viá»c nuÃ´i dáº¡y con cÃ¡i. ChÃºng tÃ´i cung cáº¥p <br>cÃ¡c nguá»n tÃ i nguyÃªn quÃ½ giÃ¡ vá» sá»± phÃ¡t triá»n cá»§a tráº» em, quáº£n lÃ½ gia ÄÃ¬nh vÃ  nhiá»u hÆ¡n ná»¯a.</p>
</div>
<div>
    <p class="mainfont">ChÆ°Æ¡ng TrÃ¬nh Äáº·c Biá»t</p>
    <p class="mainfont1">BÃ© Nhá» cung cáº¥p cÃ¡c chÆ°Æ¡ng trÃ¬nh Äáº·c biá»t ÄÆ°á»£c thiáº¿t káº¿ Äá» ÄÃ¡p á»©ng nhu cáº§u cá»§a má»i tráº» em. Äiá»u nÃ y bao gá»m cÃ¡c chÆ°Æ¡ng trÃ¬nh cho tráº» em <br>cÃ³ nhu cáº§u Äáº·c biá»t, chÆ°Æ¡ng trÃ¬nh ngÃ´n ngá»¯, vÃ  cÃ¡c phÆ°Æ¡ng phÃ¡p giÃ¡o dá»¥c Äá»c ÄÃ¡o nhÆ° Montessori vÃ  Waldorf. ChÃºng tÃ´i <br>cÅ©ng cung cáº¥p cÃ¡c tráº¡i hÃ¨ theo mÃ¹a vÃ  chÄm sÃ³c trong ká»³ nghá» Äá» giá»¯ cho con báº¡n luÃ´n tham gia vÃ  há»c há»i suá»t nÄm.</p>
</div>
<div>
    <p class="mainfont">ChÄm SÃ³c Kháº©n Cáº¥p</p>
    <p class="mainfont1">Äá»i vá»i phá»¥ huynh cáº§n cÃ¡c lá»±a chá»n chÄm sÃ³c tráº» linh hoáº¡t, BÃ© Nhá» cung cáº¥p dá»ch vá»¥ chÄm sÃ³c Äá»t xuáº¥t hoáº·c kháº©n cáº¥p. Dá»ch vá»¥ nÃ y <br>hoÃ n háº£o cho nhá»¯ng khoáº£nh kháº¯c báº¥t ngá» khi báº¡n cáº§n chÄm sÃ³c tráº» trong thá»i gian ngáº¯n. Äá»i ngÅ© nhÃ¢n viÃªn cÃ³ kinh nghiá»m cá»§a chÃºng tÃ´i sáºµn sÃ ng <br>cung cáº¥p dá»ch vá»¥ chÄm sÃ³c theo giá» hoáº·c theo ngÃ y, Äáº£m báº£o con báº¡n an toÃ n vÃ  háº¡nh phÃºc.</p>
</div>
</div>
</div>
<button id="backToTop" title="LÃªn Äáº§u trang">
    <span class="material-symbols-outlined" style="font-size: 12px;" color="white">
        arrow_upward
    </span>
    <span class="back-to-top-text">LÃªn Äáº§u trang</span>
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