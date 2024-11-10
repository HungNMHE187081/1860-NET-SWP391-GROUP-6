<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager/services.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    
    <style>
        .tile {
            background: white;
            border-radius: 15px;
            box-shadow: 0 0.15rem 1.75rem rgba(33, 40, 50, 0.15);
            padding: 1.5rem;
        }

        .profile-image-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            text-align: center;
            margin-bottom: 2rem;
        }

        .profile-image-container {
            width: 200px;
            height: 200px;
            margin: 0 auto 1.5rem;
            position: relative;
            border-radius: 50%;
            border: 5px solid white;
            box-shadow: 0 0 20px rgba(0,0,0,0.15);
            overflow: hidden;
        }

        .profile-image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .image-upload-wrapper {
            position: relative;
            margin-top: 1rem;
        }

        .custom-file-upload {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background: linear-gradient(135deg, #97ABFF 10%, #123597 100%);
            color: white;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .custom-file-upload:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.25);
        }

        .form-container {
            max-width: 800px;
            margin: auto;
            padding: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-control {
            border-radius: 8px;
            border: 1px solid #e3e6f0;
            padding: 0.75rem;
        }

        .form-control:focus {
            border-color: #4e73df;
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
        }

        .btn-primary {
            background: linear-gradient(135deg, #6B73FF 0%, #000DFF 100%);
            border: none;
            border-radius: 8px;
            padding: 0.75rem 1.5rem;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .row-flex {
            display: flex;
            flex-wrap: wrap;
            margin: -10px;
        }

        .col-flex {
            flex: 1;
            padding: 10px;
            min-width: 250px;
        }

        input[type="file"] {
            display: none;
        }

        .alert-danger {
            background-color: #f8d7da;
            border-color: #f5c6cb;
            color: #721c24;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 8px;
        }

        .alert-danger i {
            margin-right: 8px;
            color: #dc3545;
        }

        .alert-danger div {
            margin-bottom: 5px;
        }

        .alert-danger div:last-child {
            margin-bottom: 0;
        }
    </style>
</head>
<body class="app sidebar-mini rtl">
    <!-- Navbar-->
    <header class="app-header">
        <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
        <ul class="app-nav">
            <li><a class="app-nav__item" href="${pageContext.request.contextPath}/logout">
                <i class='bx bx-log-out bx-rotate-180'></i>
            </a></li>
        </ul>
    </header>

    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <%@ include file="dashboardleft.jsp" %>

    <main class="app-content">
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">Chỉnh sửa thông tin người dùng</h3>
                    <div class="tile-body">
                        <!-- Thêm div hiển thị lỗi với style rõ ràng -->
                        <c:if test="${not empty errors}">
                            <div class="alert alert-danger" role="alert" style="margin-bottom: 20px;">
                                <c:forEach items="${errors}" var="error">
                                    <div><i class="fas fa-exclamation-circle"></i> ${error}</div>
                                </c:forEach>
                            </div>
                        </c:if>
                        
                        <!-- Thêm thông báo thành công -->
                        <c:if test="${not empty success}">
                            <div class="alert alert-success">
                                ${success}
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/admin/adminedituser" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                            <input type="hidden" name="userId" value="${user.userID}">
                            
                            <div class="row">
                                <!-- Profile Image Section - Cột trái -->
                                <div class="col-md-3">
                                    <div class="profile-image-section">
                                        <div class="profile-image-container">
                                            <c:choose>
                                                <c:when test="${not empty user.profileImage}">
                                                    <img id="imagePreview" src="${pageContext.request.contextPath}/${user.profileImage}" alt="Profile Image">
                                                </c:when>
                                                <c:otherwise>
                                                    <img id="imagePreview" src="${pageContext.request.contextPath}/UserProfilesImages/default-avatar.jpg" alt="Default Profile Image">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="image-upload-wrapper">
                                            <label for="profileImage" class="custom-file-upload">
                                                <i class="fas fa-camera"></i> Chọn ảnh mới
                                            </label>
                                            <input type="file" name="profileImage" id="profileImage" style="display: none;" onchange="previewImage(event)">
                                        </div>
                                    </div>
                                </div>

                                <!-- User Information Section - Cột phải -->
                                <div class="col-md-9">
                                    <div class="row">
                                        <!-- Name Fields -->
                                        <div class="form-group col-md-4">
                                            <label>Họ <span class="text-danger">*</span></label>
                                            <input type="text" name="firstName" value="${user.firstName}" 
                                                   class="form-control" 
                                                   pattern="^[A-Za-zÀ-ỹ\s]{2,50}$"
                                                   title="Họ phải từ 2-50 ký tự và không chứa số hoặc ký tự đặc biệt"
                                                   required>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Tên <span class="text-danger">*</span></label>
                                            <input type="text" name="lastName" value="${user.lastName}" 
                                                   class="form-control"
                                                   pattern="^[A-Za-zÀ-ỹ\s]{2,50}$"
                                                   title="Tên phải từ 2-50 ký tự và không chứa số hoặc ký tự đặc biệt"
                                                   required>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Tên đệm</label>
                                            <input type="text" name="middleName" value="${user.middleName}" class="form-control">
                                        </div>

                                        <!-- Contact Information -->
                                        <div class="form-group col-md-6">
                                            <label>Email <span class="text-danger">*</span></label>
                                            <input type="email" name="email" value="${user.email}" 
                                                   class="form-control"
                                                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                                   title="Vui lòng nhập email hợp lệ"
                                                   required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Số điện thoại</label>
                                            <input type="tel" name="phoneNumber" value="${user.phoneNumber}" 
                                                   class="form-control"
                                                   pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b"
                                                   title="Số điện thoại phải có 10 số">
                                        </div>

                                        <!-- Personal Details -->
                                        <div class="form-group col-md-4">
                                            <label>Ngày sinh</label>
                                            <input type="date" name="dateOfBirth" 
                                                   value="<fmt:formatDate value="${user.dateOfBirth}" pattern="yyyy-MM-dd" />" 
                                                   class="form-control" >
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Giới tính</label>
                                            <select name="gender" class="form-control" >
                                                <option value="Nam" ${user.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                                <option value="Nữ" ${user.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                                <option value="Khác" ${user.gender == 'Khác' ? 'selected' : ''}>Khác</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>CCCD/CMND</label>
                                            <input type="text" name="citizenIdentification" 
                                                   value="${user.citizenIdentification}" 
                                                   class="form-control"
                                                   pattern="^[0-9]{9}$|^[0-9]{12}$"
                                                   title="CCCD/CMND phải có 9 hoặc 12 số">
                                        </div>

                                        <!-- Submit Buttons -->
                                        <div class="form-group col-md-12 text-center">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fas fa-save"></i> Lưu thay đổi
                                            </button>
                                            <a href="${pageContext.request.contextPath}/admin/adminuserslist" class="btn btn-secondary">
                                                <i class="fas fa-arrow-left"></i> Quay lại
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main> 

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script>
        function previewImage(event) {
            const image = document.getElementById('imagePreview');
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    image.src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        }

        function validateForm() {
            const errorDiv = document.getElementById('errorMessages');
            let errors = [];
            
            // Validate họ tên
            const firstName = document.getElementsByName('firstName')[0].value;
            const lastName = document.getElementsByName('lastName')[0].value;
            if (!/^[A-Za-zÀ-ỹ\s]{2,50}$/.test(firstName)) {
                errors.push("Họ không hợp lệ");
            }
            if (!/^[A-Za-zÀ-ỹ\s]{2,50}$/.test(lastName)) {
                errors.push("Tên không hợp lệ");
            }

            // Validate email
            const email = document.getElementsByName('email')[0].value;
            if (!/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/.test(email)) {
                errors.push("Email không hợp lệ");
            }

            // Validate số điện thoại
            const phone = document.getElementsByName('phoneNumber')[0].value;
            if (phone && !/(84|0[3|5|7|8|9])+([0-9]{8})\b/.test(phone)) {
                errors.push("Số điện thoại không hợp lệ");
            }

            // Validate CCCD/CMND
            const cccd = document.getElementsByName('citizenIdentification')[0].value;
            if (cccd && !/^[0-9]{9}$|^[0-9]{12}$/.test(cccd)) {
                errors.push("CCCD/CMND phải có 9 hoặc 12 số");
            }

            // Validate ngày sinh
            const dob = document.getElementsByName('dateOfBirth')[0].value;
            if (dob) {
                const dobDate = new Date(dob);
                const today = new Date();
                const age = today.getFullYear() - dobDate.getFullYear();
                if (age < 18) {
                    errors.push("Người dùng phải từ 18 tuổi trở lên");
                }
            }

            // Hiển thị lỗi nếu có
            if (errors.length > 0) {
                errorDiv.innerHTML = errors.join('<br>');
                errorDiv.style.display = 'block';
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
