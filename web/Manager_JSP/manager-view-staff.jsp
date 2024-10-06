<%-- 
    Document   : manager-view-staff
    Created on : Oct 6, 2024, 12:59:58 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Manager | Chi tiết nhân viên</title>
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
                <!-- User Menu-->
                <li><a class="app-nav__item" href="/index.html"><i class='bx bx-log-out bx-rotate-180'></i> </a>
                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <%@include file="dashboardleft.jsp" %>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/manager/staffslist">Danh sách nhân viên</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/manager/viewstaff?staffID=${staff.staffID}">Chi tiết nhân viên</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="container">
                        <h2>Chi tiết dịch vụ</h2>
                        <input type="hidden" name="staffID" value="${staff.staffID}">
                        <div class="row">
                            <div class="col-md-3 text-center">
                                <div class="form-group">
                                    <label class="control-label">Ảnh đại diện</label>
                                    <div class="profile-img-container">
                                        <img id="imagePreview" src="${user.profileImage}" alt="${staff.staffName}" class="rounded-circle img-fluid">
                                    </div>

                                </div>
                            </div>

                            <div class="col-md-9">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Tên nhân viên</label>
                                        <input class="form-control" type="text" id="staffName" name="staffName" value="${user.firstName} ${user.middleName} ${user.lastName}" readonly="">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Giới tính</label>
                                        <input class="form-control" type="text" id="gender" name="gender" value="${user.gender}" readonly="">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Chức vụ</label>
                                        <input class="form-control" type="text" id="degree" name="degree" value="
                                               <c:forEach var="degree" items="${degrees}">
                                                    <c:if test="${degree.degreeID == staff.degreeID}">
                                                        ${degree.degreeName}
                                                    </c:if>
                                                </c:forEach>" readonly="">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Khoa</label>
                                        <input class="form-control" type="text" id="specialization" name="specialization" value="
                                               <c:forEach var="specialization" items="${specializations}">
                                                    <c:if test="${specialization.specializationID == staff.specializationID}">
                                                        ${specialization.specializationName}
                                                    </c:if>
                                                </c:forEach>" readonly="">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Tỉnh/Thành phố</label>
                                        <input class="form-control" type="text" id="province" name="province" value="${user.address.provinces.provinceName}" readonly="">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Quận/Huyện</label>
                                        <input class="form-control" type="text" id="district" name="district" value="${user.address.district.districtName}" readonly="">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Phường/Xã</label>
                                        <input class="form-control" type="text" id="ward" name="ward" value="${user.address.ward.wardName}" readonly="">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Địa chỉ</label>    
                                        <input class="form-control" type="text" id="province" name="province" value="${user.address.streetAddress}" readonly="">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Email</label>
                                        <input class="form-control" type="text" id="email" name="email" value="${user.email}" readonly="">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Số điện thoại</label>
                                        <input class="form-control" type="text" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" readonly="">
                                        </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Ngày sinh</label>
                                        <input class="form-control" type="text" id="dateOfBirth" name="dateOfBirth" value="${user.dateOfBirth}" readonly="">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">CMND/CCCD</label>
                                        <input class="form-control" type="text" id="citizenIdentification" name="citizenIdentification" value="${user.citizenIdentification}" readonly="">
                                    </div>  
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Ngày được nhận</label>
                                        <input class="form-control" type="text" id="hireDate" name="hireDate" value="${staff.hireDate}" readonly="">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Lương (VNĐ)</label>
                                        <input class="form-control" type="text" id="salary" name="salary" value="${staff.salary}" readonly="">
                                    </div>
                                </div>
                            </div>
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

                        function formatCurrency(value) {
                            return new Intl.NumberFormat('en-US', {
                                minimumFractionDigits: 0,
                                maximumFractionDigits: 0
                            }).format(value);
                        }

                        function formatSalary() {
                            var salaryInput = document.getElementById('salary');
                            var salaryValue = parseFloat(salaryInput.value.replace(/,/g, ''));
                            if (!isNaN(salaryValue)) {
                                salaryInput.value = formatCurrency(salaryValue);
                            }
                        }

                        window.onload = formatSalary;
                    </script>
                </div>
            </div>
        </main>
        <!-- Essential javascripts for application to work-->
        <script src="js/manager/jquery-3.2.1.min.js"></script>
        <script src="js/manager/popper.min.js"></script>
        <script src="js/manager/bootstrap.min.js"></script>
        <script src="js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="js/plugins/pace.min.js"></script>

    </body>

</html>
