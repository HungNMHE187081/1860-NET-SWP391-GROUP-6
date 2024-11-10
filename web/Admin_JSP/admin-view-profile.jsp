<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.Users"%>
<%@page import="model.UserAddresses"%>
<%@page import="model.Provinces"%>
<%@page import="model.District"%>
<%@page import="model.Ward"%>
<%
    Users adminDetails = (Users) request.getAttribute("adminDetails");
    UserAddresses address = adminDetails.getAddress();
    Provinces province = address.getProvinces();
    District district = address.getDistrict();
    Ward ward = address.getWard();
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Profile</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manager/main.css">
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
            }

            .profile-wrapper {
                max-width: 1200px;
                margin: 0 auto;
                padding: 24px;
                animation: fadeIn 0.6s var(--transition-timing);
            }

            .profile-header {
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                color: white;
                padding: 32px;
                text-align: center;
                position: relative;
                overflow: hidden;
                border-radius: var(--border-radius);
                margin-bottom: 24px;
            }

            .profile-header::before {
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

            .user-name {
                font-size: 28px;
                font-weight: 700;
                margin-bottom: 8px;
                position: relative;
            }

            .user-title {
                font-size: 18px;
                opacity: 0.9;
                position: relative;
            }

            .profile-content {
                display: flex;
                flex-wrap: wrap;
                gap: 24px;
            }

            .profile-sidebar {
                flex: 1;
                min-width: 300px;
                max-width: 350px;
            }

            .profile-image-card {
                background-color: var(--card-background);
                border-radius: var(--border-radius);
                padding: 24px;
                text-align: center;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            }

            .profile-image {
                width: 200px;
                height: 200px;
                border-radius: 50%;
                object-fit: cover;
                border: 4px solid white;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                transition: transform 0.3s var(--transition-timing);
            }

            .profile-image:hover {
                transform: scale(1.05);
            }

            .contact-info {
                margin: 20px 0;
            }

            .contact-item {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 12px;
                padding: 8px;
                border-radius: 8px;
                transition: background-color 0.3s var(--transition-timing);
            }

            .contact-item:hover {
                background-color: #f1f5f9;
            }

            .contact-item i {
                margin-right: 12px;
                color: var(--primary-color);
                font-size: 18px;
            }

            .edit-button {
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

            .edit-button:hover {
                background-color: var(--secondary-color);
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2);
                color: white;
                text-decoration: none;
            }

            .profile-main {
                flex: 2;
                min-width: 300px;
            }

            .profile-card {
                background-color: var(--card-background);
                border-radius: var(--border-radius);
                padding: 24px;
                margin-bottom: 24px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s var(--transition-timing);
                animation: slideUp 0.5s var(--transition-timing);
            }

            .profile-card:hover {
                transform: translateY(-4px);
            }

            .card-title {
                font-size: 20px;
                font-weight: 600;
                margin-bottom: 20px;
                color: var(--primary-color);
                display: flex;
                align-items: center;
                gap: 12px;
            }

            .info-row {
                display: flex;
                margin-bottom: 16px;
                padding: 8px;
                border-radius: 8px;
                transition: background-color 0.3s var(--transition-timing);
            }

            .info-row:hover {
                background-color: #f1f5f9;
            }

            .info-label {
                flex: 0 0 150px;
                font-weight: 500;
                color: #64748b;
            }

            .info-value {
                flex: 1;
                color: #0f172a;
            }

            /* Animations */
            @keyframes fadeIn {
                from { opacity: 0; }
                to { opacity: 1; }
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
                from { background-position: 0 0; }
                to { background-position: 1000px 0; }
            }

            @media (max-width: 768px) {
                .profile-content {
                    flex-direction: column;
                }

                .profile-sidebar {
                    max-width: 100%;
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
        <%@ include file="dashboardleft.jsp" %>

        <main class="app-content">
            <div class="profile-wrapper">
                <div class="profile-header">
                    <div class="user-name">
                        <%= adminDetails.getFirstName() %> <%= adminDetails.getMiddleName() %> <%= adminDetails.getLastName() %>
                    </div>
                    <div class="user-title">Thông tin cá nhân</div>
                </div>

                <div class="profile-content">
                    <div class="profile-sidebar">
                        <div class="profile-image-card">
                            <img src="${pageContext.request.contextPath}/${adminDetails.profileImage}" 
                                 alt="Profile Image" 
                                 class="profile-image">
                            <div class="contact-info">
                                <div class="contact-item">
                                    <i class="fas fa-envelope"></i>
                                    <span><%= adminDetails.getEmail() %></span>
                                </div>
                                <div class="contact-item">
                                    <i class="fas fa-phone"></i>
                                    <span><%= adminDetails.getPhoneNumber() %></span>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/admin/editprofile" 
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
                                <div class="info-value"><%= adminDetails.getDateOfBirth() %></div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Giới tính</div>
                                <div class="info-value"><%= adminDetails.getGender() %></div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">CCCD/CMND</div>
                                <div class="info-value"><%= adminDetails.getCitizenIdentification() %></div>
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