<%-- 
    Document   : dashboardleft
    Created on : Sep 23, 2024, 10:38:31 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="/images/hay.jpg" width="50px"
                                                alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>User</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="${pageContext.request.contextPath}/manager/serviceslist"><i class='app-menu__icon bx bx-cart-alt'></i>
                        <span class="app-menu__label">Quản lí dịch vụ</span></a></li>
                <li><a class="app-menu__item " href="index.html"><i class='app-menu__icon bx bx-tachometer'></i><span
                            class="app-menu__label">Quản lí nhân viên</span></a></li>
                <li><a class="app-menu__item" href="${pageContext.request.contextPath}/manageraddress"><i class='app-menu__icon bx bx-id-card'></i>
                        <span class="app-menu__label">Quản lí địa chỉ</span></a></li>
                <li><a class="app-menu__item" href="${pageContext.request.contextPath}/manageuser"><i class='app-menu__icon bx bx-user-voice'></i><span
                            class="app-menu__label">Quản lí khách hàng</span></a></li>
                <li><a class="app-menu__item" href="table-data-product.html"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý bài viết</span></a>
                </li>
                <li><a class="app-menu__item" href="${pageContext.request.contextPath}/feedbacklist"><i class='app-menu__icon bx bx-task'></i><span
                            class="app-menu__label">Quản lí phản hồi</span></a></li>
                <li><a class="app-menu__item" href="table-data-banned.html"><i class='app-menu__icon bx bx-run'></i><span
                            class="app-menu__label">
                        </span></a></li>
                <li><a class="app-menu__item" href="table-data-money.html"><i class='app-menu__icon bx bx-dollar'></i><span
                            class="app-menu__label"></span></a></li>
                <li><a class="app-menu__item" href="quan-ly-bao-cao.html"><i
                            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label"></span></a>
                </li>
                <li><a class="app-menu__item" href="page-calendar.html"><i class='app-menu__icon bx bx-calendar-check'></i><span
                            class="app-menu__label"> </span></a></li>
                <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-cog'></i><span class="app-menu__label"></span></a></li>
            </ul>
        </aside>
