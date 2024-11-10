<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm nhân viên mới</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <style>
            :root {
                --primary-color: #4e73df;
            }
            
            /* Profile Image Section */
            .profile-image-section {
                background: white;
                border-radius: 15px;
                padding: 2rem;
                text-align: center;
                box-shadow: 0 0.15rem 1.75rem rgba(33, 40, 50, 0.15);
                margin-bottom: 2rem;
            }

            .profile-image-container {
                width: 200px;
                height: 200px;
                margin: 0 auto 1.5rem;
                position: relative;
                border-radius: 50%;
                border: 5px solid #f8f9fc;
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
                overflow: hidden;
                background-color: #fff;
            }

            .profile-image-container img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                display: block;
            }

            .image-upload-wrapper {
                margin-top: 1rem;
                text-align: center;
            }

            .custom-file-upload {
                background: var(--primary-color);
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                display: inline-block;
                transition: all 0.3s ease;
                font-size: 14px;
                border: none;
            }

            .custom-file-upload:hover {
                background: #2e59d9;
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            }

            .custom-file-upload i {
                margin-right: 8px;
            }

            input[type="file"] {
                display: none;
            }

            /* Thêm animation cho preview ảnh */
            @keyframes fadeIn {
                from { opacity: 0; }
                to { opacity: 1; }
            }

            #imagePreview {
                animation: fadeIn 0.3s ease-in-out;
            }

            .alert-danger {
                background-color: #f8d7da;
                border-color: #f5c6cb;
                color: #721c24;
                padding: 15px;
                margin-bottom: 20px;
                border-radius: 5px;
            }

            .alert-danger ul {
                margin-bottom: 0;
                padding-left: 20px;
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

            /* Thêm style cho required fields */
            .text-danger {
                color: #dc3545;
            }
        </style>
    </head>

    <body class="app sidebar-mini rtl">
       

        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">
                <!-- User Menu-->
                <li><a class="app-nav__item" href="/index.html"><i class='bx bx-log-out bx-rotate-180'></i> </a>
                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <%@ include file="dashboardleft.jsp" %>
        <!-- Sidebar menu-->
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Danh sách người dùng</li>
                    <li class="breadcrumb-item"><a href="#">Thêm nhân viên</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Tạo mới nhân viên</h3>
                        <div class="tile-body">
                            <!<!-- Hiển thị thông báo lỗi -->
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">
                                    ${error}
                                </div>
                            </c:if>

                            <c:if test="${not empty errors}">
                                <div class="alert alert-danger" role="alert" style="margin-bottom: 20px;">
                                    <c:forEach items="${errors}" var="error">
                                        <div><i class="fas fa-exclamation-circle"></i> ${error}</div>
                                    </c:forEach>
                                </div>
                            </c:if>

                            <form action="${pageContext.request.contextPath}/admin/adminadduser" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                                <div class="row">
                                    <!-- Profile Image Section -->
                                    <div class="col-md-3">
                                        <div class="profile-image-section">
                                            <div class="profile-image-container">
                                                <img id="imagePreview" 
                                                     src="${pageContext.request.contextPath}/UserProfilesImages/default-avatar.jpg" 
                                                     alt="Profile Image">
                                            </div>
                                            <div class="image-upload-wrapper">
                                                <label for="profileImage" class="custom-file-upload">
                                                    <i class="fas fa-camera"></i> Chọn ảnh
                                                </label>
                                                <input type="file" 
                                                       name="profileImage" 
                                                       id="profileImage" 
                                                       accept="image/*"
                                                       onchange="previewImage(event)">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Personal Information Section -->
                                    <div class="col-md-9">
                                        <div class="row">
                                            <div class="form-group col-md-4">
                                                <label>Họ <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="firstName" 
                                                       value="${firstName}"
                                                       pattern="^[A-Za-zÀ-ỹ\s]{2,50}$"
                                                       title="Họ phải từ 2-50 ký tự và không chứa số hoặc ký tự đặc biệt"
                                                       required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label>Tên đệm</label>
                                                <input class="form-control" type="text" name="middleName" 
                                                       value="${middleName}"
                                                       pattern="^[A-Za-zÀ-ỹ\s]{0,50}$"
                                                       title="Tên đệm không được chứa số hoặc ký tự đặc biệt">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label>Tên <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="lastName" 
                                                       value="${lastName}"
                                                       pattern="^[A-Za-zÀ-ỹ\s]{2,50}$"
                                                       title="Tên phải từ 2-50 ký tự và không chứa số hoặc ký tự đặc biệt"
                                                       required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Email <span class="text-danger">*</span></label>
                                                <input class="form-control" type="email" name="email" 
                                                       value="${email}"
                                                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                                       title="Vui lòng nhập email hợp lệ"
                                                       required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Số điện thoại <span class="text-danger">*</span></label>
                                                <input class="form-control" type="tel" name="phoneNumber" 
                                                       value="${phoneNumber}"
                                                       pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b"
                                                       title="Số điện thoại phải có 10 số"
                                                       required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Ngày sinh <span class="text-danger">*</span></label>
                                                <input class="form-control" type="date" name="dateOfBirth" 
                                                       value="${dateOfBirth}"
                                                       max="<%= java.time.LocalDate.now().minusYears(18) %>"
                                                       title="Người dùng phải từ 18 tuổi trở lên"
                                                       required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Giới tính <span class="text-danger">*</span></label>
                                                <select class="form-control" name="gender" required>
                                                    <option value="Male" ${gender == 'Male' ? 'selected' : ''}>Nam</option>
                                                    <option value="Female" ${gender == 'Female' ? 'selected' : ''}>Nữ</option>
                                                    <option value="Other" ${gender == 'Other' ? 'selected' : ''}>Khác</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Số CMND/CCCD <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="citizenIdentification" 
                                                       value="${citizenIdentification}"
                                                       pattern="^[0-9]{9}$|^[0-9]{12}$"
                                                       title="CMND phải có 9 số hoặc CCCD phải có 12 số"
                                                       required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Tên đăng nhập <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="username" 
                                                       value="${username}"
                                                       pattern="^[a-zA-Z0-9_]{6,20}$"
                                                       title="Tên đăng nhập phải từ 6-20 ký tự, chỉ bao gồm chữ cái, số và dấu gạch dưới"
                                                       required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Mật khẩu <span class="text-danger">*</span></label>
                                                <input class="form-control" type="password" name="password" 
                                                       pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
                                                       title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm cả chữ và số"
                                                       required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="control-label">Chức vụ:</label>
                                                <select class="form-control" name="role" required>
                                                    <option value="Manager">Manager</option>
                                                    <option value="Staff">Staff</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Tỉnh/Thành phố</label>
                                                <select class="form-control" id="provinceID" name="provinceID" onchange="loadDistricts()">
                                                    <option value="">-- Chọn Tỉnh --</option>
                                                    <c:forEach var="province" items="${provinces}">
                                                        <option value="${province.provinceID}">${province.provinceName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Quận/Huyện</label>
                                                <select class="form-control" id="districtSelect" name="districtID" onchange="loadWards()">
                                                    <option value="">-- Chọn Huyện --</option>
                                                    <c:forEach var="district" items="${districts}">
                                                        <option value="${district.id}">${district.districtName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Phường/Xã</label>
                                                <select class="form-control" id="wardSelect" name="wardID">
                                                    <option value="">-- Chọn Xã --</option>
                                                    <c:forEach var="ward" items="${wards}">
                                                        <option value="${ward.id}">${ward.wardName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="control-label">Địa chỉ</label>
                                                <input class="form-control" type="text" name="streetAddress" required>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <button type="submit" class="btn btn-primary">Thêm nhân viên</button>
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
                                
        
                            <script type="text/javascript">
                                var contextPath = '<%= request.getContextPath() %>';
                            </script>
        <script>
            function loadDistricts() {
                var provinceID = document.getElementById('provinceID').value;
                var xhr = new XMLHttpRequest();
                xhr.open('GET', contextPath + '/loadDistricts?provinceID=' + provinceID, true);
                xhr.onload = function () {
                    if (xhr.status === 200) {
                        var districts = JSON.parse(xhr.responseText);
                        var districtSelect = document.getElementById('districtSelect');
                        districtSelect.innerHTML = '<option value="">-- Chọn Huyện --</option>'; // Reset district dropdown
                        districts.forEach(function (district) {
                            var option = document.createElement('option');
                            option.value = district.id;
                            option.textContent = district.districtName;
                            districtSelect.appendChild(option);
                        });
                        loadWards(); // Load wards for the first district if any
                    }
                };
                xhr.send();
            }

            function loadWards() {
                var districtID = document.getElementById('districtSelect').value;
                var xhr = new XMLHttpRequest();
                xhr.open('GET', contextPath + '/loadWards?districtID=' + districtID, true);
                xhr.onload = function () {
                    if (xhr.status === 200) {
                        var wards = JSON.parse(xhr.responseText);
                        var wardSelect = document.getElementById('wardSelect');
                        wardSelect.innerHTML = '<option value="">-- Chọn xã --</option>'; // Reset ward dropdown
                        wards.forEach(function (ward) {
                            var option = document.createElement('option');
                            option.value = ward.id;
                            option.textContent = ward.wardName;
                            wardSelect.appendChild(option);
                        });
                    }
                };
                xhr.send();
            }

            function previewImage(event) {
                const image = document.getElementById('imagePreview');
                const file = event.target.files[0];
                
                if (file) {
                    // Kiểm tra file type
                    if (!file.type.startsWith('image/')) {
                        alert('Vui lòng chọn file ảnh');
                        return;
                    }
                    
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        image.style.opacity = '0';
                        image.src = e.target.result;
                        // Thêm animation fade in
                        setTimeout(() => {
                            image.style.opacity = '1';
                        }, 50);
                    }
                    reader.readAsDataURL(file);
                } else {
                    image.src = '${pageContext.request.contextPath}/UserProfilesImages/default-avatar.jpg';
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
                if (!/(84|0[3|5|7|8|9])+([0-9]{8})\b/.test(phone)) {
                    errors.push("Số điện thoại không hợp lệ");
                }

                if (errors.length > 0) {
                    errorDiv.style.display = 'block';
                    errorDiv.innerHTML = '<i class="fas fa-exclamation-circle"></i> Vui lòng điền đầy đủ thông tin';
                    return false;
                }
                return true;
            }
        </script>

        <!-- Essential javascripts for application to work-->
        <script src="js/manager/jquery-3.2.1.min.js"></script>
        <script src="js/manager/popper.min.js"></script>
        <script src="js/manager/bootstrap.min.js"></script>
        <script src="js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="js/plugins/pace.min.js"></script>
    </body>

</html>