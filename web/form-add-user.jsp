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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Thêm nhân khách hàng</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager/main.css">
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



            </ul>
        </header>
        <!-- Sidebar menu-->
        <%@ include file="Manager_JSP/dashboardleft.jsp" %>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Danh sách khách hàng</li>
                    <li class="breadcrumb-item"><a href="#">Thêm khách hàng</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Tạo mới khách hàng</h3>
                        <div class="tile-body">
                            <c:if test="${not empty errorMessage}">
                                ${errorMessage}
                            </c:if>
                            <form action="${pageContext.request.contextPath}/manager/adduser" method="post" enctype="multipart/form-data">
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
                                                <label class="control-label">Username</label>
                                                <input class="form-control" type="text" name="username"  value="${param.username}" required>
                                            </div>              
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Giới tính</label>
                                                <select class="form-control" name="gender" required>
                                                    <option value="">-- Chọn giới tính --</option>
                                                    <option value="Nam" ${param.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                                    <option value="Nữ" ${param.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                                    <option value="Other" ${param.gender == 'Other' ? 'selected' : ''}>Khác</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Tỉnh/Thành phố</label>
                                                <select class="form-control" id="provinceID" name="provinceID" onchange="loadDistricts()">
                                                    <option value="">-- Chọn Tỉnh --</option>
                                                    <c:forEach var="province" items="${provinces}">
                                                        <option value="${province.provinceID}" ${param.provinceID == province.provinceID ? 'selected' : ''}>${province.provinceName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Quận/Huyện</label>
                                                <select class="form-control" id="districtSelect" name="districtID" onchange="loadWards()">
                                                    <option value="">-- Chọn Huyện --</option>
                                                    <c:forEach var="district" items="${districts}">
                                                        <option value="${district.id}" ${district.id == param.districtID ? 'selected' : ''}>${district.districtName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Phường/Xã</label>
                                                <select class="form-control" id="wardSelect" name="wardID">
                                                    <option value="">-- Chọn Xã --</option>
                                                    <c:forEach var="ward" items="${wards}">
                                                        <option value="${ward.id}" ${ward.id == param.wardID ? 'selected' : ''}>${ward.wardName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Địa chỉ</label>
                                                <input class="form-control" type="text" name="streetAddress" value="${param.streetAddress}" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Họ</label>
                                                <input class="form-control" type="text" name="firstName" value="${param.firstName}" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Tên đệm</label>
                                                <input class="form-control" type="text" name="middleName" value="${param.middleName}" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Tên</label>
                                                <input class="form-control" type="text" name="lastName" value="${param.lastName}" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Email</label>
                                                <input class="form-control" type="email" name="email" value="${param.email}" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Số điện thoại</label>
                                                <input class="form-control" type="text" name="phoneNumber" value="${param.phoneNumber}" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Ngày sinh</label>
                                                <input class="form-control" type="date" name="dateOfBirth" value="${param.dateOfBirth}" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">CMND/CCCD</label>
                                                <input class="form-control" type="text" name="citizenIdentification"  value="${param.citizenIdentification}" required>
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


        <!--
        MODAL
        -->

        <!--
        MODAL
        -->
        <script>
            function loadDistricts() {
                var provinceID = document.getElementById('provinceID').value;
                var xhr = new XMLHttpRequest();
                xhr.open('GET', '${pageContext.request.contextPath}/loadDistricts?provinceID=' + provinceID, true);
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
                xhr.open('GET', '${pageContext.request.contextPath}/loadWards?districtID=' + districtID, true);
                xhr.onload = function () {
                    if (xhr.status === 200) {
                        var wards = JSON.parse(xhr.responseText);
                        var wardSelect = document.getElementById('wardSelect');
                        wardSelect.innerHTML = '<option value="">-- Chọn Xã --</option>'; // Reset ward dropdown
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
                        image.src = e.target.result; // Gán URL ảnh cho thuộc tính src của <img>
                        image.style.display = 'block'; // Hiện ảnh
                    }

                    reader.readAsDataURL(file); // Đọc file ảnh
                } else {
                    image.src = '#'; // Reset nếu không có file
                    image.style.display = 'none'; // Ẩn ảnh
                }
            }

        </script>
        <style>
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

        <!-- Essential javascripts for application to work-->
        <script src="${pageContext.request.contextPath}/js/manager/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>

    </body>

</html>
