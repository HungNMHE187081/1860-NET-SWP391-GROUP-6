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
                --primary-color: #4e73df;
                --secondary-color: #858796;
                --success-color: #1cc88a;
                --gradient-1: linear-gradient(135deg, #6B73FF 0%, #000DFF 100%);
                --gradient-2: linear-gradient(135deg, #97ABFF 10%, #123597 100%);
            }

            /* Header Styling */
            .app-header {
                background: var(--gradient-1);
                border-bottom: none;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                position: fixed;
                width: 100%;
                z-index: 1000;
            }

            .app-header::after {
                content: '';
                position: absolute;
                left: 0;
                right: 0;
                bottom: -50px;
                height: 50px;
                background: var(--gradient-1);
                opacity: 0.3;
                z-index: -1;
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
                background: var(--gradient-2);
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

            input[type="file"] {
                display: none;
            }

            /* Main Content Adjustments */
            .app-content {
                margin-top: 100px;
                padding: 2rem;
                background-color: #f8f9fc;
                min-height: calc(100vh - 60px);
            }

            .tile {
                background: white;
                border-radius: 15px;
                box-shadow: 0 0.15rem 1.75rem rgba(33, 40, 50, 0.15);
                padding: 1.5rem;
            }

            .tile-title {
                color: var(--primary-color);
                font-size: 1.5rem;
                font-weight: 600;
                margin-bottom: 2rem;
                padding-bottom: 1rem;
                border-bottom: 2px solid #e3e6f0;
            }

            /* Form Styling */
            .form-control {
                border-radius: 8px;
                border: 1px solid #e3e6f0;
                padding: 0.75rem;
            }

            .form-control:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
            }

            .btn-primary {
                background: var(--gradient-1);
                border: none;
                border-radius: 8px;
                padding: 0.75rem 1.5rem;
                transition: all 0.3s ease;
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            }
        </style>
    </head>

    <body class="app sidebar-mini rtl">
        <header class="app-header">
            <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
            <ul class="app-nav">
                <li><a class="app-nav__item" href="/index.html"><i class='bx bx-log-out bx-rotate-180'></i></a></li>
            </ul>
        </header>

        <%@ include file="/Common_JSP/dashboardtop.jsp" %>

        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <!-- Sidebar content remains the same -->
        </aside>

        <main class="app-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Chỉnh sửa hồ sơ</h3>
                        <div class="tile-body">
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">${error}</div>
                            </c:if>

                            <form action="${pageContext.request.contextPath}/customer/editchildren" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="childID" value="${children.childID}" />
                                <div class="row">
                                    <!-- Profile Image Section -->
                                    <div class="col-md-3">
                                        <div class="profile-image-section">
                                            <div class="profile-image-container">
                                                <c:choose>
                                                    <c:when test="${not empty children.childImage}">
                                                        <img id="imagePreview" src="${pageContext.request.contextPath}/${children.childImage}" alt="Profile Image">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img id="imagePreview" src="${pageContext.request.contextPath}/images/default-avatar.jpg" alt="Default Profile Image">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="image-upload-wrapper">
                                                <label for="profileImage" class="custom-file-upload">
                                                    <i class="fas fa-camera"></i> Chọn ảnh mới
                                                </label>
                                                <input type="file" name="profileImage" id="profileImage" onchange="previewImage(event)">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Personal Information Section -->
                                    <div class="col-md-9">
                                        <div class="row">
                                            <!-- Name Fields -->
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Họ</label>
                                                <input class="form-control" type="text" name="firstName" value="${children.firstName}" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Tên đệm</label>
                                                <input class="form-control" type="text" name="middleName" value="${children.middleName}">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Tên</label>
                                                <input class="form-control" type="text" name="lastName" value="${children.lastName}" required>
                                            </div>

                                            <!-- Personal Details -->
                                            <div class="form-group col-md-4">
                                                <label class="control-label">Ngày sinh</label>
                                                <input class="form-control" type="date" name="dateOfBirth" value="${children.dateOfBirth}" required>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="gender">Gender:</label>
                                                <select id="gender" name="gender" required>
                                                    <option value="Nam" ${children.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                                    <option value="Nữ" ${children.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                                </select>
                                            </div>
                                         
                                            <!-- Submit Button -->
                                            <div class="form-group col-md-12">
                                                <button class="btn btn-primary" type="submit">
                                                    <i class="fa fa-save"></i> Lưu thay đổi
                                                </button>
                                                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/customer/listchildren">
                                                    <i class="fa fa-backward"></i> Quay lại
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
                    }

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