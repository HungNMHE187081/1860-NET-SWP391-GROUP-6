<%-- 
    Document   : blog-detail
    Created on : Oct 28, 2024, 5:06:37 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <title>Doctris - Doctor Appointment Booking System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../homepage.jsp" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="../images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="../css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.9.55/css/materialdesignicons.min.css">
        <!-- SLIDER -->
        <link rel="stylesheet" href="../css/tiny-slider.css"/>

        <!-- Css -->
        <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body>
        <!-- Loader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->

        <!-- Navbar STart -->
        <%@include file="dashboardtop.jsp" %>
        <!-- Navbar End -->

        <!-- Start Hero -->
        <form action="detailcustomerblog" method="get">
            <section class="bg-half-150 d-table w-100 bg-light" style="background-image: url('${pageContext.request.contextPath}/${blog.thumbnailPath}'); background-size: cover; background-position: center;">
                <div class="container">
                    <div class="row mt-5 justify-content-center">
                        <div class="col-12">
                            <div class="section-title text-center">
                                <h3 class="sub-title mb-4">${blog.title}</h3>
                                <ul class="list-unstyled mt-4">
                                    <li class="list-inline-item user text-muted me-2"><i class="mdi mdi-account"></i> ${blog.authorName}</li>
                                    <li class="list-inline-item date text-muted"><i class="mdi mdi-calendar-check"></i>${blog.createdDate}</li>
                                </ul>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->
            </section><!--end section-->
        </form>
        <div class="position-relative">
            <div class="shape overflow-hidden text-white">
                <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M0 48H1437.5H2880V0H2160C1442.5 52 720 0 720 0H0V48Z" fill="currentColor"></path>
                </svg>
            </div>
        </div>
        <!-- End Hero -->

        <!-- Start -->
        <section class="section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-7">
                        <form action="detailcustomerblog" method="get">
                            <p class="text-muted mt-4">${blog.content}</p>

                        </form>
                        <h5 class="card-title mt-4 mb-0">Comments :</h5>

                        <ul class="media-list list-unstyled mb-0">
                            <c:if test="${empty comments}">
                                <p>No comments available.</p>
                            </c:if>
                            <p>Blog ID: <c:out value="${blogId}"/></p>
                            <c:forEach var="comment" items="${comments}">
                                <li class="mt-4">
                                    <!-- Comment Header -->
                                    <div class="d-flex justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <a class="pe-3" href="#">
                                                <img src="${pageContext.request.contextPath}/${comment.user.profileImage}" class="img-fluid avatar avatar-md-sm rounded-circle shadow" alt="img">
                                            </a>
                                            <div class="commentor-detail">
                                                <h6 class="mb-0">
                                                    <a href="javascript:void(0)" class="media-heading text-dark">
                                                        ${comment.user.firstName} ${comment.user.lastName}
                                                    </a>
                                                </h6>
                                                <small class="text-muted">
                                                    <fmt:formatDate value="${comment.createdDate}" pattern="dd MMMM, yyyy 'at' hh:mm a" />
                                                </small>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <!-- Edit/Delete buttons moved here for main comment -->
                                            <c:if test="${comment.user.userID == user.userID}">
                                                <a href="javascript:void(0)" class="text-muted me-2" onclick="editComment(${comment.commentID})">Edit</a>
                                                <a href="javascript:void(0)" class="text-muted me-2" onclick="if (confirm('Are you sure you want to delete this comment?')) {
                                    deleteComment(${comment.commentID}, ${blog.blogID});
                                }">Delete</a>
                                            </c:if>
                                            <a href="javascript:void(0)" class="text-muted" onclick="toggleReplyForm(${comment.commentID})">
                                                <i class="mdi mdi-reply"></i> Reply
                                            </a>
                                        </div>
                                    </div>

                                    <!-- Comment Content -->
                                    <div class="mt-3">
                                        <p class="text-muted font-italic p-3 bg-light rounded">${comment.content}</p>
                                    </div>

                                    <!-- Edit Form for Main Comment -->
                                    <form action="${pageContext.request.contextPath}/customer/editblogcomment" method="post" class="mt-3 reply-form" id="editForm-${comment.commentID}" style="display: none;">
                                        <input type="hidden" name="blogID" value="${blog.blogID}" />
                                        <input type="hidden" name="commentID" value="${comment.commentID}" />
                                        <div class="mb-3">
                                            <textarea id="replyMessage-${comment.commentID}" placeholder="Your Reply" rows="3" name="editcontent" class="form-control" required="">${comment.content}</textarea>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </form>

                                    <!-- Reply Form for Main Comment -->
                                    <form action="${pageContext.request.contextPath}/customer/detailcustomerblog" method="post" class="mt-3 reply-form" id="replyForm-${comment.commentID}" style="display: none;">
                                        <input type="hidden" name="blogID" value="${blog.blogID}" />
                                        <input type="hidden" name="parentID" value="${comment.commentID}" />
                                        <div class="mb-3">
                                            <textarea id="replyMessage-${comment.commentID}" placeholder="Your Reply" rows="3" name="message" class="form-control" required=""></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Reply</button>
                                    </form>

                                    <!-- Replies Section -->
                                    <ul class="list-unstyled ps-4 ps-md-5 sub-comment">
                                        <c:forEach var="reply" items="${comment.replies}">
                                            <li class="mt-4">
                                                <!-- Reply Header -->
                                                <div class="d-flex justify-content-between">
                                                    <div class="d-flex align-items-center">
                                                        <a class="pe-3" href="#">
                                                            <img src="${pageContext.request.contextPath}/${reply.user.profileImage}" class="img-fluid avatar avatar-md-sm rounded-circle shadow" alt="img">
                                                        </a>
                                                        <div class="commentor-detail">
                                                            <h6 class="mb-0">
                                                                <a href="javascript:void(0)" class="media-heading text-dark">
                                                                    ${reply.user.firstName} ${reply.user.lastName}
                                                                </a>
                                                            </h6>
                                                            <small class="text-muted">
                                                                <fmt:formatDate value="${reply.createdDate}" pattern="dd MMMM, yyyy 'at' hh:mm a" />
                                                            </small>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex align-items-center">
                                                        <!-- Edit/Delete buttons moved here for replies -->
                                                        <c:if test="${reply.user.userID == user.userID}">
                                                            <a href="javascript:void(0)" class="text-muted me-2" onclick="editComment(${reply.commentID})">Edit</a>
                                                            <a href="javascript:void(0)" class="text-muted me-2" onclick="if (confirm('Are you sure you want to delete this comment?')) {
                                                deleteComment(${reply.commentID}, ${blog.blogID});
                                            }">Delete</a>
                                                        </c:if>
                                                        <a href="javascript:void(0)" class="text-muted" onclick="toggleReplyForm(${reply.commentID})">
                                                            <i class="mdi mdi-reply"></i> Reply
                                                        </a>
                                                    </div>
                                                </div>

                                                <!-- Reply Content -->
                                                <div class="mt-3">
                                                    <p class="text-muted font-italic p-3 bg-light rounded">${reply.content}</p>
                                                </div>

                                                <!-- Edit Form for Reply -->
                                                <form action="${pageContext.request.contextPath}/customer/editblogcomment" method="post" class="mt-3 reply-form" id="editForm-${reply.commentID}" style="display: none;">
                                                    <input type="hidden" name="blogID" value="${blog.blogID}" />
                                                    <input type="hidden" name="commentID" value="${reply.commentID}" />
                                                    <div class="mb-3">
                                                        <textarea id="replyMessage-${reply.commentID}" placeholder="Your Reply" rows="3" name="editcontent" class="form-control" required="">${reply.content}</textarea>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Save</button>
                                                </form>

                                                <!-- Reply Form for Reply -->
                                                <form action="${pageContext.request.contextPath}/customer/detailcustomerblog" method="post" class="mt-3 reply-form" id="replyForm-${reply.commentID}" style="display: none;">
                                                    <input type="hidden" name="blogID" value="${blog.blogID}" />
                                                    <input type="hidden" name="parentID" value="${comment.commentID}" />
                                                    <div class="mb-3">
                                                        <textarea id="replyMessage-${reply.commentID}" placeholder="Your Reply" rows="3" name="message" class="form-control" required=""></textarea>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Reply</button>
                                                </form>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:forEach>
                        </ul>

                        <h5 class="card-title mt-4 mb-0">Leave A Comment :</h5>
                         <c:if test="${not empty errors}">
                                        <div class="alert alert-danger">
                                            <ul>
                                                <c:forEach items="${errors}" var="error">
                                                    <li>${error}</li>
                                                    </c:forEach>
                                            </ul>
                                        </div>
                                    </c:if>
                        <form action="${pageContext.request.contextPath}/customer/detailcustomerblog" method="post" class="mt-3">
                            <input type="hidden" name="blogID" value="${blog.blogID}" />
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label class="form-label">Your Comment</label>
                                        <textarea id="message" placeholder="Your Comment" rows="5" name="message" class="form-control" required=""></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="send d-grid">
                                        <button type="submit" class="btn btn-primary">Send Message</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div><!--end col-->
                    <script>
                        function toggleReplyForm(commentID) {
                            var replyForm = document.getElementById("replyForm-" + commentID);
                            if (replyForm.style.display === "none" || replyForm.style.display === "") {
                                replyForm.style.display = "block";
                            } else {
                                replyForm.style.display = "none";
                            }
                        }
                        function editComment(commentID) {
                            var editForm = document.getElementById("editForm-" + commentID);
                            if (editForm.style.display === "none" || editForm.style.display === "") {
                                editForm.style.display = "block";
                            } else {
                                editForm.style.display = "none";
                            }
                        }
                        function deleteComment(commentID, blogID) {
                            const form = document.createElement('form');
                            form.method = 'get';
                            form.action = '${pageContext.request.contextPath}/customer/editblogcomment';

                            const commentIdInput = document.createElement('input');
                            commentIdInput.type = 'hidden';
                            commentIdInput.name = 'commentID';
                            commentIdInput.value = commentID;

                            const blogIdInput = document.createElement('input');
                            blogIdInput.type = 'hidden';
                            blogIdInput.name = 'blogID';
                            blogIdInput.value = blogID;

                            form.appendChild(commentIdInput);
                            form.appendChild(blogIdInput);
                            document.body.appendChild(form);
                            form.submit();
                        }
                    </script>
                    <div class="col-lg-4 col-md-5 mt-4 mt-sm-0 pt-2 pt-sm-0">
                        <div class="card border-0 sidebar sticky-bar rounded shadow">
                            <div class="card-body">
                                <!-- SEARCH -->
                                <div class="widget mb-4 pb-2">
                                    <h5 class="widget-title">Search</h5>
                                    <div id="search2" class="widget-search mt-4 mb-0">
                                        <form role="search" method="get" id="searchform" class="searchform">
                                            <div>
                                                <input type="text" class="border rounded" name="s" id="s" placeholder="Search Keywords...">
                                                <input type="submit" id="searchsubmit" value="Search">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- SEARCH -->

                                <!-- RECENT POST -->
                                <div class="widget mb-4 pb-2">
                                    <h5 class="widget-title">Recent Post</h5>
                                    <div class="mt-4">
                                        <c:forEach items="${lastestBlog}" var="latest">
                                            <div class="clearfix post-recent">
                                                <div class="post-recent-thumb float-start"> <a href="${pageContext.request.contextPath}/customer/detailcustomerblog?blogID=${latest.blogID}"> <img alt="img" src="${pageContext.request.contextPath}/${latest.thumbnailPath}" class="img-fluid rounded"></a></div>
                                                <div class="post-recent-content float-start"><a href="${pageContext.request.contextPath}/customer/detailcustomerblog?blogID=${latest.blogID}">${latest.title}</a><span class="text-muted mt-2">${latest.createdDate}</span></div>
                                            </div>      
                                        </c:forEach>
                                    </div>
                                </div>
                                <!-- RECENT POST -->

                                <!-- TAG CLOUDS -->
                                <div class="widget mb-4 pb-2">
                                    <h5 class="widget-title">Tags Cloud</h5>
                                    <div class="tagcloud mt-4">
                                        <a href="jvascript:void(0)" class="rounded">Business</a>
                                        <a href="jvascript:void(0)" class="rounded">Finance</a>
                                        <a href="jvascript:void(0)" class="rounded">Marketing</a>
                                        <a href="jvascript:void(0)" class="rounded">Fashion</a>
                                        <a href="jvascript:void(0)" class="rounded">Bride</a>
                                        <a href="jvascript:void(0)" class="rounded">Lifestyle</a>
                                        <a href="jvascript:void(0)" class="rounded">Travel</a>
                                        <a href="jvascript:void(0)" class="rounded">Beauty</a>
                                        <a href="jvascript:void(0)" class="rounded">Video</a>
                                        <a href="jvascript:void(0)" class="rounded">Audio</a>
                                    </div>
                                </div>
                                <!-- TAG CLOUDS -->

                                <!-- SOCIAL -->
                                <div class="widget">
                                    <h5 class="widget-title">Follow us</h5>
                                    <ul class="list-unstyled social-icon mb-0 mt-4">
                                        <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="facebook" class="fea icon-sm fea-social"></i></a></li>
                                        <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="instagram" class="fea icon-sm fea-social"></i></a></li>
                                        <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="twitter" class="fea icon-sm fea-social"></i></a></li>
                                        <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="linkedin" class="fea icon-sm fea-social"></i></a></li>
                                        <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="github" class="fea icon-sm fea-social"></i></a></li>
                                        <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="youtube" class="fea icon-sm fea-social"></i></a></li>
                                        <li class="list-inline-item"><a href="javascript:void(0)" class="rounded"><i data-feather="gitlab" class="fea icon-sm fea-social"></i></a></li>
                                    </ul><!--end icon-->
                                </div>
                                <!-- SOCIAL -->
                            </div>
                        </div>
                    </div>
                </div><!--end row-->
            </div><!--end container-->

            <div class="container mt-100 mt-60">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h4 class="title mb-0">Related Post:</h4>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row">
                    <c:forEach items="${releatedBlog}" var="releated">
                        <div class="col-lg-12 mt-4 pt-2">
                            <div class="slider-range-three">                                                   
                                <div class="tiny-slide">
                                    <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                        <img src="${pageContext.request.contextPath}/${releated.thumbnailPath}" class="img-fluid" alt="">
                                        <div class="card-body p-4">
                                            <ul class="list-unstyled mb-2">
                                                <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>${releated.createdDate}</li>
                                                <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>${releated.views}</li>
                                            </ul>
                                            <a href="${pageContext.request.contextPath}/customer/detailcustomerblog?blogID=${releated.blogID}" class="text-dark title h5">${releated.title}</a>
                                            <div class="post-meta d-flex justify-content-between mt-3">

                                                <a href="${pageContext.request.contextPath}/customer/detailcustomerblog?blogID=${releated.blogID}" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!--end col-->
                    </c:forEach>
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- End -->

        <!-- Start -->
        <footer class="bg-footer">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-4 mb-0 mb-md-4 pb-0 pb-md-2">
                        <a href="#" class="logo-footer">
                            <img src="../images/logo-light.png" height="22" alt="">
                        </a>
                        <p class="mt-4 me-xl-5">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                    </div><!--end col-->

                    <div class="col-xl-7 col-lg-8 col-md-12">
                        <div class="row">
                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                <h5 class="text-light title-dark footer-head">Company</h5>
                                <ul class="list-unstyled footer-list mt-4">
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> About us</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Services</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Team</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Project</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Blog</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Login</a></li>
                                </ul>
                            </div><!--end col-->

                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                <h5 class="text-light title-dark footer-head">Departments</h5>
                                <ul class="list-unstyled footer-list mt-4">
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Eye Care</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Psychotherapy</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Dental Care</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Orthopedic</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Cardiology</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Gynecology</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Neurology</a></li>
                                </ul>
                            </div><!--end col-->

                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                <h5 class="text-light title-dark footer-head">Contact us</h5>
                                <ul class="list-unstyled footer-list mt-4">
                                    <li class="d-flex align-items-center">
                                        <i data-feather="mail" class="fea icon-sm text-foot align-middle"></i>
                                        <a href="mailto:contact@example.com" class="text-foot ms-2">contact@example.com</a>
                                    </li>

                                    <li class="d-flex align-items-center">
                                        <i data-feather="phone" class="fea icon-sm text-foot align-middle"></i>
                                        <a href="tel:+152534-468-854" class="text-foot ms-2">+152 534-468-854</a>
                                    </li>

                                    <li class="d-flex align-items-center">
                                        <i data-feather="map-pin" class="fea icon-sm text-foot align-middle"></i>
                                        <a href="javascript:void(0)" class="video-play-icon text-foot ms-2">View on Google map</a>
                                    </li>
                                </ul>

                                <ul class="list-unstyled social-icon footer-social mb-0 mt-4">
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="facebook" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="instagram" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="twitter" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="linkedin" class="fea icon-sm fea-social"></i></a></li>
                                </ul><!--end icon-->
                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->

            <div class="container mt-5">
                <div class="pt-4 footer-bar">
                    <div class="row align-items-center">
                        <div class="col-sm-6">
                            <div class="text-sm-start text-center">
                                <p class="mb-0"><script>document.write(new Date().getFullYear())</script> © Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="../../../index.html" target="_blank" class="text-reset">Shreethemes</a>.</p>
                            </div>
                        </div><!--end col-->

                        <div class="col-sm-6 mt-4 mt-sm-0">
                            <ul class="list-unstyled footer-list text-sm-end text-center mb-0">
                                <li class="list-inline-item"><a href="terms.html" class="text-foot me-2">Terms</a></li>
                                <li class="list-inline-item"><a href="privacy.html" class="text-foot me-2">Privacy</a></li>
                                <li class="list-inline-item"><a href="aboutus.html" class="text-foot me-2">About</a></li>
                                <li class="list-inline-item"><a href="contact.html" class="text-foot me-2">Contact</a></li>
                            </ul>
                        </div><!--end col-->
                    </div><!--end row-->
                </div>
            </div><!--end container-->
        </footer><!--end footer-->
        <!-- End -->

        <!-- Back to top -->
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
        <!-- Back to top -->

        <!-- Offcanvas Start -->
        <div class="offcanvas bg-white offcanvas-top" tabindex="-1" id="offcanvasTop">
            <div class="offcanvas-body d-flex align-items-center align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="text-center">
                                <h4>Search now.....</h4>
                                <div class="subcribe-form mt-4">
                                    <form>
                                        <div class="mb-0">
                                            <input type="text" id="help" name="name" class="border bg-white rounded-pill" required="" placeholder="Search">
                                            <button type="submit" class="btn btn-pills btn-primary">Search</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->
            </div>
        </div>
        <!-- Offcanvas End -->

        <!-- Offcanvas Start -->
        <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header p-4 border-bottom">
                <h5 id="offcanvasRightLabel" class="mb-0">
                    <img src="../assets/images/logo-dark.png" height="24" class="light-version" alt="">
                    <img src="../assets/images/logo-light.png" height="24" class="dark-version" alt="">
                </h5>
                <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas" aria-label="Close"><i class="uil uil-times fs-4"></i></button>
            </div>
            <div class="offcanvas-body p-4 px-md-5">
                <div class="row">
                    <div class="col-12">
                        <!-- Style switcher -->
                        <div id="style-switcher">
                            <div>
                                <ul class="text-center list-unstyled mb-0">
                                    <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="../images/layouts/landing-light-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="ltr-version t-ltr-light" onclick="setTheme('style')"><img src="../images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-rtl-version t-rtl-dark" onclick="setTheme('style-dark-rtl')"><img src="../images/layouts/landing-dark-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-ltr-version t-ltr-dark" onclick="setTheme('style-dark')"><img src="../images/layouts/landing-dark.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-version t-dark mt-4" onclick="setTheme('style-dark')"><img src="../images/layouts/landing-dark.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Dark Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="light-version t-light mt-4" onclick="setTheme('style')"><img src="../images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Light Version</span></a></li>
                                    <li class="d-grid"><a href="../admin/index.html" target="_blank" class="mt-4"><img src="../images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Admin Dashboard</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- end Style switcher -->
                    </div><!--end col-->
                </div><!--end row-->
            </div>

            <div class="offcanvas-footer p-4 border-top text-center">
                <ul class="list-unstyled social-icon mb-0">
                    <li class="list-inline-item mb-0"><a href="https://1.envato.market/doctris-template" target="_blank" class="rounded"><i class="uil uil-shopping-cart align-middle" title="Buy Now"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://dribbble.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-dribbble align-middle" title="dribbble"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://www.facebook.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-facebook-f align-middle" title="facebook"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://www.instagram.com/shreethemes/" target="_blank" class="rounded"><i class="uil uil-instagram align-middle" title="instagram"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://twitter.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-twitter align-middle" title="twitter"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="mailto:support@shreethemes.in" class="rounded"><i class="uil uil-envelope align-middle" title="email"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="../../../index.html" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
                </ul><!--end icon-->
            </div>
        </div>
        <!-- Offcanvas End -->

        <!-- javascript -->
        <script src="${pageContext.request.contextPath}/js/tiny-slider.js"></script>
        <script src="${pageContext.request.contextPath}/js/tiny-slider-init.js"></script>

        <script>
                                            let hasViewBeenCounted = false; // Biến để kiểm tra xem đã tính view chưa

                                            // Hàm để tăng view
                                            function incrementView(blogId) {
                                                if (!hasViewBeenCounted) { // Chỉ tăng view một lần
                                                    $.ajax({
                                                        url: '${pageContext.request.contextPath}/customer/bloglist',
                                                        type: 'POST',
                                                        data: {blogID: blogId},
                                                        success: function () {
                                                            console.log("View has been counted!");
                                                            hasViewBeenCounted = true;
                                                        },
                                                        error: function () {
                                                            console.log("Error updating view.");
                                                        }
                                                    });
                                                }
                                            }

                                            // Bắt đầu đếm thời gian khi trang được load
                                            document.addEventListener('DOMContentLoaded', function () {
                                                // Chờ 1 phút (60000 milliseconds) trước khi tăng view
                                                setTimeout(function () {
                                                    const blogId = '${blog.blogID}'; // Lấy ID của blog đang đọc
                                                    incrementView(blogId);
                                                }, 2000);
                                            });
        </script>

    </body>

</html>
