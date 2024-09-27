<%-- 
    Document   : form-add-user
    Created on : Sep 24, 2024, 12:36:34 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.District"%>
<%@page import="model.Ward"%>
<%@page import="model.Provinces"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Thêm nhân viên | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/manager/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <script>

            function readURL(input, thumbimage) {
                if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#thumbimage").attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                } else { // Sử dụng cho IE
                    $("#thumbimage").attr('src', input.value);

                }
                $("#thumbimage").show();
                $('.filename').text($("#uploadfile").val());
                $('.Choicefile').css('background', '#14142B');
                $('.Choicefile').css('cursor', 'default');
                $(".removeimg").show();
                $(".Choicefile").unbind('click');

            }
            $(document).ready(function () {
                $(".Choicefile").bind('click', function () {
                    $("#uploadfile").click();

                });
                $(".removeimg").click(function () {
                    $("#thumbimage").attr('src', '').hide();
                    $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
                    $(".removeimg").hide();
                    $(".Choicefile").bind('click', function () {
                        $("#uploadfile").click();
                    });
                    $('.Choicefile').css('background', '#14142B');
                    $('.Choicefile').css('cursor', 'pointer');
                    $(".filename").text("");
                });
            });

            function updateDistricts() {
                var provinceID = document.getElementById("provinceSelect").value;
                document.location.href = "adduser?provinceID=" + provinceID; // Gọi lại servlet để lấy districts
            }

            function updateWards() {
                var districtID = document.getElementById("districtSelect").value;
                document.location.href = "addser?districtID=" + districtID; // Gọi lại servlet để lấy wards
            }
        </script>
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
                /* border: 3px solid red; */
                border-radius: 50%;

            }

            .removeimg::before {
                -webkit-box-sizing: border-box;
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
                /* color: #FFF; */
                /* background-color: #DC403B; */
                content: '';
                background: red;
                border: 1px solid red;
                text-align: center;
                display: block;
                transform: rotate(-45deg);
                margin-top: -2px;
            }
        </style>
        <!-- Navbar-->
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
        <%@ include file="dashboardleft.jsp" %>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Danh sách nhân viên</li>
                    <li class="breadcrumb-item"><a href="#">Thêm nhân viên</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">

                        <h3 class="tile-title">Tạo mới nhân viên</h3>
                        <div class="tile-body">

                            <form action="addUserForm" method="post">
                                <div class="form-group col-md-4">
                                    <label class="control-label">Username</label>
                                    <input class="form-control" type="text" name="username" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Password</label>
                                    <input class="form-control" type="password" name="passwordHash" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Giới tính</label>
                                    <select class="form-control" id="genderSelect" name="gender" required>
                                        <option value="">-- Chọn giới tính --</option>
                                        <option value="male">Nam</option>
                                        <option value="female">Nữ</option>
                                        <option value="other">Khác</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Tỉnh/Thành phố</label>
                                    <select class="form-control" id="provinceSelect" name="provinceID" onchange="loadDistricts(this.value)" required>
                                        <option value="">-- Chọn Tỉnh --</option>
                                        <c:forEach var="province" items="${provinces}">
                                            <option value="${province.provinceID}">${province.provinceName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Quận/Huyện</label>
                                    <select class="form-control" id="districtSelect" name="districtID" onchange="loadWards(this.value)" required>
                                        <option value="">-- Chọn Huyện --</option>
                                        <c:forEach var="district" items="${districts}">
                                            <option value="${district.id}">${district.districtName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Phường/Xã</label>
                                    <select class="form-control" id="wardSelect" name="wardID" required>
                                        <option value="">-- Chọn Xã --</option>
                                        <c:forEach var="ward" items="${wards}">
                                            <option value="${ward.id}">${ward.wardName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Địa chỉ</label>
                                    <input class="form-control" type="text" name="streetAddress" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Họ</label>
                                    <input class="form-control" type="text" name="firstName" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Tên đệm</label>
                                    <input class="form-control" type="text" name="middleName" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Tên</label>
                                    <input class="form-control" type="text" name="lastName" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Email</label>
                                    <input class="form-control" type="email" name="email" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Số điện thoại</label>
                                    <input class="form-control" type="text" name="phoneNumber" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Ngày sinh</label>
                                    <input class="form-control" type="date" name="dateOfBirth" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">CMND/CCCD</label>
                                    <input class="form-control" type="text" name="citizenIdentification" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Ảnh đại diện</label>
                                    <input class="form-control" type="text" name="profileImage">
                                </div>
                                <div class="form-group col-md-12">
                                    <button type="submit" class="btn btn-primary">Thêm người dùng</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>          
        </main>


        <!--
        MODAL
        -->

        <!--
        MODAL
        -->


        <!-- Essential javascripts for application to work-->
        <script src="js/manager/jquery-3.2.1.min.js"></script>
        <script src="js/manager/popper.min.js"></script>
        <script src="js/manager/bootstrap.min.js"></script>
        <script src="js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="js/plugins/pace.min.js"></script>

    </body>

</html>
