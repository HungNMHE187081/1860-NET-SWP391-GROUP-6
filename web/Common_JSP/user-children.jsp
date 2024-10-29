<!DOCTYPE html>
<html lang="en">
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Danh sách trẻ em</title>
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
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm mới</span></a>
                           
                        </div>
                    </div>
                </div>
              <table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>STT</th>
            <th>Tên trẻ</th>
            <th>Tên phụ huynh</th>
            <th>Ngày sinh trẻ</th>
            <th>Giới tính trẻ</th>
            <th>Ảnh đại diện</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="child" items="${listChild}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${child.firstName} ${child.middleName} ${child.lastName}</td>
                <td>${sessionScope.user.firstName} ${sessionScope.user.middleName} ${sessionScope.user.lastName}</td>
                <td>${child.dateOfBirth}</td>
                <td>${child.gender}</td>
                <td>
                    <img src="${child.childImage}" alt="Profile Picture" width="50" height="50" />
                    <a href="#editEmployeeModal" class="edit" data-toggle="modal">
                        <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                    </a>
                    <a href="#deleteEmployeeModal" class="delete" data-toggle="modal">
                        <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

                
            </div>
        </div>
      
    </body>
</html>