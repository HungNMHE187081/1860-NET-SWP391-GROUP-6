<%-- 
    Document   : manager-edit-blog
    Created on : Oct 27, 2024, 9:44:50 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Thêm bài viết</title>
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
        <script src="../ckeditor/ckeditor.js" type="text/javascript"></script>
        <script>

            function readURL(input, thumbimage) {
                if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#thumbimage").attr('src', e.target.result);
                    };
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
                    <li class="breadcrumb-item">Danh sách bài viết</li>
                    <li class="breadcrumb-item"><a href="#">Chỉnh sửa bài viết</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Chỉnh sửa bài viết</h3>
                        <div class="tile-body">
                          
                            <form action="${pageContext.request.contextPath}/manager/editblog" method="post" enctype="multipart/form-data" ">
                                <input type="hidden" name="blogid" value="${blogDetails.blogID}">
                                <div class="row">
                                    <!-- Title Field -->
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Title</label>
                                        <input class="form-control" type="text" name="titleEdit" value="${blogDetails.title}">
                                    </div>

                                    <!-- Author Field -->
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Author</label>
                                        <input class="form-control" type="text" name="author" value="${blogDetails.authorName}" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Phân Loại</label>
                                        <select class="form-control" id="blogCategoryEdit" name="blogCategoryEdit" >
                                            <option value="${blogDetails.categories[0].categoryID}">${blogDetails.categories[0].categoryName}</option>
                                            <c:forEach var="cate" items="${cate}">
                                                <option value="${cate.categoryID}">${cate.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <!-- Content Field (Full Width) -->
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label class="control-label">Content</label>
                                        <textarea name="contentedit" id="contentedit" class="form-control">${blogDetails.content}</textarea>
                                    </div>
                                </div>

                                <div class="row">
                                    <!-- Status Field -->
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Trạng Thái</label>
                                        <select class="form-control" name="isPublished" required>
                                            <option value="true" ${blogDetails.isPublished ? 'selected' : ''}>Công Khai</option>
                                            <option value="false" ${!blogDetails.isPublished ? 'selected' : ''}>Không Công Khai</option>
                                        </select>
                                    </div>


                                    <!-- Thumbnail Field -->
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Thumbnail</label>
                                        <div id="myfileupload">
                                            <input type="file" id="thumbNail" name="thumbNail" onchange="readURL(this);" />
                                        </div>
                                        <div id="thumbbox">
                                            <img height="200" width="200" alt="Thumb image" id="thumbimage"  style="display: ${not empty blogDetails.thumbnailPath ? 'block' : 'none'};"
                                                 src="${pageContext.request.contextPath}/${blogDetails.thumbnailPath}"/>

                                            <a class="removeimg" href="javascript:"></a>
                                        </div>
                                        <div id="boxchoice">
                                            <a href="javascript:" class="Choicefile"><i class='bx bx-upload'></i></a>
                                            <p style="clear:both"></p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Submit and Cancel Buttons -->
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <button class="btn btn-save" type="submit">Lưu lại</button>
                                        <a class="btn btn-cancel" href="/doc/table-data-table.html">Hủy bỏ</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </main>

        <script>
    CKEDITOR.replace('contentedit', {
        height: 300, 
        width: '100%', 
        filebrowserUploadUrl: '${pageContext.request.contextPath}/manager/upload', // URL của servlet để tải lên tệp
        filebrowserUploadMethod: 'form' 
       
    });
</script>

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
        <script src="${pageContext.request.contextPath}/js/manager/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/manager/popper.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/manager/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/pace.min.js"></script>


    </body>

</html>