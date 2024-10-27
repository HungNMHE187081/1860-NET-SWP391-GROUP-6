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
    <title>View Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
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
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
        <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="/images/hay.jpg" width="50px" alt="User Image">
            <div>
                <p class="app-sidebar__user-name"><b>User name</b></p>
                <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
            </div>
        </div>
        <hr>
        <ul class="app-menu">
            <li><a class="app-menu__item haha" href="phan-mem-ban-hang.html"><i class='app-menu__icon bx bx-cart-alt'></i>
                    <span class="app-menu__label">POS Bán Hàng</span></a></li>
            <li><a class="app-menu__item " href="index.html"><i class='app-menu__icon bx bx-tachometer'></i><span class="app-menu__label">Bảng điều khiển</span></a></li>
            <li><a class="app-menu__item active" href="serviceslist"><i class='app-menu__icon bx bx-id-card'></i>
                    <span class="app-menu__label">Quản lý dịch vụ</span></a></li>
            <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-user-voice'></i><span class="app-menu__label">Quản lý khách hàng</span></a></li>
            <li><a class="app-menu__item" href="table-data-product.html"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
            </li>
            <li><a class="app-menu__item" href="table-data-oder.html"><i class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản lý đơn hàng</span></a></li>
            <li><a class="app-menu__item" href="table-data-banned.html"><i class='app-menu__icon bx bx-run'></i><span class="app-menu__label">Quản lý tài khoản bị cấm</span></a></li>
        </ul>
    </aside>
    <!-- Sidebar menu-->
    <main class="app-content">
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item">Hồ sơ cá nhân</li>
                <li class="breadcrumb-item"><a href="#">Xem hồ sơ</a></li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">Thông tin hồ sơ</h3>
                    <div class="tile-body">
                        <div class="text-center mb-4">
                            <img src="${pageContext.request.contextPath}/${userDetails.profileImage}" alt="Profile Image" class="rounded-circle" width="150" height="150">
                        </div>
                        <table class="table table-bordered">
                            <tr>
                                <th>First Name:</th>
                                <td><%= userDetails.getFirstName() %></td>
                            </tr>
                            <tr>
                                <th>Middle Name:</th>
                                <td><%= userDetails.getMiddleName() %></td>
                            </tr>
                            <tr>
                                <th>Last Name:</th>
                                <td><%= userDetails.getLastName() %></td>
                            </tr>
                            <tr>
                                <th>Email:</th>
                                <td><%= userDetails.getEmail() %></td>
                            </tr>
                            <tr>
                                <th>Phone Number:</th>
                                <td><%= userDetails.getPhoneNumber() %></td>
                            </tr>
                            <tr>
                                <th>Date of Birth:</th>
                                <td><%= userDetails.getDateOfBirth() %></td>
                            </tr>
                            <tr>
                                <th>Gender:</th>
                                <td><%= userDetails.getGender() %></td>
                            </tr>
                            <tr>
                                <th>Citizen Identification:</th>
                                <td><%= userDetails.getCitizenIdentification() %></td>
                            </tr>
                            <tr>
                                <th>Street Address:</th>
                                <td><%= address.getStreetAddress() %></td>
                            </tr>
                            <tr>
                                <th>Ward:</th>
                                <td><%= ward.getWardName() %></td>
                            </tr>
                            <tr>
                                <th>District:</th>
                                <td><%= district.getDistrictName() %></td>
                            </tr>
                            <tr>
                                <th>Province:</th>
                                <td><%= province.getProvinceName() %></td>
                            </tr>
                        </table>
                        <a href="${pageContext.request.contextPath}/customer/editprofile" class="btn btn-primary">Chỉnh sửa hồ sơ</a>
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