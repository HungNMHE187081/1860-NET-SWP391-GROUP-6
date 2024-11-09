<%-- 
    Document   : manager-add-service
    Created on : Sep 20, 2024, 10:59:27 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Manager | Thêm dịch vụ</title>
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
        </header>
        <!-- Sidebar menu-->
        <%@ include file="dashboardleft.jsp" %>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/manager/serviceslist">Danh sách dịch vụ</a></li>
                    <li class="breadcrumb-item"><a href="addservice">Thêm dịch vụ</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">

                    <div class="tile">

                        <h3 class="tile-title">Tạo mới dịch vụ</h3>
                        <c:if test="${not empty errorMessages}">
                            <div class="alert-danger">
                                <ul>
                                    <c:forEach var="error" items="${errorMessages}">
                                        ${error}
                                        <br>
                                        </c:forEach>
                                </ul>
                            </div>
                        </c:if>
                        <div class="tile-body">
                            <form class="row" method="post" action="addservice" enctype="multipart/form-data">
                                <div class="form-group col-md-12">
                                    <label class="control-label">Tên dịch vụ</label>
                                    <input class="form-control" type="text" id="serviceName" name="serviceName" value="${param.serviceName}" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Độ tuổi</label>
                                    <select class="form-control" id="ageLimit" name="ageLimit" required>
                                        <option value="" disabled selected>-- Chọn độ tuổi --</option>
                                        <c:forEach var="agelimit" items="${ageLimits}">
                                            <option>${agelimit.ageLimit}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Loại dịch vụ</label>
                                    <select class="form-control" id="category" name="category" required>
                                        <option value="" disabled selected>-- Chọn dịch vụ --</option>
                                        <c:forEach var="category" items="${categories}">
                                            <option>${category.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Người thực hiện dịch vụ</label>
                                    <select class="form-control" id="degree" name="degree" required>
                                        <option value="" disabled selected>-- Chọn chức vụ --</option>
                                        <c:forEach var="degree" items="${degrees}">
                                            <option>${degree.degreeName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Giá (VNĐ)</label>
                                    <input class="form-control" type="number" id="price" name="price" value="${param.price}" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Thời gian khám tối đa (Phút)</label>
                                    <input class="form-control" type="number" id="duration" name="duration" value="${param.duration}" required>
                                </div>


                                <div class="form-group col-md-4">
                                    <label for="exampleSelect1" class="control-label">Tình trạng hoạt động</label>
                                    <select class="form-control" id="isActive" name="isActive" required>
                                        <option value="" disabled selected>Chọn trạng thái</option>
                                        <option>Đang hoạt động</option>
                                        <option>Chưa hoạt động</option>
                                    </select>
                                </div>

                                <div class="form-group col-md-12">
                                    <label class="control-label">Mô tả chi tiết dịch vụ</label>
                                    <textarea class="form-control" type="text" id="description" name="description" required=""
                                              style="resize: none; overflow-y: auto; min-height: 300px;">${param.description}</textarea>
                                </div>

                                <div class="form-group col-md-12">
                                    <label class="control-label">Ảnh dịch vụ</label>
                                    <div id="myfileupload">
                                        <input type="file" id="serviceImage" name="serviceImage" onchange="readURL(this);" required=""/>
                                    </div>
                                    <div id="thumbbox">
                                        <img src="${pageContext.request.contextPath}/${service.serviceImage}" 
                                             alt="${service.serviceName}" id="thumbimage" style="display: none; width: 100%;">
                                        <a class="removeimg" href="javascript:"></a>
                                    </div>
                                    <div id="boxchoice">
                                        <p style="clear:both"></p>
                                    </div>
                                </div>
                                <div class="form-group col-md-12">
                                    <button class="btn btn-save" type="submit">Thêm dịch vụ</button>
                                    <a class="btn btn-cancel" href="${pageContext.request.contextPath}/manager/serviceslist">Hủy bỏ</a>
                                </div>
                            </form>
                        </div>
                    </div>
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