<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
  <aside class="sidebar">
                <h2><i class="fas fa-list"></i> Danh mục</h2>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/staff/serviceslist"><i class="fas fa-concierge-bell"></i>Danh sách dịch vụ</a></li>
                    <li><a href="${pageContext.request.contextPath}/staff/newreservationslist"><i class="fas fa-calendar-check"></i>Danh sách lịch khám mới</a></li>
                    <li><a href="${pageContext.request.contextPath}/staff/oldreservationslist"><i class="fas fa-calendar-check"></i>Danh sách lịch đã khám</a></li>
                    <li><a href="${pageContext.request.contextPath}/staff/medicalrecordlist"><i class="fas fa-calendar-check"></i>Lịch sử khám bệnh</a></li>
                    <li><a href="${pageContext.request.contextPath}/staff/medicinelist" class="active"><i class="fas fa-prescription-bottle-alt"></i>Thuốc</a></li>
                    <li><a href="${pageContext.request.contextPath}/staff/staffslist"><i class="fas fa-users"></i>Danh sách nhân viên</a></li>
                    <li><a href="${pageContext.request.contextPath}/staff/feedbacklist"><i class="fas fa-comments"></i> Danh sách phản hồi</a></li>
                    
                </ul>
            </aside>