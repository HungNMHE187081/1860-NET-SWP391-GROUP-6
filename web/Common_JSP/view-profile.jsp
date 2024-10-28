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
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <title>View Profile</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <style>
            :root {
                --primary-color: #4e73df;
                --secondary-color: #858796;
                --success-color: #1cc88a;
                --gradient-1: linear-gradient(135deg, #6B73FF 0%, #000DFF 100%);
                --gradient-2: linear-gradient(135deg, #97ABFF 10%, #123597 100%);
            }

            .profile-wrapper {
                padding: 2rem;
                background-color: #f8f9fc;
                min-height: calc(100vh - 60px);
            }

            .profile-header {
                background: var(--gradient-1);
                border-radius: 15px;
                padding: 3rem 2rem;
                color: white;
                margin-bottom: 2rem;
                position: relative;
                overflow: hidden;
            }

            .profile-header::before {
                content: '';
                position: absolute;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200"><path fill="%23FFFFFF20" d="M 0 0 L 200 0 L 200 200 Z"/></svg>');
                opacity: 0.1;
            }

            .profile-content {
                display: flex;
                gap: 2rem;
            }

            .profile-sidebar {
                flex: 0 0 300px;
            }

            .profile-main {
                flex: 1;
            }

            .profile-image-card {
                background: white;
                border-radius: 15px;
                padding: 1.5rem;
                text-align: center;
                box-shadow: 0 0.15rem 1.75rem rgba(33, 40, 50, 0.15);
                margin-top: -100px;
                position: relative;
            }

            .profile-image {
                width: 200px;
                height: 200px;
                border-radius: 50%;
                border: 5px solid white;
                box-shadow: 0 0 20px rgba(0,0,0,0.15);
                margin-bottom: 1.5rem;
                object-fit: cover;
            }

            .profile-card {
                background: white;
                border-radius: 15px;
                padding: 1.5rem;
                box-shadow: 0 0.15rem 1.75rem rgba(33, 40, 50, 0.15);
                margin-bottom: 1.5rem;
            }

            .card-title {
                font-size: 1.1rem;
                font-weight: 600;
                color: var(--primary-color);
                margin-bottom: 1.5rem;
                padding-bottom: 0.5rem;
                border-bottom: 2px solid #e3e6f0;
            }

            .info-row {
                display: flex;
                margin-bottom: 1rem;
                padding: 0.5rem 0;
                border-bottom: 1px solid #f8f9fc;
            }

            .info-label {
                flex: 0 0 150px;
                font-weight: 600;
                color: var(--secondary-color);
            }

            .info-value {
                flex: 1;
                color: #5a5c69;
            }

            .contact-info {
                display: flex;
                flex-direction: column;
                gap: 0.5rem;
                margin-top: 1rem;
            }

            .contact-item {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                color: #5a5c69;
            }

            .contact-item i {
                width: 20px;
                color: var(--primary-color);
            }

            .edit-button {
                display: inline-block;
                padding: 0.75rem 1.5rem;
                background: var(--gradient-2);
                color: white;
                border-radius: 50px;
                text-decoration: none;
                transition: all 0.3s ease;
                border: none;
                cursor: pointer;
                box-shadow: 0 4px 15px rgba(0,0,0,0.2);
                margin-top: 1rem;
                text-align: center;
            }

            .edit-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(0,0,0,0.25);
                color: white;
                text-decoration: none;
            }

            .user-name {
                font-size: 2.5rem;
                font-weight: 700;
                margin-bottom: 0.5rem;
                text-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .user-title {
                font-size: 1.1rem;
                opacity: 0.9;
            }

            @media (max-width: 992px) {
                .profile-content {
                    flex-direction: column;
                }

                .profile-sidebar {
                    flex: 0 0 auto;
                }

                .profile-image-card {
                    margin-top: 0;
                }

                .profile-header {
                    padding: 2rem 1.5rem;
                }
            }
        </style>
    </head>

    <body class="app sidebar-mini rtl">

        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">
                <!-- User Menu-->
                <li><a class="app-nav__item" href="/index.html"><i class='bx bx-log-out bx-rotate-180'></i> </a></li>
            </ul>
        </header>

        <%@ include file="/Common_JSP/dashboardtop.jsp" %>

        <main class="app-content">
            <div class="profile-wrapper">
                <div class="profile-header">
                    <div class="user-name">
                        <%= userDetails.getFirstName() %> <%= userDetails.getMiddleName() %> <%= userDetails.getLastName() %>
                    </div>
                    <div class="user-title">Thông tin cá nhân</div>
                </div>

                <div class="profile-content">
                    <div class="profile-sidebar">
                        <div class="profile-image-card">
                            <img src="${pageContext.request.contextPath}/${userDetails.profileImage}" 
                                 alt="Profile Image" 
                                 class="profile-image">
                            <div class="contact-info">
                                <div class="contact-item">
                                    <i class="fas fa-envelope"></i>
                                    <span><%= userDetails.getEmail() %></span>
                                </div>
                                <div class="contact-item">
                                    <i class="fas fa-phone"></i>
                                    <span><%= userDetails.getPhoneNumber() %></span>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/customer/editprofile" 
                               class="edit-button">
                                <i class="fas fa-edit mr-2"></i>Chỉnh sửa hồ sơ
                            </a>
                        </div>
                    </div>

                    <div class="profile-main">
                        <div class="profile-card">
                            <div class="card-title">
                                <i class="fas fa-user mr-2"></i>Thông tin cơ bản
                            </div>
                            <div class="info-row">
                                <div class="info-label">Ngày sinh</div>
                                <div class="info-value"><%= userDetails.getDateOfBirth() %></div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Giới tính</div>
                                <div class="info-value"><%= userDetails.getGender() %></div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">CCCD/CMND</div>
                                <div class="info-value"><%= userDetails.getCitizenIdentification() %></div>
                            </div>
                        </div>

                        <div class="profile-card">
                            <div class="card-title">
                                <i class="fas fa-map-marker-alt mr-2"></i>Thông tin địa chỉ
                            </div>
                            <div class="info-row">
                                <div class="info-label">Địa chỉ</div>
                                <div class="info-value">
                                    <%= address.getStreetAddress() %>
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Phường/Xã</div>
                                <div class="info-value"><%= ward.getWardName() %></div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Quận/Huyện</div>
                                <div class="info-value"><%= district.getDistrictName() %></div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Tỉnh/Thành phố</div>
                                <div class="info-value"><%= province.getProvinceName() %></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Essential javascripts for application to work-->
        <script src="${pageContext.request.contextPath}/js/manager/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>
    </body>

</html>