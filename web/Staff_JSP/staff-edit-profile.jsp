<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chỉnh sửa hồ sơ</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="shortcut icon" href="../images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <!-- Icons -->
        <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/remixicon.css" rel="stylesheet" type="text/css"/>
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- SLIDER -->
        <link href="${pageContext.request.contextPath}/css/tiny-slider.css" rel="stylesheet" type="text/css"/>
        <!-- Css -->
        <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/flatpickr.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/remixicon.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/select2.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/simplebar.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/slick-theme.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/slick.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/tiny-slider.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=ecg_heart" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <style>
            :root {
                --primary-color: #2563eb;
                --secondary-color: #1e40af;
                --background-color: #f8fafc;
                --card-background: #ffffff;
                --text-color: #1e293b;
                --border-radius: 16px;
                --transition: all 0.3s ease;
            }

            .profile-wrapper {
                padding: 2rem;
                background-color: var(--background-color);
                min-height: calc(100vh - 60px);
            }

            .profile-header {
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                padding: 2rem;
                border-radius: var(--border-radius);
                color: white;
                margin-bottom: 2rem;
                text-align: center;
            }

            .profile-content {
                display: grid;
                grid-template-columns: 300px 1fr;
                gap: 2rem;
            }

            .profile-sidebar {
                background: var(--card-background);
                border-radius: var(--border-radius);
                padding: 1.5rem;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            }

            .profile-image-container {
                width: 200px;
                height: 200px;
                margin: 0 auto 1.5rem;
                position: relative;
            }

            .profile-image {
                width: 100%;
                height: 100%;
                border-radius: 50%;
                object-fit: cover;
                border: 4px solid white;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            }

            .profile-upload-btn {
                position: absolute;
                bottom: 0;
                right: 0;
                background: var(--primary-color);
                color: white;
                border: none;
                border-radius: 50%;
                width: 40px;
                height: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: var(--transition);
            }

            .profile-card {
                background: var(--card-background);
                border-radius: var(--border-radius);
                padding: 1.5rem;
                margin-bottom: 1.5rem;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            }

            .card-title {
                font-size: 1.25rem;
                color: var(--text-color);
                font-weight: 600;
                margin-bottom: 1.5rem;
                padding-bottom: 0.5rem;
                border-bottom: 2px solid #e2e8f0;
            }

            .form-group {
                margin-bottom: 1.5rem;
            }

            .form-control {
                border: 1px solid #e2e8f0;
                border-radius: 8px;
                padding: 0.75rem;
                width: 100%;
                transition: var(--transition);
            }

            .form-control:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
            }

            .btn-submit {
                background: var(--primary-color);
                color: white;
                border: none;
                padding: 0.75rem 1.5rem;
                border-radius: 8px;
                cursor: pointer;
                transition: var(--transition);
            }

            .btn-submit:hover {
                background: var(--secondary-color);
                transform: translateY(-1px);
            }

            .btn-back {
                background: #64748b;
                margin-left: 1rem;
            }

            @media (max-width: 768px) {
                .profile-content {
                    grid-template-columns: 1fr;
                }
            }
        </style>
    </head>

    <body class="app sidebar-mini rtl">
        <%@ include file="dashboardtop.jsp" %>
        <main class="app-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Chỉnh sửa hồ sơ</h3>
                        <div class="tile-body">
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">${error}</div>
                            </c:if>

                            <div class="profile-wrapper">
                                <div class="profile-header">
                                    <h2>Chỉnh sửa hồ sơ</h2>
                                </div>

                                <form action="${pageContext.request.contextPath}/staff/editprofile" method="post" enctype="multipart/form-data">
                                    <div class="profile-content">
                                        <!-- Sidebar with Image -->
                                        <div class="profile-sidebar">
                                            <div class="profile-image-container">
                                                <img id="imagePreview" class="profile-image" 
                                                     src="${pageContext.request.contextPath}/${userDetails.profileImage}" 
                                                     alt="Profile Image">
                                                <label for="profileImage" class="profile-upload-btn">
                                                    <i class="fas fa-camera"></i>
                                                </label>
                                                <input type="file" id="profileImage" name="profileImage" 
                                                       onchange="previewImage(event)" style="display: none">
                                            </div>
                                        </div>

                                        <!-- Main Form Content -->
                                        <div class="profile-main">
                                            <!-- Personal Information -->
                                            <div class="profile-card">
                                                <div class="row">
                                                    <!-- Name Fields -->
                                                    <div class="form-group col-md-4">
                                                        <label class="control-label">Họ</label>
                                                        <input class="form-control" type="text" name="firstName" value="${userDetails.firstName}" required>
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label class="control-label">Tên đệm</label>
                                                        <input class="form-control" type="text" name="middleName" value="${userDetails.middleName}">
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label class="control-label">Tên</label>
                                                        <input class="form-control" type="text" name="lastName" value="${userDetails.lastName}" required>
                                                    </div>

                                                    <!-- Contact Information -->
                                                    <div class="form-group col-md-6">
                                                        <label class="control-label">Email</label>
                                                        <input class="form-control" type="email" name="email" value="${userDetails.email}" required>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label class="control-label">Số điện thoại</label>
                                                        <input class="form-control" type="tel" name="phoneNumber" value="${userDetails.phoneNumber}" required>
                                                    </div>

                                                    <!-- Personal Details -->
                                                    <div class="form-group col-md-4">
                                                        <label class="control-label">Ngày sinh</label>
                                                        <input class="form-control" type="date" name="dateOfBirth" value="${userDetails.dateOfBirth}" required>
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label class="control-label">Giới tính</label>
                                                        <select class="form-control" name="gender" required>
                                                            <option value="">Chọn giới tính</option>
                                                            <option value="Male" ${userDetails.gender == 'Male' ? 'selected' : ''}>Nam</option>
                                                            <option value="Female" ${userDetails.gender == 'Female' ? 'selected' : ''}>Nữ</option>
                                                            <option value="Other" ${userDetails.gender == 'Other' ? 'selected' : ''}>Khác</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label class="control-label">CCCD/CMND</label>
                                                        <input class="form-control" type="text" name="citizenIdentification" value="${userDetails.citizenIdentification}" required>
                                                    </div>

                                                    <!-- Thêm vào form sau phần địa chỉ -->
                                                    <div class="form-group col-md-6">
                                                        <label class="control-label">Chuyên ngành</label>
                                                        <select class="form-control" name="degree" required>
                                                            <option value="">Chọn chuyên ngành</option>
                                                            <c:forEach var="degree" items="${allDegrees}">
                                                                <option value="${degree.degreeID}" 
                                                                        ${userDegree.degreeID == degree.degreeID ? 'selected' : ''}>
                                                                    ${degree.degreeName}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label class="control-label">Chuyên môn</label>
                                                        <select class="form-control" name="specialization" required>
                                                            <option value="">Chọn chuyên môn</option>
                                                            <c:forEach var="spec" items="${allSpecializations}">
                                                                <option value="${spec.specializationID}" 
                                                                        ${userSpecialization.specializationID == spec.specializationID ? 'selected' : ''}>
                                                                    ${spec.specializationName}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Address Information -->
                                            <div class="profile-card">
                                                <div class="row">
                                                    <!-- Address Fields -->
                                                    <div class="form-group col-md-4">
                                                        <label class="control-label">Tỉnh/Thành phố</label>
                                                        <select class="form-control" id="provinceID" name="provinceID" onchange="loadDistricts()" required>
                                                            <option value="">Chọn Tỉnh/Thành phố</option>
                                                            <c:forEach var="province" items="${provinces}">
                                                                <option value="${province.provinceID}" 
                                                                        ${userDetails.address.provinces.provinceID == province.provinceID ? 'selected' : ''}>
                                                                    ${province.provinceName}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label class="control-label">Quận/Huyện</label>
                                                        <select class="form-control" id="districtSelect" name="districtID" onchange="loadWards()" required>
                                                            <option value="">Chọn Quận/Huyện</option>
                                                            <c:forEach var="district" items="${districts}">
                                                                <option value="${district.id}"
                                                                        ${userDetails.address.district.id == district.id ? 'selected' : ''}>
                                                                    ${district.districtName}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label class="control-label">Phường/Xã</label>
                                                        <select class="form-control" id="wardSelect" name="wardID" required>
                                                            <option value="">Chọn Phường/Xã</option>
                                                            <c:forEach var="ward" items="${wards}">
                                                                <option value="${ward.id}"
                                                                        ${userDetails.address.ward.id == ward.id ? 'selected' : ''}>
                                                                    ${ward.wardName}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label class="control-label">Địa chỉ cụ thể</label>
                                                        <input class="form-control" type="text" name="streetAddress" 
                                                               value="${userDetails.address.streetAddress}" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Buttons -->
                                            <div class="profile-card" style="text-align: right;">
                                                <button type="submit" class="btn-submit">
                                                    <i class="fas fa-save"></i> Lưu thay đổi
                                                </button>
                                                <a href="${pageContext.request.contextPath}/staff/viewprofile" 
                                                   class="btn-submit btn-back">
                                                    <i class="fas fa-arrow-left"></i> Quay lại
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
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
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        image.src = e.target.result; // Gán URL ảnh cho thuộc tính src của <img>
                        image.style.display = 'block'; // Hiện ảnh
                    };

                    reader.readAsDataURL(file); // Đọc file ảnh
                } else {
                    image.src = '#'; // Reset nếu không có file
                    image.style.display = 'none'; // Ẩn ảnh
                }
            }
        </script>

        <!-- Essential javascripts for application to work-->
        <script src="${pageContext.request.contextPath}/js/manager/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/manager/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>
    </body>

</html>