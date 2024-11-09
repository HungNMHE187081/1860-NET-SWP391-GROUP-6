<%-- 
    Document   : view-details-blog
    Created on : Oct 10, 2024, 3:09:26 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Chi tiết bài viết</title>
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
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">


                <!-- User Menu-->
                <li><a class="app-nav__item" href="/index.html"><i class='bx bx-log-out bx-rotate-180'></i> </a>

                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Danh sách bài viết</li>
                    <li class="breadcrumb-item"><a href="#">Chi tiết bài viết</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Chi tiết bài viết</h3>
                        <div class="tile-body">
                            <form action="/manager/viewdetailblog" method="get">
                                <!-- Title ở trên cùng -->
                                <div class="row">
                                    <div class="form-group col-md-12" style="font-weight: bold; font-size: 40px; font-style: italic; text-align: center;">
                                        ${blogDetails.title}
                                    </div>
                                </div>

                                <!-- CreatedAt và UpdatedAt trên cùng một hàng -->
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <strong>Tạo vào lúc:</strong> ${blogDetails.createdDate}
                                    </div>
                                    <div class="form-group col-md-6">
                                        <strong>Cập nhật vào lúc:</strong> ${blogDetails.updatedDate}
                                    </div>
                                </div>

                                <!-- Author và Views trên cùng một hàng -->
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <strong>Tác giả:</strong> ${blogDetails.authorName}
                                    </div>
                                    <div class="form-group col-md-6">
                                        <strong>Lượt xem:</strong> ${blogDetails.views}
                                    </div>
                                    <div class="form-group col-md-6">
                                        <strong>Phân Loại</strong> 
                                        <c:if test="${not empty blogDetails.categories}">
                                            ${blogDetails.categories[0].categoryName} <!-- Assuming categories is a List<BlogCategory> -->
                                        </c:if>
                                        <c:if test="${empty blogDetails.categories}">
                                            Chưa có phân loại
                                        </c:if>

                                    </div>
                                </div>

                                <!-- Thumbnail -->
                                <div class="row">
                                    <div class="form-group col-md-12 text-center">
                                        <img src="${pageContext.request.contextPath}/${blogDetails.thumbnailPath}" width="50%" alt="thumbnail"/>
                                    </div>
                                </div>

                                <!-- Status -->
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <strong>Trạng thái</strong>
                                        <c:if test="${blogDetails.isPublished}">
                                            Active
                                        </c:if>
                                        <c:if test="${!blogDetails.isPublished}">
                                            Inactive
                                        </c:if>
                                    </div>
                                </div>

                                <!-- Content ở cuối cùng -->
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <strong>Nội dung</strong>
                                        <p>${blogDetails.content}</p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Comments Section -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4>Bình luận (${comments.size()})</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <!-- Comments List -->
                        <div class="comments-list">
                            <c:forEach items="${comments}" var="comment">
                                <div class="comment-item border-bottom pb-3 mb-3">
                                    <div class="d-flex">
                                        <div class="comment-avatar">
                                            <img src="${pageContext.request.contextPath}/${comment.user.profileImage}" 
                                                 alt="user avatar" class="rounded-circle" width="40" height="40"
                                                 onerror="this.src='${pageContext.request.contextPath}/img/default-avatar.jpg'">
                                        </div>
                                        <div class="comment-content ml-3 flex-grow-1">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <h6 class="mb-1">${comment.user.firstName} ${comment.user.lastName}</h6>
                                                <small class="text-muted">${comment.createdDate}</small>
                                            </div>
                                            <p class="mb-1">${comment.content}</p>
                                            <form action="${pageContext.request.contextPath}/manager/viewdetailblog" method="POST">
                                                <input type="hidden" name="commentId" value="${comment.commentID}" />
                                                <input type="hidden" name="currentStatus" value="${comment.isApproved}" />
                                                <button type="submit">
                                                    <c:choose>
                                                        <c:when test="${comment.isApproved == 1}">
                                                            Ẩn
                                                        </c:when>
                                                        <c:otherwise>
                                                            Công khai
                                                        </c:otherwise>
                                                    </c:choose>
                                                </button>
                                            </form>
                                            <!-- Replies List -->
                                            <c:if test="${not empty comment.replies}">
                                                <div class="replies-list ml-4 mt-3">
                                                    <c:forEach items="${comment.replies}" var="reply">
                                                        <div class="reply-item border-left pl-3 mb-2">
                                                            <div class="d-flex">
                                                                <div class="reply-avatar">
                                                                    <img src="${pageContext.request.contextPath}/${reply.user.profileImage}" 
                                                                         alt="user avatar" class="rounded-circle" width="30" height="30"
                                                                         onerror="this.src='${pageContext.request.contextPath}/img/default-avatar.jpg'">
                                                                </div>
                                                                <div class="reply-content ml-2 flex-grow-1">
                                                                    <div class="d-flex justify-content-between align-items-center">
                                                                        <h6 class="mb-1">${reply.user.firstName} ${reply.user.lastName}</h6>
                                                                        <small class="text-muted">${reply.createdDate}</small>
                                                                    </div>
                                                                    <p class="mb-1">${reply.content}</p>
                                                                    <form action="${pageContext.request.contextPath}/manager/viewdetailblog" method="POST">
                                                                        <input type="hidden" name="commentId" value="${reply.commentID}" />
                                                                        <input type="hidden" name="currentStatus" value="${reply.isApproved}" />
                                                                        <button type="submit">
                                                                            <c:choose>
                                                                                <c:when test="${reply.isApproved==1}">
                                                                                    Ẩn
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    Công khai
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </button>
                                                                    </form>    
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
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
    <script src="${pageContext.request.contextPath}/js/manager/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/manager/popper.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/manager/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/manager/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/pace.min.js"></script>
    <style>
        .comment-item {
            transition: background-color 0.2s;
        }
        .comment-item:hover {
            background-color: #f8f9fa;
        }
        .reply-item {
            border-left: 2px solid #dee2e6;
        }
        .comment-avatar img, .reply-avatar img {
            object-fit: cover;
        }
        .reply-content {
            font-size: 0.95em;
        }
    </style>
</body>

</html>