<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Users"%>
<%@page import="model.UserAddresses"%>
<%@page import="model.Provinces"%>
<%@page import="model.District"%>
<%@page import="model.Ward"%>
<%
    Users userDetails = (Users) request.getAttribute("userDetails");
    UserAddresses address = userDetails.getAddress();
    Provinces province = address.getProvinces();
    District district = address.getDistrict();
    Ward ward = address.getWard();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../homepage.jsp" />
        <meta name="Version" content="v1.2.0" />
        <link rel="shortcut icon" href="../images/favicon.ico.png">
        <!-- favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Icons -->
        <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/remixicon.css" rel="stylesheet" type="text/css"/>
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- SLIDER -->
        <link href="${pageContext.request.contextPath}/css/tiny-slider.css" rel="stylesheet" type="text/css"/>
        <!-- Css -->
        <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/flatpickr.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/remixicon.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/select2.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/simplebar.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/slick-theme.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/slick.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/tiny-slider.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=ecg_heart" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://unpkg.com/@phosphor-icons/web@2.0.3/src/regular/style.css" rel="stylesheet">
    </head>
    <style>
  :root {
    --primary-color: #2563eb;
    --secondary-color: #1e40af;
    --background-color: #f8fafc;
    --card-background: #ffffff;
    --text-color: #1e293b;
    --border-radius: 16px;
    --transition-timing: cubic-bezier(0.4, 0, 0.2, 1);
}

body {
    font-family: 'Inter', system-ui, -apple-system, sans-serif;
    background-color: var(--background-color);
    color: var(--text-color);
    line-height: 1.6;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 24px;
    animation: fadeIn 0.6s var(--transition-timing);
}

.profile {
    background-color: var(--card-background);
    border-radius: var(--border-radius);
    box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
    overflow: hidden;
    transform-origin: top;
    animation: slideDown 0.5s var(--transition-timing);
}

.profile__header {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    color: white;
    padding: 32px;
    text-align: center;
    position: relative;
    overflow: hidden;
}

.profile__header::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(45deg, rgba(255,255,255,0.1) 25%, transparent 25%),
                linear-gradient(-45deg, rgba(255,255,255,0.1) 25%, transparent 25%);
    background-size: 60px 60px;
    animation: headerPattern 60s linear infinite;
}

.profile__name {
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 8px;
    position: relative;
}

.profile__title {
    font-size: 18px;
    opacity: 0.9;
    position: relative;
}

.profile__content {
    display: flex;
    flex-wrap: wrap;
    gap: 24px;
    padding: 24px;
}

.profile__sidebar {
    flex: 1;
    min-width: 280px;
}

.profile__image-card {
    background-color: var(--card-background);
    border-radius: var(--border-radius);
    padding: 24px;
    text-align: center;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s var(--transition-timing);
}

.profile__image-card:hover {
    transform: translateY(-4px);
}

.profile__image {
    width: 160px;
    height: 160px;
    border-radius: 50%;
    object-fit: cover;
    margin-bottom: 20px;
    border: 4px solid white;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s var(--transition-timing);
}

.profile__image:hover {
    transform: scale(1.05);
}

.profile__contact-info {
    margin: 20px 0;
}

.profile__contact-item {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 12px;
    padding: 8px;
    border-radius: 8px;
    transition: background-color 0.3s var(--transition-timing);
}

.profile__contact-item:hover {
    background-color: #f1f5f9;
}

.profile__contact-item i {
    margin-right: 12px;
    color: var(--primary-color);
    font-size: 18px;
}

.profile__edit-button {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background-color: var(--primary-color);
    color: white;
    padding: 12px 20px;
    border-radius: 12px;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.3s var(--transition-timing);
}

.profile__edit-button:hover {
    background-color: var(--secondary-color);
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2);
}

.profile__main {
    flex: 2;
    min-width: 300px;
}

.profile__card {
    background-color: var(--card-background);
    border-radius: var(--border-radius);
    padding: 24px;
    margin-bottom: 24px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s var(--transition-timing);
    animation: slideUp 0.5s var(--transition-timing);
}

.profile__card:hover {
    transform: translateY(-4px);
}

