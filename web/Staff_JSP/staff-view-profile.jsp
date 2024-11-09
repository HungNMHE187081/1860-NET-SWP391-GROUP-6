<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Users" %>
<%@page import="model.UserAddresses" %>
<%@page import="model.Provinces" %>
<%@page import="model.District" %>
<%@page import="model.Ward" %>
<%@page import="model.Degree" %>
<%@page import="model.Specialization" %>
<%@page import="java.util.List" %>
<% Users userDetails=(Users) request.getAttribute("userDetails"); UserAddresses
    address=userDetails.getAddress(); Provinces province=address.getProvinces();
    District district=address.getDistrict(); Ward ward=address.getWard();
    List<Degree> degrees = (List<Degree>) request.getAttribute("degrees");
        List<Specialization> specializations = (List<Specialization>)
                request.getAttribute("specializations");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0">
        <title>View Profile</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/remixicon.css" rel="stylesheet" type="text/css"/>
        <style>
            :root {
                --primary-color: #2563eb;
                --secondary-color: #1e40af;
                --background-color: #f8fafc;
                --card-background: #ffffff;
                --text-color: #1e293b;
                --border-radius: 16px;
                --transition-timing: cubic-bezier(0.4, 0, 0.2, 1);
                --gradient-1: linear-gradient(135deg, #6B73FF 0%, #000DFF 100%);
                --gradient-2: linear-gradient(135deg, #97ABFF 10%, #123597 100%);
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
                padding: 2rem;
                box-shadow: 0 0.15rem 1.75rem rgba(33, 40, 50, 0.15);
                margin-bottom: 1.5rem;
            }

            .profile__header {
                background: var(--gradient-1);
                border-radius: 15px;
                padding: 3rem 2rem;
                color: white;
                margin-bottom: 2rem;
                position: relative;
                overflow: hidden;
            }

            .profile__name {
                font-size: 2.5rem;
                font-weight: 700;
                margin-bottom: 0.5rem;
                color: white;
            }

            .profile__title {
                font-size: 1.1rem;
                opacity: 0.9;
                color: white;
            }

            .profile__content {
                display: flex;
                gap: 2rem;
            }

            .profile__sidebar {
                flex: 0 0 300px;
            }

            .profile__main {
                flex: 1;
            }

            .profile__image-card {
                background: white;
                border-radius: 15px;
                padding: 1.5rem;
                text-align: center;
                box-shadow: 0 0.15rem 1.75rem rgba(33, 40, 50, 0.15);
                margin-top: -100px;
                position: relative;
            }

            .profile__image-container {
                position: relative;
                margin-bottom: 1.5rem;
            }

            .profile__image {
                width: 200px;
                height: 200px;
                border-radius: 50%;
                border: 5px solid white;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
                margin-bottom: 1.5rem;
                object-fit: cover;
            }

            .profile__card {
                background: white;
                border-radius: 15px;
                padding: 1.5rem;
                box-shadow: 0 0.15rem 1.75rem rgba(33, 40, 50, 0.15);
                margin-bottom: 1.5rem;
            }

            .profile__card-title {
                font-size: 1.1rem;
                font-weight: 600;
                color: var(--primary-color);
                margin-bottom: 1.5rem;
                padding-bottom: 0.5rem;
                border-bottom: 2px solid #e3e6f0;
            }

            .profile__info-row {
                display: flex;
                margin-bottom: 1rem;
                padding: 0.5rem 0;
                border-bottom: 1px solid #f8f9fc;
            }

            .profile__info-label {
                flex: 0 0 150px;
                font-weight: 600;
                color: var(--secondary-color);
            }

            .profile__info-value {
                flex: 1;
                color: #5a5c69;
            }

            .profile__contact-info {
                display: flex;
                flex-direction: column;
                gap: 0.5rem;
                margin-top: 1rem;
            }

            .profile__contact-item {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                color: #5a5c69;
            }

            .profile__contact-item i {
                width: 20px;
                color: var(--primary-color);
            }

            .profile__edit-button {
                display: inline-block;
                padding: 0.75rem 1.5rem;
                background: var(--gradient-2);
                color: white;
                border-radius: 50px;
                text-decoration: none;
                transition: all 0.3s ease;
                border: none;
                cursor: pointer;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
                margin-top: 1rem;
                text-align: center;
            }

            .profile__edit-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
                color: white;
                text-decoration: none;
            }

            .profile__user-name {
                font-size: 2.5rem;
                font-weight: 700;
                margin-bottom: 0.5rem;
                text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .profile__user-title {
                font-size: 1.1rem;
                opacity: 0.9;
            }

            @media (max-width: 992px) {
                .profile__content {
                    flex-direction: column;
                }

                .profile__sidebar {
                    flex: 0 0 auto;
                }

                .profile__image-card {
                    margin-top: 0;
                }

                .profile__header {
                    padding: 2rem 1.5rem;
                }
            }
        </style>
    </head>

    <body class="app sidebar-mini rtl">

        <%@ include file="dashboardtop.jsp" %>

        <div class="container">
            <main class="profile">
                <div class="profile__header">
                    <div class="profile__name">
                        <%= userDetails.getFirstName() %>
                        <%= userDetails.getMiddleName() %>
                        <%= userDetails.getLastName() %>
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
                                <div class="profile__image-overlay"></div>
                            </div>
                            <div class="profile__contact-info">
                                <div class="profile__contact-item">
                                    <i class="fas fa-envelope"></i>
                                    <span>
                                        <%= userDetails.getEmail()
                                        %>
                                    </span>
                                </div>
                                <div class="profile__contact-item">
                                    <i class="fas fa-phone"></i>
                                    <span>
                                        <%= userDetails.getPhoneNumber()
                                        %>
                                    </span>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/staff/editprofile"
                               class="profile__edit-button">
                                <i
                                    class="fas fa-edit mr-2"></i>Chỉnh
                                sửa hồ sơ
                            </a>
                        </div>
                    </div>

                    <div class="profile__main">
                        <div class="profile__card">
                            <div class="profile__card-title">
                                <i
                                    class="fas fa-user mr-2"></i>Thông
                                tin cơ bản
                            </div>
                            <div class="profile__info-row">
                                <div class="profile__info-label">Ngày sinh
                                </div>
                                <div class="profile__info-value">
                                    <%= userDetails.getDateOfBirth()
                                    %>
                                </div>
                            </div>
                            <div class="profile__info-row">
                                <div class="profile__info-label">Giới tính
                                </div>
                                <div class="profile__info-value">
                                    <%= userDetails.getGender() %>
                                </div>
                            </div>
                            <div class="profile__info-row">
                                <div class="profile__info-label">CCCD/CMND
                                </div>
                                <div class="profile__info-value">
                                    <%= userDetails.getCitizenIdentification()
                                    %>
                                </div>
                            </div>
                        </div>

                        <div class="profile__card">
                            <div class="profile__card-title">
                                <i
                                    class="fas fa-map-marker-alt mr-2"></i>Thông
                                tin địa chỉ
                            </div>
                            <div class="profile__info-row">
                                <div class="profile__info-label">Địa chỉ
                                </div>
                                <div class="profile__info-value">
                                    <%= address.getStreetAddress()
                                    %>
                                </div>
                            </div>
                            <div class="profile__info-row">
                                <div class="profile__info-label">Phường/Xã
                                </div>
                                <div class="profile__info-value">
                                    <%= ward.getWardName() %>
                                </div>
                            </div>
                            <div class="profile__info-row">
                                <div class="profile__info-label">Quận/Huyện
                                </div>
                                <div class="profile__info-value">
                                    <%= district.getDistrictName()
                                    %>
                                </div>
                            </div>
                            <div class="profile__info-row">
                                <div class="profile__info-label">Tỉnh/Thành
                                    phố</div>
                                <div class="profile__info-value">
                                    <%= province.getProvinceName()
                                    %>
                                </div>
                            </div>
                        </div>

                        <div class="profile__card">
                            <div class="profile__card-title">
                                <i
                                    class="fas fa-graduation-cap mr-2"></i>Chuyên
                                ngành
                            </div>
                            <div class="profile__info-row">
                                <div class="profile__info-label">Chuyên ngành
                                </div>
                                <div class="profile__info-value">
                                    <ul>
                                        <!-- Hiển thị chuyên ngành -->
                                        <c:if
                                            test="${not empty degree}">
                                            <p>
                                                ${degree.degreeName}
                                            </p>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="profile__card">
                            <div class="profile__card-title">
                                <i
                                    class="fas fa-briefcase-medical mr-2"></i>Chuyên
                                môn
                            </div>
                            <div class="profile__info-row">
                                <div class="profile__info-label">Chuyên môn
                                </div>
                                <div class="profile__info-value">
                                    <ul>
                                        <!-- Hiển thị chuyên môn -->
                                        <c:if
                                            test="${not empty specialization}">
                                            <p>
                                                ${specialization.specializationName}
                                            </p>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </main>
        </div>

        <!-- Essential javascripts for application to work-->
        <script
        src="${pageContext.request.contextPath}/js/manager/jquery-3.2.1.min.js"></script>
        <script
        src="${pageContext.request.contextPath}/js/manager/popper.min.js"></script>
        <script
        src="${pageContext.request.contextPath}/js/manager/bootstrap.min.js"></script>
        <script
        src="${pageContext.request.contextPath}/js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script
        src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>
    </body>

</html>