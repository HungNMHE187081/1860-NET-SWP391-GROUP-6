<%-- 
    Document   : manager-services-list
    Created on : Sep 20, 2024, 10:35:21 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Manager | Danh sách dịch vụ</title>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <style>
            /* Filter Form Styling */
            .filter-form {
                display: flex; /* Use flexbox for layout */
                align-items: center; /* Center items vertically */
                margin-bottom: 20px; /* Space below the form */
            }

            .filter-group {
                display: flex; /* Use flexbox for group layout */
                gap: 10px; /* Space between elements */
                flex-wrap: nowrap; /* Prevent wrapping */
            }

            .filter-group input,
            .filter-group select {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                width: 200px; /* Set a fixed width for inputs and selects */
            }

            .filter-group button,
            .filter-group .btn {
                background-color: #333;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 10px 15px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }

            .filter-group button:hover,
            .filter-group .btn:hover {
                background-color: #575757; /* Darker shade on hover */
            }

        </style>
    </head>

    <body onload="time()" class="app sidebar-mini rtl">

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
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/manager/serviceslist"><b>Danh sách dịch vụ</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">

                            <div class="row mb-3 d-flex justify-content-between align-items-center">
                                <div class="d-flex"></div>
                                <div>
                                    <form action="${pageContext.request.contextPath}/manager/searchreservation" method="get" class="filter-form">
                                        <div class="filter-group">
                                            <div class="filter-group">
                                                <input type="text" id="searchInput" name="keyword" placeholder="Tìm theo tên trẻ" />
                                                <select class="form-control" id="timeOfDay" name="timeOfDay">
                                                    <option value="">Chọn thời gian khám</option>
                                                    <option value="morning">Buổi sáng</option>
                                                    <option value="afternoon">Buổi tối</option>
                                                </select>
                                                <button type="submit"><i class="fas fa-filter"></i> Lọc và tìm kiếm</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <style>
                                    /* Style for Input Groups */
                                    .input-group .form-control {
                                        border-right: none;
                                    }

                                    .input-group .input-group-append .btn {
                                        border-left: none;
                                        border-radius: 0 4px 4px 0;
                                    }

                                    /* Button Styles */
                                    .custom-search-btn, .custom-filter-btn {
                                        height: 45px;
                                        padding: 0 20px;
                                        font-size: 14px;
                                    }

                                    .custom-search-btn {
                                        background-color: #F5CBA7;
                                        color: #D35400;
                                        border: 1px solid #D35400;
                                    }

                                    .custom-search-btn:hover {
                                        background-color: #D35400;
                                        color: #FFFFFF;
                                    }

                                    .custom-filter-btn {
                                        background-color: #1B2631;
                                        color: #FFFFFF;
                                        border: 1px solid #1B2631;
                                    }

                                    .custom-filter-btn:hover {
                                        background-color: #154360;
                                    }

                                    /* General Form Control */
                                    .form-control {
                                        height: 45px;
                                    }


                                </style>

                            </div>

                            <table>
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Ảnh của trẻ</th>
                                        <th>Tên trẻ</th>
                                        <th>Tên nhân viên</th>
                                        <th>Ngày khám</th>
                                        <th>Giờ khám</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="reservation" items="${reservations}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>
                                                <c:forEach var="orderItem" items="${orderItems}">
                                                    <c:if test="${orderItem.orderItemID == reservation.orderItemID}">
                                                        <c:forEach var="child" items="${children}">
                                                            <c:if test="${child.childID == orderItem.childID}">
                                                                <img src="${pageContext.request.contextPath}/${child.childImage}" 
                                                                     alt="${child.firstName} ${child.middleName} ${child.lastName}" class="child-image">
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <c:forEach var="orderItem" items="${orderItems}">
                                                    <c:if test="${orderItem.orderItemID == reservation.orderItemID}">
                                                        <c:forEach var="child" items="${children}">
                                                            <c:if test="${child.childID == orderItem.childID}">
                                                                ${child.firstName} ${child.middleName} ${child.lastName}
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <c:forEach var="staff" items="${staffs}">
                                                    <c:if test="${staff.staffID == reservation.staffID}">
                                                        ${staff.staffName}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <fmt:parseDate value="${reservation.reservationDate}" pattern="yyyy-MM-dd" var="parsedReservationDate" />
                                                <fmt:formatDate value="${parsedReservationDate}" pattern="dd-MM-yyyy" />
                                            </td>
                                            <td>
                                                <fmt:parseDate value="${reservation.startTime}" pattern="HH:mm:ss" var="parsedStartTime" />
                                                <fmt:formatDate value="${parsedStartTime}" pattern="hh:mm a" />
                                            </td>
                                            <td class="table-td-center">
                                                <button class="btn-primary btn-sm" type="button" title="detail" id="show-emp">
                                                    <a href="${pageContext.request.contextPath}/manager/viewreservation?reservationID=${reservation.reservationID}" title="View">
                                                        <i class="fas fa-eye"></i></a>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </main>

        <!-- Essential javascripts for application to work-->
        <script src="js/manager/jquery-3.2.1.min.js"></script>
        <script src="js/manager/popper.min.js"></script>
        <script src="js/manager/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="src/jquery.table2excel.js"></script>
        <script src="js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
        <script>

            //EXCEL
            // $(document).ready(function () {
            //   $('#').DataTable({

            //     dom: 'Bfrtip',
            //     "buttons": [
            //       'excel'
            //     ]
            //   });
            // });


            //Thời Gian
            function time() {
                var today = new Date();
                var weekday = new Array(7);
                weekday[0] = "Chủ Nhật";
                weekday[1] = "Thứ Hai";
                weekday[2] = "Thứ Ba";
                weekday[3] = "Thứ Tư";
                weekday[4] = "Thứ Năm";
                weekday[5] = "Thứ Sáu";
                weekday[6] = "Thứ Bảy";
                var day = weekday[today.getDay()];
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                nowTime = h + " giờ " + m + " phút " + s + " giây";
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                        '</span>';
                document.getElementById("clock").innerHTML = tmp;
                clocktime = setTimeout("time()", "1000", "Javascript");

                function checkTime(i) {
                    if (i < 10) {
                        i = "0" + i;
                    }
                    return i;
                }
            }
            //In dữ liệu
            var myApp = new function () {
                this.printTable = function () {
                    var tab = document.getElementById('sampleTable');
                    var win = window.open('', '', 'height=700,width=700');
                    win.document.write(tab.outerHTML);
                    win.document.close();
                    win.print();
                }
            }
            //     //Sao chép dữ liệu
            //     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

            // copyTextareaBtn.addEventListener('click', function(event) {
            //   var copyTextarea = document.querySelector('.js-copytextarea');
            //   copyTextarea.focus();
            //   copyTextarea.select();

            //   try {
            //     var successful = document.execCommand('copy');
            //     var msg = successful ? 'successful' : 'unsuccessful';
            //     console.log('Copying text command was ' + msg);
            //   } catch (err) {
            //     console.log('Oops, unable to copy');
            //   }
            // });


            //Modal
            $("#show-emp").on("click", function () {
                $("#ModalUP").modal({backdrop: false, keyboard: false})
            });
        </script>

    </body>

</html>

