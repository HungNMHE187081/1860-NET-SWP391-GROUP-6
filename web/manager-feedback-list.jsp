

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Manager | Services List</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/manager/services.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

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
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user">
                <div>
                    <p class="app-sidebar__user-name"><b>User name</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item haha" href="phan-mem-ban-hang.html"><i class='app-menu__icon bx bx-cart-alt'></i>
                        <span class="app-menu__label">POS Bán Hàng</span></a></li>
                <li><a class="app-menu__item " href="index.html"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Bảng điều khiển</span></a></li>
                <li><a class="app-menu__item active" href="serviceslist"><i class='app-menu__icon bx bx-id-card'></i>
                        <span class="app-menu__label">Quản lý phản hồi</span></a></li>
                <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Quản lý khách hàng</span></a></li>
                <li><a class="app-menu__item" href="table-data-product.html"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
                </li>
                <li><a class="app-menu__item" href="table-data-oder.html"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Quản lý đơn hàng</span></a></li>
                <li><a class="app-menu__item" href="table-data-banned.html"><i class='app-menu__icon bx bx-run'></i><span
                            class="app-menu__label">Quản lý nội bộ
                        </span></a></li>
                <li><a class="app-menu__item" href="table-data-money.html"><i class='app-menu__icon bx bx-dollar'></i><span
                            class="app-menu__label">Bảng kê lương</span></a></li>
                <li><a class="app-menu__item" href="quan-ly-bao-cao.html"><i
                            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>
                </li>
                <li><a class="app-menu__item" href="page-calendar.html"><i class='app-menu__icon bx bx-calendar-check'></i><span
                            class="app-menu__label">Lịch công tác </span></a></li>
                <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">Cài
                            đặt hệ thống</span></a></li>
            </ul>
        </aside>
        <main class="app-content">

            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="feedbacklist"><b>Danh sách phản hồi</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">

                            <div class="row mb-3 d-flex justify-content-between align-items-center">
                                <div class="d-flex">
                                    <div class="col-sm-2">
                                        <a class="btn btn-delete btn-sm nhap-tu-file" type="button" title="Nhập" onclick="myFunction(this)">
                                            <i class="fas fa-file-upload"></i> Tải từ file
                                        </a>
                                    </div>
                                    <div class="col-sm-2">
                                        <a class="btn btn-excel btn-sm" href="" title="In">
                                            <i class="fas fa-file-excel"></i> Xuất Excel
                                        </a>
                                    </div>
                                    <div class="col-sm-2">
                                        <a class="btn btn-delete btn-sm pdf-file" type="button" title="In" onclick="myFunction(this)">
                                            <i class="fas fa-file-pdf"></i> Xuất PDF
                                        </a>
                                    </div>
                                </div>
                                <div>

                                    <form method="get" action="searchfeedback" class="form-inline">
                                        <!-- Search Input -->
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control search-input" id="searchInput" name="keyword" placeholder="Tìm kiếm...">
                                            <div class="input-group-append">
                                                <button type="submit" class="btn custom-search-btn">Tìm kiếm</button>
                                            </div>
                                        </div>
                                        <div class="input-group mb-3">
                                            <select class="form-control" id="rating" name="rating">
                                                <option value="" disabled selected>Chọn số sao</option>
                                                <c:forEach var="feedback" items="${feedback}">
                                                    <option value="${feedback.rating}">${feedback.rating}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="input-group-append">
                                                <button type="submit" class="btn custom-filter-btn">Lọc</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <table>
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Người dùng phản hồi</th>
                                        <th>Email</th>
                                        <th>Số điện thoại</th>
                                        <th>Dịch vụ</th>
                                        <th>Đánh giá dịch vụ(theo sao)</th>
                                        <th>Chi tiết phản hồi</th>
                                        <th>Đóng góp ý kiến</th>
                                        <th>Đính kèm tệp</th>
                                        <th>Đánh giá trải nghiệm</th>
                                        <!--<th>Ngày gửi phản hồi</th>-->
                                        <th>Trạng thái hoạt động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="feedback" items="${feedback}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${feedback.userName}</td>
                                            <td>${feedback.email}</td>
                                            <td>${feedback.phoneNumber}</td>
                                            <td>
                                                <c:forEach var="service" items="${service}">
                                                    <c:if test="${service.serviceID == feedback.serviceID}">
                                                        ${service.serviceName}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>${feedback.rating}</td>     
                                            <td>${feedback.comment}</td>
                                            <td>${feedback.suggestion}</td>
                                            <td><img src="${feedback.attachmentPath}" alt="${feedback.attachmentPath}" width="75" height="50"></td>
                                            <td>${feedback.experienceRating}</td>    

                                            <td>${feedback.status ? 'Đã phản hồi' : 'Chưa phản hồi'}</td>
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

