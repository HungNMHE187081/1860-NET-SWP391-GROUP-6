<%-- 
    Document   : detail-user
    Created on : Oct 3, 2024, 10:41:11 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Chi tiết khách hàng | Quản trị Admin</title>
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



            </ul>
        </header>
        <!-- Sidebar menu-->
        <%@include file="Manager_JSP/dashboardleft.jsp" %>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Danh sách khách hàng</li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Chi tiết</h3>
                        <div class="tile-body">
                            <form action="viewdetailsuser" method="get">
                                <div class="row">
                                    <!-- Avatar Section -->
                                    <div class="col-md-3 text-center">
                                        <div class="form-group">
                                            <label class="control-label">Ảnh đại diện</label>
                                            <div class="profile-img-container">
                                                <img id="imagePreview" src="${pageContext.request.contextPath}/${user.profileImage}" alt="Image Preview" class="rounded-circle img-fluid">
                                            </div>

                                        </div>
                                    </div>

                                    <!-- Information Section -->
                                    <div class="col-md-9">
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Username</label>
                                                <div class="form-control">${user.user.username}</div>
                                            </div>

                                            <div class="form-group col-md-4">
                                                <label class="control-label">Giới tính</label>
                                                <div class="form-control">${user.gender}</div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Tỉnh/Thành phố</label>
                                                <div class="form-control">${user.address.provinces.provinceName}</div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Quận/Huyện</label>
                                                <div class="form-control">${user.address.district.districtName}</div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Phường/Xã</label>
                                                <div class="form-control">${user.address.ward.wardName}</div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Địa chỉ</label>    
                                                <div class="form-control">${user.address.streetAddress}</div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Họ</label>
                                                <div class="form-control">${user.firstName}</div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Tên đệm</label>
                                                <div class="form-control">${user.middleName}</div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Tên</label>
                                                <div class="form-control">${user.lastName}</div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Email</label>
                                                <div class="form-control">${user.email}</div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Số điện thoại</label>
                                                <div class="form-control">${user.phoneNumber}</div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Ngày sinh</label>
                                                <div class="form-control">${user.dateOfBirth}</div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">CMND/CCCD</label>
                                                <div class="form-control">${user.citizenIdentification}</div>
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
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
             data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group  col-md-12">
                                <span class="thong-tin-thanh-toan">
                                    <h5>Tạo chức vụ mới</h5>
                                </span>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="control-label">Nhập tên chức vụ mới</label>
                                <input class="form-control" type="text" required>
                            </div>
                        </div>
                        <BR>
                        <button class="btn btn-save" type="button">Lưu lại</button>
                        <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                        <BR>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <!--
        MODAL
        -->


        <!-- Essential javascripts for application to work-->
        <script src="${pageContext.request.contextPath}/js/manager/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>

    </body>

</html>