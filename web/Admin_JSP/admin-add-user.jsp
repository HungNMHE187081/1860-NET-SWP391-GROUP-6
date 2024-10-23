<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm nhân viên mới</title>
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
        <style>
            .Choicefile {
                display: block;
                background: #14142B;
                border: 1px solid #fff;
                color: #fff;
                width: 150px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                padding: 5px 0px;
                border-radius: 5px;
                font-weight: 500;
                align-items: center;
                justify-content: center;
            }

            .Choicefile:hover {
                text-decoration: none;
                color: white;
            }

            #uploadfile,
            .removeimg {
                display: none;
            }

            #thumbbox {
                position: relative;
                width: 100%;
                margin-bottom: 20px;
            }

            .removeimg {
                height: 25px;
                position: absolute;
                background-repeat: no-repeat;
                top: 5px;
                left: 5px;
                background-size: 25px;
                width: 25px;
                border-radius: 50%;
            }

            .removeimg::before {
                box-sizing: border-box;
                content: '';
                border: 1px solid red;
                background: red;
                text-align: center;
                display: block;
                margin-top: 11px;
                transform: rotate(45deg);
            }

            .removeimg::after {
                content: '';
                background: red;
                border: 1px solid red;
                text-align: center;
                display: block;
                transform: rotate(-45deg);
                margin-top: -2px;
            }

            .profile-img-container {
                width: 150px;
                height: 150px;
                overflow: hidden;
                border-radius: 20%;
                margin: 0 auto;
            }

            .profile-img-container img {
                width: 100%;
                height: auto;
            }

            .form-control-file {
                display: block;
                margin-top: 10px;
            }
        </style>

        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">
                <!-- User Menu-->
                <li><a class="app-nav__item" href="/index.html"><i class='bx bx-log-out bx-rotate-180'></i> </a>
                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="/images/hay.jpg" width="50px"
                                                alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>User name</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item haha" href="phan-mem-ban-hang.html"><i
                            class='app-menu__icon bx bx-cart-alt'></i>
                        <span class="app-menu__label">POS Bán Hàng</span></a></li>
                <li><a class="app-menu__item " href="index.html"><i
                            class='app-menu__icon bx bx-tachometer'></i><span class="app-menu__label">Bảng điều
                            khiển</span></a></li>
                <li><a class="app-menu__item active" href="serviceslist"><i
                            class='app-menu__icon bx bx-id-card'></i>
                        <span class="app-menu__label">Quản lý dịch vụ</span></a></li>
                <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Quản lý khách hàng</span></a></li>
                <li><a class="app-menu__item" href="table-data-product.html"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý
                            sản phẩm</span></a>
                </li>
                <li><a class="app-menu__item" href="table-data-oder.html"><i
                            class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Quản lý đơn
                            hàng</span></a></li>
                <li><a class="app-menu__item" href="table-data-banned.html"><i
                            class='app-menu__icon bx bx-run'></i><span class="app-menu__label">Quản lý tài khoản bị
                            cấm</span></a></li>
            </ul>
        </aside>
        <!-- Sidebar menu-->
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Danh sách nhân viên </li>
                    <li class="breadcrumb-item"><a href="#">Thêm nhân viên</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Tạo mới nhân viên</h3>
                        <div class="tile-body">
                            <!<!-- Hiển thị thông báo lỗi -->
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">
                                    ${error}
                                </div>
                            </c:if>

                            <form action="${pageContext.request.contextPath}/admin/adminadduser" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <!-- Avatar Section -->
                                    <div class="col-md-3 text-center">
                                        <div class="form-group">
                                            <label class="control-label">Ảnh đại diện</label>
                                            <div class="profile-img-container">
                                                <img id="imagePreview" src="https://via.placeholder.com/150" alt="Image Preview" class="rounded-circle img-fluid">
                                            </div>
                                            <input class="form-control-file mt-3" type="file" name="profileImage" id="profileImage" onchange="previewImage(event)">
                                        </div>
                                    </div>

                                    <!-- Information Section -->
                                    <div class="col-md-9">
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label class="control-label">First Name:</label>
                                                <input class="form-control" type="text" name="firstName" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Middle Name:</label>
                                                <input class="form-control" type="text" name="middleName">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Last Name:</label>
                                                <input class="form-control" type="text" name="lastName" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Email:</label>
                                                <input class="form-control" type="email" name="email" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Phone Number:</label>
                                                <input class="form-control" type="text" name="phoneNumber" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Date of Birth:</label>
                                                <input class="form-control" type="date" name="dateOfBirth" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Gender:</label>
                                                <select class="form-control" name="gender" required>
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Citizen Identification:</label>
                                                <input class="form-control" type="text" name="citizenIdentification" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Username:</label>
                                                <input class="form-control" type="text" name="username" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Password:</label>
                                                <input class="form-control" type="password" name="password" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Role:</label>
                                                <select class="form-control" name="role" required>
                                                    <option value="Manager">Manager</option>
                                                    <option value="Doctor">Doctor</option>
                                                    <option value="Nurse">Nurse</option>

                                                </select>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Tỉnh/Thành phố</label>
                                                <select class="form-control" id="provinceID" name="provinceID" onchange="loadDistricts()">
                                                    <option value="">-- Chọn Tỉnh --</option>
                                                    <c:forEach var="province" items="${provinces}">
                                                        <option value="${province.provinceID}">${province.provinceName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Quận/Huyện</label>
                                                <select class="form-control" id="districtSelect" name="districtID" onchange="loadWards()">
                                                    <option value="">-- Chọn Huyện --</option>
                                                    <c:forEach var="district" items="${districts}">
                                                        <option value="${district.id}">${district.districtName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Phường/Xã</label>
                                                <select class="form-control" id="wardSelect" name="wardID">
                                                    <option value="">-- Chọn Xã --</option>
                                                    <c:forEach var="ward" items="${wards}">
                                                        <option value="${ward.id}">${ward.wardName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="control-label">Địa chỉ</label>
                                                <input class="form-control" type="text" name="streetAddress" required>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <button type="submit" class="btn btn-primary">Thêm người dùng</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
                                
        
                            <script type="text/javascript">
                                var contextPath = '<%= request.getContextPath() %>';
                            </script>
        <script>
            function loadDistricts() {
                var provinceID = document.getElementById('provinceID').value;
                var xhr = new XMLHttpRequest();
                xhr.open('GET', contextPath + '/loadDistricts?provinceID=' + provinceID, true);
                xhr.onload = function () {
                    if (xhr.status === 200) {
                        var districts = JSON.parse(xhr.responseText);
                        var districtSelect = document.getElementById('districtSelect');
                        districtSelect.innerHTML = '<option value="">-- Chọn Huyện --</option>'; // Reset district dropdown
                        districts.forEach(function (district) {
                            var option = document.createElement('option');
                            option.value = district.id;
                            option.textContent = district.districtName;
                            districtSelect.appendChild(option);
                        });
                        loadWards(); // Load wards for the first district if any
                    }
                };
                xhr.send();
            }

            function loadWards() {
                var districtID = document.getElementById('districtSelect').value;
                var xhr = new XMLHttpRequest();
                xhr.open('GET', contextPath + '/loadWards?districtID=' + districtID, true);
                xhr.onload = function () {
                    if (xhr.status === 200) {
                        var wards = JSON.parse(xhr.responseText);
                        var wardSelect = document.getElementById('wardSelect');
                        wardSelect.innerHTML = '<option value="">-- Chọn xã --</option>'; // Reset ward dropdown
                        wards.forEach(function (ward) {
                            var option = document.createElement('option');
                            option.value = ward.id;
                            option.textContent = ward.wardName;
                            wardSelect.appendChild(option);
                        });
                    }
                };
                xhr.send();
            }

            function previewImage(event) {
                const image = document.getElementById('imagePreview');
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        image.src = e.target.result; // GÃ¡n URL áº£nh cho thuá»c tÃ­nh src cá»§a <img>
                        image.style.display = 'block'; // Hiá»n áº£nh
                    }

                    reader.readAsDataURL(file); // Äá»c file áº£nh
                } else {
                    image.src = '#'; // Reset náº¿u khÃ´ng cÃ³ file
                    image.style.display = 'none'; // áº¨n áº£nh
                }
            }
        </script>

        <!-- Essential javascripts for application to work-->
        <script src="js/manager/jquery-3.2.1.min.js"></script>
        <script src="js/manager/popper.min.js"></script>
        <script src="js/manager/bootstrap.min.js"></script>
        <script src="js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="js/plugins/pace.min.js"></script>
    </body>

</html>