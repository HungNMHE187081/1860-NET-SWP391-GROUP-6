<%-- 
    Document   : manager-add-service
    Created on : Sep 20, 2024, 10:59:27 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Manager | Chi tiết dịch vụ</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager/services.css">

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
            })
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
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/manager/serviceslist">Danh sách dịch vụ</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/manager/viewservice?serviceID=${service.serviceID}">Chi tiết dịch vụ</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="container">
                        <h2>Chi tiết dịch vụ</h2>
                        <input type="hidden" name="serviceID" value="${service.serviceID}">

                        <div class="form-group">
                            <label class="control-label">Tên dịch vụ</label>
                            <input class="form-control" type="text" id="serviceName" name="serviceName" value="${service.serviceName}" readonly="">
                        </div>

                        <div class="row">
                            <div class="form-group col-md-4">
                                <label class="control-label">Độ tuổi</label>
                                <input class="form-control" type="text" id="ageLimit" name="ageLimit" value="<c:forEach var='ageLimit' items='${ageLimits}'><c:if test='${ageLimit.ageLimitID == service.ageLimitID}'>${ageLimit.ageLimit}</c:if></c:forEach>" readonly>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Loại dịch vụ</label>
                                        <input class="form-control" type="text" id="category" name="category" value="<c:forEach var='category' items='${categories}'><c:if test='${category.categoryID == service.categoryID}'>${category.categoryName}</c:if></c:forEach>" readonly>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Người thực hiện dịch vụ</label>
                                        <input class="form-control" type="text" id="degree" name="degree" value="<c:forEach var='degree' items='${degrees}'><c:if test='${degree.degreeID == service.degreeID}'>${degree.degreeName}</c:if></c:forEach>" readonly>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Giá (VNĐ)</label>
                                        <input class="form-control" type="text" id="price" name="price"
                                               value="<fmt:formatNumber value='${service.price}' type='number' groupingUsed='true' />" readonly="">
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label">Thời gian khám tối đa (Phút)</label>
                                <input class="form-control" type="number" id="duration" name="duration" value="${service.duration}" readonly="">
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label">Tình trạng hoạt động</label>
                                <input class="form-control" type="text" id="isActive" name="isActive" value="${service.isActive ? 'Đang hoạt động' : 'Chưa hoạt động'}" readonly="">
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="control-label">Ngày tạo</label>
                                <input class="form-control" type="date" id="createdAt" name="createdAt" value="${service.createdAt}" readonly>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Ngày cập nhật</label>
                                <input class="form-control" type="date" id="updatedAt" name="updatedAt" value="${service.updatedAt}" readonly>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label">Mô tả</label>
                            <textarea class="form-control" id="description" name="description" readonly style="resize: none; overflow-y: auto; min-height: 300px;">${service.description}</textarea>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Ảnh dịch vụ</label>
                            <div id="thumbbox">
                                <img src="${pageContext.request.contextPath}/${service.serviceImage}" alt="${service.serviceName}" id="thumbimage" style="display: block; width: 100%;">
                                <a class="removeimg" href="javascript:"></a>
                            </div>
                            <div id="boxchoice">
                                <p style="clear:both"></p>
                            </div>
                        </div>

                        <div class="form-group">
                            <a class="btn btn-save" href="${pageContext.request.contextPath}/manager/editservice?serviceID=${service.serviceID}">Sửa dịch vụ</a>
                            <a class="btn btn-cancel" onclick="return confirm('Are you sure you want to delete this service?')" href="${pageContext.request.contextPath}/manager/deleteservice?serviceID=${service.serviceID}">Xóa dịch vụ</a>
                            <a class="btn btn-danger" href="${pageContext.request.contextPath}/manager/serviceslist?serviceID=${service.serviceID}">Trở về</a>
                        </div>
                    </div>
                    <script>
                        function readURL(input) {
                            if (input.files && input.files[0]) {
                                var reader = new FileReader();
                                reader.onload = function (e) {
                                    document.getElementById('thumbimage').src = e.target.result;
                                    document.getElementById('thumbimage').style.display = 'block';
                                };
                                reader.readAsDataURL(input.files[0]);
                            }
                        }
                    </script>
                </div>
            </div>
        </main>
    </div>
    <!--
    MODAL
    -->


    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>

</body>

</html>