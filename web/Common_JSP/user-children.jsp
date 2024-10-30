<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Danh sách trẻ em</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel ="stylesheet" href="../css/list-children.css"/>
        <style type="text/css">

        </style>

        <script type="text/javascript">
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>
    </head>
    <%@include file="../Common_JSP/dashboardtop.jsp" %>
    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Danh sách <b>trẻ em</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="${pageContext.request.contextPath}/Common_JSP/add-children.jsp" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm mới</span></a>

                        </div>
                    </div>
                </div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Họ và Tên</th>
                            <th>Tên phụ huynh</th>
                            <th>Ngày Sinh</th>
                            <th>Giới Tính</th>
                            <th>Ảnh</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="child" items="${listChild}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${child.firstName} ${child.middleName} ${child.lastName}</td>

                                <!-- Hiển thị tên người thêm từ session -->
                                <td>${sessionScope.user.firstName} ${sessionScope.user.middleName} ${sessionScope.user.lastName}</td> <!-- Đảm bảo rằng user được thiết lập đúng -->

                                <td><fmt:formatDate value="${child.dateOfBirth}" pattern="dd-MM-yyyy" /></td>
                                <td>${child.gender}</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/${child.childImage}" 
                                         alt="Ảnh Hồ Sơ" width="50" height="50" 
                                         onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/default-avatar.jpg';" />
                                </td>
                                <td style="display: flex; align-items: center;">
                                    <form action="${pageContext.request.contextPath}/customer/editchildren" method="get" style="margin-right: 5px;">
                                        <input type="hidden" name="childID" value="${child.childID}" />
                                        <button type="submit" class="btn edit-btn" title="Sửa" 
                                                style="border: none; background: none; cursor: pointer;">
                                            <i class="material-icons" data-toggle="tooltip" title="Sửa">&#xE254;</i>
                                        </button>
                                    </form>
                                    <form action="${pageContext.request.contextPath}/customer/deletechild" method="post" style="display:inline;">
                                        <input type="hidden" name="childID" value="${child.childID}" />
                                        <button type="submit" class="btn delete-btn" 
                                                onclick="return confirm('Bạn có chắc chắn muốn xóa bản ghi này?');" 
                                                title="Xóa" style="border: none; background: none; padding: 0; cursor: pointer;">
                                            <i class="fas fa-trash-alt" style="color: red; margin-left: 5px;"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>




            </div>
        </div>

    </body>
</html>