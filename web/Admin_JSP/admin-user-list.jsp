<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>User List</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager/services.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

    <style>
        .iframe-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .iframe-container iframe {
            border: none;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .action-icons a {
            margin-right: 4px;
            color: #333;
            padding: 4px 6px;
            font-size: 14px;
        }

        .action-icons a:hover {
            color: #007bff;
        }

        .action-icons .btn {
            padding: 2px 6px;
            font-size: 14px;
        }
    </style>
</head>

<body onload="time()" class="app sidebar-mini rtl">
    <!-- Navbar-->
    <header class="app-header">
        <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
        <!-- Navbar Right Menu-->
        <ul class="app-nav">
            <!-- User Menu-->
            <li><a class="app-nav__item" href="${pageContext.request.contextPath}/logout"><i class='bx bx-log-out bx-rotate-180'></i> </a></li>
        </ul>
    </header>
        
            <%@ include file="dashboardleft.jsp" %>

    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-th-list"></i> Danh sách người dùng</h1>
            </div>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item">Admin</li>
                <li class="breadcrumb-item active"><a href="#">Danh sách người dùng</a></li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-body">
                        <!-- Search form -->
                        <form action="${pageContext.request.contextPath}/admin/adminsearchuser" method="GET" class="mb-3" id="searchForm" style="position: relative; display: flex; align-items: center;">
                            <div style="position: relative; flex-grow: 1;">
                                <input type="text" class="form-control" placeholder="Tên, Email, ..." name="searchTerm" value="${searchTerm}" id="searchInput" style="padding-right: 30px;">
                                <button type="button" id="clearSearch" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); border: none; background: none; font-size: 16px; cursor: pointer;">&times;
                                </button>
                            </div>
                            <button class="btn btn-primary" type="submit" style="margin-left: 10px;">Tìm kiếm</button>
                        </form>

                        <!-- Display messages -->
                        <c:if test="${not empty param.message}">
                            <div class="alert alert-success">${param.message}</div>
                        </c:if>
                        <c:if test="${not empty param.error}">
                            <div class="alert alert-danger">${param.error}</div>
                        </c:if>

                        <!-- Search results or all users -->
                        <c:if test="${not empty searchTerm}">
                            <p>Kết quả tìm kiếm: ${searchTerm}</p>
                        </c:if>

                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Họ và tên</th>
                                    <th>Email</th>
                                    <th>Chức vụ</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="counter" value="1" />
                                <c:forEach var="user" items="${userList}">
                                    <tr>
                                        <td>${counter}</td>
                                        <c:set var="counter" value="${counter + 1}" />
                                        <td>${user.firstName} ${user.middleName} ${user.lastName}</td>
                                        <td>${user.email}</td>
                                        <td>
                                            <c:forEach var="role" items="${user.roles}">
                                                ${role.roleName}<br>
                                            </c:forEach>
                                        </td>
                                        <td class="action-icons">
                                            <c:choose>
                                                <c:when test="${not empty user.roles}">
                                                    <a href="${pageContext.request.contextPath}/admin/removerole?userId=${user.userID}" class="btn btn-danger" title="Xóa chức vụ">
                                                        <i class="fa fa-user-times"></i>
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="${pageContext.request.contextPath}/admin/addrole?userId=${user.userID}" class="btn btn-primary" title="Add Role">
                                                        <i class="fa fa-user-plus"></i>
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                            <a href="${pageContext.request.contextPath}/admin/adminedituser?userId=${user.userID}" class="btn btn-warning" title="Edit">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <button onclick="confirmDelete('${user.userID}')" class="btn btn-danger" title="Xóa người dùng">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <iframe allow="microphone;" width="350" height="430" src="https://console.dialogflow.com/api-client/demo/embedded/fc42984c-aea3-4572-b8bf-b5b964f581f7">
                        </iframe>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Essential javascripts for application to work-->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>

    <script>
        document.getElementById('clearSearch').addEventListener('click', function() {
            document.getElementById('searchInput').value = '';
            document.getElementById('searchForm').submit();
        });
    </script>

    <!-- Add this script for delete confirmation -->
    <script>
        function confirmDelete(userId) {
            if (confirm('Bạn có chắc chắn muốn xóa người dùng này không?')) {
                var form = document.createElement('form');
                form.method = 'POST';
                form.action = '${pageContext.request.contextPath}/admin/deleteUser';
                var input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'userId';
                input.value = userId;
                form.appendChild(input);
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</body>

</html>