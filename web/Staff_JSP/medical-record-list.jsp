<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Danh sách hồ sơ y tế</title>
    </head>
     <%@ include file="/Staff_JSP/leftside.jsp" %>
    <body>
        <h1>Danh sách Hồ Sơ Y Tế</h1>
        <table border="1" cellspacing="0" cellpadding="10">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên Trẻ</th>
                    <th>Chẩn Đoán</th>
                    <th>Điều Trị</th>
                    <th>Ghi Chú</th>
                    <th>Ngày Ghi Nhận</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="record" items="${records}">
                    <tr>
                        <td>${record.recordID}</td>
                        <td>${record.firstNameChild} ${record.middleNameChild} ${record.lastNameChild}</td>
                        <td>${record.diagnosis}</td>
                        <td>${record.treatment}</td>
                        <td>${record.notes}</td>
                        <td>${record.recordDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