.profile__card-title {
    font-size: 20px;
    font-weight: 600;
    margin-bottom: 20px;
    color: var(--primary-color);
    display: flex;
    align-items: center;
    gap: 12px;
}

.profile__info-row {
    display: flex;
    margin-bottom: 16px;
    padding: 8px;
    border-radius: 8px;
    transition: background-color 0.3s var(--transition-timing);
}

.profile__info-row:hover {
    background-color: #f1f5f9;
}

.profile__info-label {
    flex: 0 0 150px;
    font-weight: 500;
    color: #64748b;
}

.profile__info-value {
    flex: 1;
    color: #0f172a;
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

@keyframes slideDown {
    from {
        transform: translateY(-20px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

@keyframes slideUp {
    from {
        transform: translateY(20px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

@keyframes headerPattern {
    from {
        background-position: 0 0;
    }
    to {
        background-position: 1000px 0;
    }
}

@media (max-width: 768px) {
    .profile__content {
        flex-direction: column;
    }

    .profile__sidebar {
        margin-right: 0;
        margin-bottom: 24px;
    }

    .container {
        padding: 16px;
    }
}
</style>
</head>
    <%@ include file="/Common_JSP/dashboardtop.jsp" %>
    <br>
     <br>
      <br>
       <br>
<body>
    <div class="container">
        <main class="profile">
            <div class="profile__header">
                <div class="profile__name">
                    <%= userDetails.getFirstName() %> <%= userDetails.getMiddleName() %> <%= userDetails.getLastName() %>
                </div>
                <div class="profile__title">Thông tin cá nhân</div>
            </div>

            <div class="profile__content">
    <div class="profile__sidebar">
        <div class="profile__image-card">
            <div class="profile__image-container">
                <img src="${pageContext.request.contextPath}/${userDetails.profileImage}" 
                     alt="Ảnh đại diện" 
                     class="profile__image">
                <div class="profile__image-overlay">
   
                </div>
            </div>
            <div class="profile__contact-info">
                <div class="profile__contact-item" data-tooltip="Email">
                    <i class="fas fa-envelope"></i>
                    <span><%= userDetails.getEmail() %></span>
                </div>
                <div class="profile__contact-item" data-tooltip="Điện thoại">
                    <i class="fas fa-phone"></i>
                    <span><%= userDetails.getPhoneNumber() %></span>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/customer/editprofile" 
               class="profile__edit-button">
                <i class="fas fa-edit"></i> Chỉnh sửa hồ sơ
            </a>
        </div>
                <div class="profile__main">
                    <div class="profile__card">
                        <div class="profile__card-title">
                            <i class="fas fa-user"></i>Thông tin cơ bản
                        </div>
                        <div class="profile__info-row">
                            <div class="profile__info-label">Ngày sinh</div>
                            <div class="profile__info-value"><%= userDetails.getDateOfBirth() %></div>
                        </div>
                        <div class="profile__info-row">
                            <div class="profile__info-label">Giới tính</div>
                            <div class="profile__info-value">
                              <%= userDetails.getGender().equals("Male") ? "Nam" : (userDetails.getGender().equals("Female") ? "Nữ" : "Khác") %>

                            </div>
                        </div>
                        <div class="profile__info-row">
                            <div class="profile__info-label">CCCD/CMND</div>
                            <div class="profile__info-value"><%= userDetails.getCitizenIdentification() %></div>
                        </div>
                    </div>

                    <div class="profile__card">
                        <div class="profile__card-title">
                            <i class="fas fa-map-marker-alt"></i>Thông tin địa chỉ
                        </div>
                        <div class="profile__info-row">
                            <div class="profile__info-label">Địa chỉ</div>
                            <div class="profile__info-value">
                                <%= address.getStreetAddress() %>
                            </div>
                        </div>
                        <div class="profile__info-row">
                            <div class="profile__info-label">Phường/Xã</div>
                            <div class="profile__info-value"><%= ward.getWardName() %></div>
                        </div>
                        <div class="profile__info-row">
                            <div class="profile__info-label">Quận/Huyện</div>
                            <div class="profile__info-value"><%= district.getDistrictName() %></div>
                        </div>
                        <div class="profile__info-row">
                            <div class="profile__info-label">Tỉnh/Thành phố</div>
                            <div class="profile__info-value"><%= province.getProvinceName() %></div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
