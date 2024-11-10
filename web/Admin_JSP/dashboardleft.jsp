<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user">
        <div>
            <p class="app-sidebar__user-designation">Welcome back!</p>
            <a class="app-menu__item" href="${pageContext.request.contextPath}/admin/viewprofile">
                <i class='app-menu__icon bx bx-id-card'></i>
                <span class="app-menu__label">Thông tin cá nhân</span>
            </a>
        </div>
    </div>
    <hr>
    <ul class="app-menu">
        <li>
            <a class="app-menu__item" href="${pageContext.request.contextPath}/admin/dashboard">
                <i class='app-menu__icon bx bx-tachometer'></i>
                <span class="app-menu__label">Thống kê</span>
            </a>
        </li>
        <li>
            <a class="app-menu__item" href="${pageContext.request.contextPath}/admin/adminuserslist">
                <i class='app-menu__icon bx bx-user-voice'></i>
                <span class="app-menu__label">Quản lí người dùng</span>
            </a>
        </li>
        <li>
            <a class="app-menu__item" href="${pageContext.request.contextPath}/admin/adminadduser">
                <i class='app-menu__icon bx bx-purchase-tag-alt'></i>
                <span class="app-menu__label">Tạo tài khoản nhân viên</span>
            </a>
        </li>
</aside>
