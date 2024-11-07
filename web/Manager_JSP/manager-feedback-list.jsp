

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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager/services.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="${pageContext.request.contextPath}/https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

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
        <%@ include file="/Manager_JSP/dashboardleft.jsp" %>
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
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                            <div class="input-group-append">
                                                <button type="submit" class="btn custom-filter-btn">Lọc</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <style>
                                /* Style for Input Groups */
                                .input-group .form-control {
                                    border-right: none;
                                    height: 35px; /* Reduced height */
                                    font-size: 12px; /* Smaller font size */
                                }

                                .input-group .input-group-append .btn {
                                    border-left: none;
                                    border-radius: 0 4px 4px 0;
                                    height: 35px; /* Reduced height */
                                    font-size: 12px; /* Smaller font size */
                                }

                                /* Button Styles */
                                .custom-search-btn, .custom-filter-btn {
                                    height: 35px; /* Reduced height */
                                    padding: 0 15px; /* Adjusted padding */
                                    font-size: 12px; /* Smaller font size */
                                }

                                .custom-search-btn {
                                    background-color: #a2ecb5;
                                    color: #008c04;
                                    margin-right: 10px;
                                }

                                .custom-filter-btn {
                                    background-color: #e1ec86;
                                    color: #4b5400;
                                    margin-right: 10px;
                                }

                                /* General Form Control */
                                .form-control {
                                    height: 35px; /* Reduced height */
                                    font-size: 12px; /* Smaller font size */
                                }
                                /* Style for the select dropdown */
                                #rating {
                                    height: 35px; /* Adjust to match other elements */
                                    font-size: 12px; /* Smaller font size */
                                    padding: 5px; /* Adjust padding */
                                }



                            </style>
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
                                        <th>Chức năng</th>
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
                                            <td>
                                                <!-- In manager-feedback-list.jsp -->
                                               <form id="updateFeedbackForm${feedback.feedbackID}" action="${pageContext.request.contextPath}/manager/feedbacklist" method="post">
    <input type="hidden" name="feedbackId" value="${feedback.feedbackID}">
    <input type="hidden" name="action" value="confirm">
    <button type="button" class="btn btn-excel btn-sm" 
            ${feedback.status ? "disabled" : ""} 
            onclick="confirmUpdate(${feedback.feedbackID})">
        ✓ Xác nhận
    </button>
</form>

                                                <!-- Add this JavaScript to your JSP -->
                                                <script>
                                                    function confirmUpdate(feedbackID) {
                                                        swal({
                                                            title: "Xác nhận?",
                                                            text: "Bạn có chắc chắn muốn xác nhận phản hồi này?",
                                                            icon: "warning",
                                                            buttons: ["Hủy", "Đồng ý"],
                                                            dangerMode: true,
                                                        })
                                                                .then((willConfirm) => {
                                                                    if (willConfirm) {
                                                                        document.getElementById('updateFeedbackForm' + feedbackID).submit();
                                                                    }
                                                                });
                                                    }
                                                </script>
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
        <script src="${pageContext.request.contextPath}/js/manager/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/src/jquery.table2excel.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/dataTables.bootstrap.min.js"></script>
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
            function confirmUpdate(feedbackID) {
                if (confirm("Bạn có chắc chắn muốn cập nhật trạng thái không?")) {
                    document.getElementById('updateFeedbackForm' + feedbackID).submit();
                }
            }
        </script>
    </body>

</html>

