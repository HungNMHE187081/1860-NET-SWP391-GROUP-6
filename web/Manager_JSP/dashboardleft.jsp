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
            <li><a class="app-menu__item" href="${pageContext.request.contextPath}/manager/viewprofile"><i class='app-menu__icon bx bx-id-card'></i>
                    <span class="app-menu__label">Xem hồ sơ cá nhân</span></a></li>
        </div>
    </div>
    <hr>
    <ul class="app-menu">
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/manager/serviceslist"><i class='app-menu__icon bx bx-cart-alt'></i>
                <span class="app-menu__label">Quản lí dịch vụ</span></a></li>
        <li><a class="app-menu__item " href="${pageContext.request.contextPath}/manager/staffslist"><i class='app-menu__icon bx bx-tachometer'></i><span
                    class="app-menu__label">Quản lí nhân viên</span></a></li>
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/manager/reservationslist"><i class='app-menu__icon bx bx-task'></i><span
                    class="app-menu__label">Quản lí lịch khám</span></a></li>
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/manageraddress"><i class='app-menu__icon bx bx-id-card'></i>
                <span class="app-menu__label">Quản lí địa chỉ</span></a></li>
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/manageuser"><i class='app-menu__icon bx bx-user-voice'></i><span
                    class="app-menu__label">Quản lí khách hàng</span></a></li>
        <li><a class="app-menu__item" href="manageblog">
                <i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý bài viết</span></a>
        </li>
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/feedbacklist"><i class='app-menu__icon bx bx-task'></i><span
                    class="app-menu__label">Quản lí phản hồi</span></a></li>
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/logout"><i class='app-menu__icon bx bx-log-out'></i><span
                    class="app-menu__label">Logout</span></a></li>            
    </ul>
</aside>
