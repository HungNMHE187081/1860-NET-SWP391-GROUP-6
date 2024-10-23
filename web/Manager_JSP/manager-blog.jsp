<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách nhân viên | Qu?n tr? Admin</title>
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
        <%@include file="dashboardleft.jsp" %>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách nhân viên</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">

                            <div class="row element-button">
                                <div class="col-sm-2">

                                    <a class="btn btn-add btn-sm" href="addblog" title="Thêm"><i class="fas fa-plus"></i>
                                        T?o m?i nhân viên</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm nhap-tu-file" type="button" title="Nh?p" onclick="myFunction(this)"><i
                                            class="fas fa-file-upload"></i> T?i t? file</a>
                                </div>

                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i
                                            class="fas fa-print"></i> In d? li?u</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm print-file js-textareacopybtn" type="button" title="Sao chép"><i
                                            class="fas fa-copy"></i> Sao chép</a>
                                </div>

                                <div class="col-sm-2">
                                    <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xu?t Excel</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm pdf-file" type="button" title="In" onclick="myFunction(this)"><i
                                            class="fas fa-file-pdf"></i> Xu?t PDF</a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i
                                            class="fas fa-trash-alt"></i> Xóa t?t c? </a>
                                </div>
                            </div>
                            <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
                                   id="sampleTable">
                                <thead>
                                    <tr>
                                        <th width="10"><input type="checkbox" id="all"></th>
                                        <th>Title</th>
                                        <th width="150">Author</th>
                                        <th width="20">Thumbnail</th>
                                        <th width="300">PublicDate</th>
                                        <th>IsPublished</th>
                                        <th>View</th>
                                        <th width="100">Tính n?ng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="blog" items="${blogList}">
                                        <tr>
                                            <td width="10"><input type="checkbox"></td>
                                            <td>${blog.title}</td>
                                            <td>${blog.authorName}</td>
                                            <td><img class="img-card-person" src="${blog.thumbnailPath}" alt=""></td>
                                            <td>${blog.createdDate}</td>
                                           <td>
                                                <c:if test="${blog.isPublished}">
                                                    Active
                                                </c:if>
                                                <c:if test="${!blog.isPublished}">
                                                    Inactive
                                                </c:if>
                                            </td>
                                            <td>${blog.views}</td>                                 
                                            <td>
                                                <form action="deleteblog" method="post">
                                                    <input type="hidden" name="blogid" value="${blog.blogID}"/>
                                                    <button class="btn btn-primary btn-sm trash" title="Xóa" onclick="confirm('B?n có ch?c ch?n mu?n xóa bài này không')"><i class="fas fa-trash-alt"></i></button>
                                                </form>
                                                <button class="btn btn-primary btn-sm edit" title="S?a" id="show-emp" data-toggle="modal" data-target="#ModalUP"><i class="fas fa-edit"></i></button>
                                                <a href="viewdetailblog?blogid=${blog.blogID}" class="btn btn-primary btn-sm" title="Xem chi ti?t" style="background-color: green; color: white;">
                                                    <i class="fas fa-eye"></i>
                                                </a>
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

        <!--
        MODAL
        -->
        <div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
             data-keyboard="false">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group  col-md-12">
                                <span class="thong-tin-thanh-toan">
                                    <h5>Ch?nh s?a thông tin nhân viên c? b?n</h5>
                                </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="control-label">ID</label>
                                <input class="form-control" type="text" required value="#CD2187" disabled>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">H? và tên</label>
                                <input class="form-control" type="text" required value="Võ Tr??ng">
                            </div>
                            <div class="form-group  col-md-6">
                                <label class="control-label">S? ?i?n tho?i</label>
                                <input class="form-control" type="number" required value="09267312388">
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">??a ch? email</label>
                                <input class="form-control" type="text" required value="truong.vd2000@gmail.com">
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Ngày sinh</label>
                                <input class="form-control" type="date" value="15/03/2000">
                            </div>
                            <div class="form-group  col-md-6">
                                <label for="exampleSelect1" class="control-label">Ch?c v?</label>
                                <select class="form-control" id="exampleSelect1">
                                    <option>Bán hàng</option>
                                    <option>T? v?n</option>
                                    <option>D?ch v?</option>
                                    <option>Thu Ngân</option>
                                    <option>Qu?n kho</option>
                                    <option>B?o trì</option>
                                    <option>Ki?m hàng</option>
                                    <option>B?o v?</option>
                                    <option>T?p v?</option>
                                </select>
                            </div>
                        </div>
                        <BR>
                        <a href="#" style="    float: right;
                           font-weight: 600;
                           color: #ea0000;">Ch?nh s?a nâng cao</a>
                        <BR>
                        <BR>
                        <button class="btn btn-save" type="button">L?u l?i</button>
                        <a class="btn btn-cancel" data-dismiss="modal" href="#">H?y b?</a>
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
        <script src="${pageContext.request.contextPath}/js/manager/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/manager/popper.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/manager/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="src/jquery.table2excel.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
        <script>
            function deleteRow(r) {
                var i = r.parentNode.parentNode.rowIndex;
                document.getElementById("myTable").deleteRow(i);
            }
//            jQuery(function () {
//                jQuery(".trash").click(function () {
//                    swal({
//                        title: "C?nh báo",
//
//                        text: "B?n có ch?c ch?n là mu?n xóa nhân viên này?",
//                        buttons: ["H?y b?", "??ng ý"],
//                    })
//                            .then((willDelete) => {
//                                if (willDelete) {
//                                    swal("?ã xóa thành công.!", {
//
//                                    });
//                                }
//                            });
//                });
//            });
//            oTable = $('#sampleTable').dataTable();
//            $('#all').click(function (e) {
//                $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
//                e.stopImmediatePropagation();
//            });

            //EXCEL
            // $(document).ready(function () {
            //   $('#').DataTable({

            //     dom: 'Bfrtip',
            //     "buttons": [
            //       'excel'
            //     ]
            //   });
            // });


            //Th?i Gian
            function time() {
                var today = new Date();
                var weekday = new Array(7);
                weekday[0] = "Ch? Nh?t";
                weekday[1] = "Th? Hai";
                weekday[2] = "Th? Ba";
                weekday[3] = "Th? T?";
                weekday[4] = "Th? N?m";
                weekday[5] = "Th? Sáu";
                weekday[6] = "Th? B?y";
                var day = weekday[today.getDay()];
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                nowTime = h + " gi? " + m + " phút " + s + " giây";
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
            //In d? li?u
            var myApp = new function () {
                this.printTable = function () {
                    var tab = document.getElementById('sampleTable');
                    var win = window.open('', '', 'height=700,width=700');
                    win.document.write(tab.outerHTML);
                    win.document.close();
                    win.print();
                }
            }
            //     //Sao chép d? li?u
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