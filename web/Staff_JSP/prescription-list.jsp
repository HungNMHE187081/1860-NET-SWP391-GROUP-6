<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách đơn thuốc</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            /* Filter Form Styling */
            .filter-form {
                display: flex; /* Use flexbox for layout */
                align-items: center; /* Center items vertically */
                margin-bottom: 20px; /* Space below the form */
            }

            .filter-group {
                display: flex; /* Use flexbox for group layout */
                gap: 10px; /* Space between elements */
                flex-wrap: nowrap; /* Prevent wrapping */
            }

            .filter-group input,
            .filter-group select {
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                width: 200px; /* Set a fixed width for inputs and selects */
            }

            .filter-group button,
            .filter-group .btn {
                background-color: #333;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 10px 15px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }

            .filter-group button:hover,
            .filter-group .btn:hover {
                background-color: #575757; /* Darker shade on hover */
            }
        </style>
    </head>
    <body>
        <%@ include file="dashboardtop.jsp" %>
        <div class="main-wrapper">
            <!-- Sidebar -->
            <%@ include file="/Staff_JSP/leftside.jsp" %>

            <!-- Main Content -->
            <main>
                <section class="dashboard">
                    <h2><i class="fas fa-prescription-bottle-alt"></i> Danh sách đơn thuốc</h2>

                    <!-- Filter and Search Form -->
                    <form action="${pageContext.request.contextPath}/staff/listprescription" method="get" class="filter-form">
                        <div class="filter-group">
                            <input type="text" name="search" value="${param.search}" 
                                   placeholder="Tìm theo tên trẻ hoặc tên khách hàng" />
                            <button type="submit"><i class="fas fa-filter"></i> Lọc và tìm kiếm</button>
                        </div>
                    </form>


                    <!-- Prescription List Table -->
                    <table>
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Tên trẻ</th>
                                <th>Ngày khám</th>
                                <th>Chẩn đoán</th>
                                <th>Tên thuốc</th>
                                <th>Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty listPre}">
                                <c:forEach var="pre" items="${listPre}" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td><c:out value="${pre.childFirstName} ${pre.childMiddleName} ${pre.childLastName}" /></td>
                                        <td>
                                            <script type="text/javascript">
                                                // Lấy ngày từ reservationDates
                                                var dateStr = "${reservationDates[status.index]}";
                                                // Chuyển đổi ngày từ yyyy-MM-dd thành dd/MM/yyyy
                                                var dateParts = dateStr.split("-");
                                                var formattedDate = dateParts[2] + "/" + dateParts[1] + "/" + dateParts[0];
                                                document.write(formattedDate);
                                            </script>
                                        </td>
                                        <td><c:out value="${pre.diagnosis}" /></td>
                                        <td><c:out value="${pre.medicineName}" /></td>
                                        <td style="display: flex; align-items: center;">
                                            <a href="${pageContext.request.contextPath}/staff/viewprescription?id=${pre.prescriptionID}" class="btn" title="Xem chi tiết" style="margin-right: 5px; padding: 5px 10px; font-size: 14px; display: flex; justify-content: center; align-items: center;">
                                                <i class="fas fa-eye" style="margin: 0;"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty listPre}">
                                <tr>
                                    <td colspan="6" style="text-align: center;">Không tìm thấy đơn thuốc</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>

                </section>
            </main>
        </div>

        <!-- Footer -->
        <footer>
            <div class="container">
                <p>&copy; 2024 Child Care. All rights reserved.</p>
            </div>
        </footer>
    </body>
</html>
