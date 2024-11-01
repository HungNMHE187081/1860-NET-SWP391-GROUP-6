<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thêm Lịch Khám</title>
        <!-- CSS và JS cần thiết -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <!-- Navbar Start -->
        <%@include file="dashboardtop.jsp" %>
        <!-- Navbar End -->

        <section class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <form action="${pageContext.request.contextPath}/customer/addreservation" method="post">
                            <!-- Service Information -->
                            <input type="hidden" name="serviceID" value="${service.serviceID}">

                            <div class="form-group">
                                <label for="serviceName">Tên Dịch Vụ</label>
                                <input type="text" class="form-control" id="serviceName" value="${service.serviceName}" readonly>
                            </div>

                            <div class="form-group">
                                <label for="ageLimit">Dành cho độ tuổi</label>
                                <input type="hidden" name="ageLimitID" class="form-control" id="ageLimitID" value="${ageLimit.ageLimitID}" readonly>
                                <input type="text" class="form-control" id="ageLimit" value="${ageLimit.ageLimit}" readonly>
                            </div>

                            <!-- Children List -->
                            <div class="form-group">
                                <label for="childName">Tên Trẻ</label>
                                <select class="form-control" id="childName" name="childID" required>
                                    <c:forEach var="child" items="${children}">
                                        <option value="${child.childID}">${child.firstName} ${child.middleName} ${child.lastName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- Reservation Date -->
                            <div class="form-group">
                                <label for="reservationDate">Ngày Khám</label>
                                <input type="date" class="form-control" id="reservationDate" name="reservationDate" required>
                            </div>

                            <!-- Reservation Time -->
                            <div class="form-group">
                                <label for="startTime">Giờ Khám</label>
                                <input type="time" class="form-control" id="startTime" name="startTime" required>
                            </div>

                            <!-- Staff List -->
                            <div class="form-group">
                                <label for="staffID">Bác Sĩ</label>
                                <select class="form-control" id="staffID" name="staffID" required>
                                    <c:forEach var="staff" items="${staffs}">
                                        <option value="${staff.staffID}">${staff.staffName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- Submit Button -->
                            <button type="submit" class="btn btn-primary">Thêm Lịch Khám</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="footer.jsp" %>
    </body>
</html>
