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
        <!-- favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://unpkg.com/@phosphor-icons/web@2.0.3/src/regular/style.css" rel="stylesheet">
    </head>
    <style>
        :root {
            --primary-color: #2563eb;
            --secondary-color: #1e40af;
            --background-color: #f8fafc;
            --card-background: #ffffff;
            --text-color: #1e293b;
            --border-radius: 16px;
            --transition-timing: cubic-bezier(0.4, 0, 0.2, 1);
        }

        body {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 24px;
            animation: fadeIn 0.6s var(--transition-timing);
        }

        .profile {
            background-color: var(--card-background);
            border-radius: var(--border-radius);
            box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            overflow: hidden;
            transform-origin: top;
            animation: slideDown 0.5s var(--transition-timing);
        }

        .profile__header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 32px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .profile__header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(255,255,255,0.1) 25%, transparent 25%),
                linear-gradient(-45deg, rgba(255,255,255,0.1) 25%, transparent 25%);
            background-size: 60px 60px;
            animation: headerPattern 60s linear infinite;
        }

        .profile__name {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 8px;
            position: relative;
        }

        .profile__title {
            font-size: 18px;
            opacity: 0.9;
            position: relative;
        }

        .profile__content {
            display: flex;
            flex-wrap: wrap;
            gap: 24px;
            padding: 24px;
        }

        .profile__sidebar {
            flex: 1;
            min-width: 280px;
        }

        .profile__image-card {
            background-color: var(--card-background);
            border-radius: var(--border-radius);
            padding: 24px;
            text-align: center;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s var(--transition-timing);
        }

        .profile__image-card:hover {
            transform: translateY(-4px);
        }

        .profile__image {
            width: 160px;
            height: 160px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
            border: 4px solid white;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s var(--transition-timing);
        }

        .profile__image:hover {
            transform: scale(1.05);
        }

        .profile__contact-info {
            margin: 20px 0;
        }

        .profile__contact-item {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 12px;
            padding: 8px;
            border-radius: 8px;
            transition: background-color 0.3s var(--transition-timing);
        }

        .profile__contact-item:hover {
            background-color: #f1f5f9;
        }

        .profile__contact-item i {
            margin-right: 12px;
            color: var(--primary-color);
            font-size: 18px;
        }

        .profile__edit-button {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background-color: var(--primary-color);
            color: white;
            padding: 12px 20px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s var(--transition-timing);
        }

        .profile__edit-button:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2);
        }

        .profile__main {
            flex: 2;
            min-width: 300px;
        }

        .profile__card {
            background-color: var(--card-background);
            border-radius: var(--border-radius);
            padding: 24px;
            margin-bottom: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s var(--transition-timing);
            animation: slideUp 0.5s var(--transition-timing);
        }

        .profile__card:hover {
            transform: translateY(-4px);
        }

        .profile__card-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 20px;
            color: var(--primary-color);
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .profile__info-row {
            display: flex;
            margin-bottom: 16px;
            padding: 8px;
            border-radius: 8px;
            transition: background-color 0.3s var(--transition-timing);
        }

        .profile__info-row:hover {
            background-color: #f1f5f9;
        }

        .profile__info-label {
            flex: 0 0 150px;
            font-weight: 500;
            color: #64748b;
        }

        .profile__info-value {
            flex: 1;
            color: #0f172a;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideDown {
            from {
                transform: translateY(-20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes slideUp {
            from {
                transform: translateY(20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes headerPattern {
            from {
                background-position: 0 0;
            }
            to {
                background-position: 1000px 0;
            }
        }

        @media (max-width: 768px) {
            .profile__content {
                flex-direction: column;
            }

            .profile__sidebar {
                margin-right: 0;
                margin-bottom: 24px;
            }

            .container {
                padding: 16px;
            }
        }
        /* Add these to your existing CSS */
        .form-control {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            margin-top: 4px;
            transition: all 0.3s var(--transition-timing);
        }

        .form-control:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 2px rgba(37, 99, 235, 0.2);
        }

        .form-control:hover {
            border-color: var(--primary-color);
        }

        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%232563eb'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 16px;
            padding-right: 40px;
        }

        .profile__info-row {
            flex-wrap: wrap;
            gap: 16px;
        }

        .profile__info-label {
            flex: 1;
            min-width: 200px;
        }

        .profile__info-label label {
            display: block;
            margin-bottom: 4px;
            color: #64748b;
            font-weight: 500;
        }
    </style>
    <%@ include file="/Common_JSP/dashboardtop.jsp" %>
    <br>
    <br>
    <br>
    <main class="container">
        <div class="profile">
            <div class="profile__header">
                <h3 class="profile__name">Chỉnh sửa hồ sơ</h3>
            </div>

            <c:if test="${not empty error}">
                <div class="profile__card" style="margin: 20px; background-color: #fee2e2; color: #dc2626;">
                    ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/customer/editprofile" method="post" enctype="multipart/form-data">
                <div class="profile__content">
                    <!-- Profile Image Section -->
                    <div class="profile__sidebar">
                        <div class="profile__image-card">
                            <div class="profile__image-container">
                                <c:choose>
                                    <c:when test="${not empty userDetails.profileImage}">
                                        <img id="imagePreview" class="profile__image" 
                                             src="${pageContext.request.contextPath}/${userDetails.profileImage}" 
                                             alt="Profile Image">
                                    </c:when>
                                    <c:otherwise>
                                        <img id="imagePreview" class="profile__image"
                                             src="${pageContext.request.contextPath}/images/default-avatar.jpg" 
                                             alt="Default Profile Image">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="profile__contact-info">
                                <label for="profileImage" class="profile__edit-button">
                                    <i class="fas fa-camera"></i> Chọn ảnh mới
                                </label>
                                <input type="file" name="profileImage" id="profileImage" 
                                       style="display: none;" onchange="previewImage(event)">
                            </div>
                        </div>
                    </div>

                    <!-- Personal Information Section -->
                    <div class="profile__main">
                        <div class="profile__card">
                            <h4 class="profile__card-title">Thông tin cá nhân</h4>
                            <div class="profile__info-row">
                                <div class="profile__info-label">
                                    <label>Họ</label>
                                    <input class="form-control" type="text" name="firstName" 
                                           value="${userDetails.firstName}" required>
                                </div>
                                <div class="profile__info-label">
                                    <label>Tên đệm</label>
                                    <input class="form-control" type="text" name="middleName" 
                                           value="${userDetails.middleName}">
                                </div>
                                <div class="profile__info-label">
                                    <label>Tên</label>
                                    <input class="form-control" type="text" name="lastName" 
                                           value="${userDetails.lastName}" required>
                                </div>
                            </div>

                            <div class="profile__info-row">
                                <div class="profile__info-label">
                                    <label>Email</label>
                                    <input class="form-control" type="email" name="email" 
                                           value="${userDetails.email}" required>
                                </div>
                                <div class="profile__info-label">
                                    <label>Số điện thoại</label>
                                    <input class="form-control" type="tel" name="phoneNumber" 
                                           value="${userDetails.phoneNumber}" required>
                                </div>
                            </div>

                            <div class="profile__info-row">
                                <div class="profile__info-label">
                                    <label>Ngày sinh</label>
                                    <input class="form-control" type="date" name="dateOfBirth" 
                                           value="${userDetails.dateOfBirth}" required>
                                </div>
                                <div class="profile__info-label">
                                    <label>Giới tính</label>
                                    <select class="form-control" name="gender" required>
                                        <option value="">Chọn giới tính</option>
                                        <option value="Male" ${userDetails.gender == 'Male' ? 'selected' : ''}>Nam</option>
                                        <option value="Female" ${userDetails.gender == 'Female' ? 'selected' : ''}>Nữ</option>
                                        <option value="Other" ${userDetails.gender == 'Other' ? 'selected' : ''}>Khác</option>
                                    </select>
                                </div>
                                <div class="profile__info-label">
                                    <label>CCCD/CMND</label>
                                    <input class="form-control" type="text" name="citizenIdentification" 
                                           value="${userDetails.citizenIdentification}" required>
                                </div>
                            </div>
                        </div>

                        <div class="profile__card">
                            <h4 class="profile__card-title">Địa chỉ</h4>
                            <div class="profile__info-row">
                                <div class="profile__info-label">
                                    <label>Tỉnh/Thành phố</label>
                                    <select class="form-control" id="provinceID" name="provinceID" 
                                            onchange="loadDistricts()" required>
                                        <option value="">Chọn Tỉnh/Thành phố</option>
                                        <c:forEach var="province" items="${provinces}">
                                            <option value="${province.provinceID}" 
                                                    ${userDetails.address.provinces.provinceID == province.provinceID ? 'selected' : ''}>
                                                ${province.provinceName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="profile__info-label">
                                    <label>Quận/Huyện</label>
                                    <select class="form-control" id="districtSelect" name="districtID" 
                                            onchange="loadWards()" required>
                                        <option value="">Chọn Quận/Huyện</option>
                                        <c:forEach var="district" items="${districts}">
                                            <option value="${district.id}"
                                                    ${userDetails.address.district.id == district.id ? 'selected' : ''}>
                                                ${district.districtName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="profile__info-label">
                                    <label>Phường/Xã</label>
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
                            </div>

                            <div class="profile__info-row">
                                <div class="profile__info-label" style="width: 100%;">
                                    <label>Địa chỉ cụ thể</label>
                                    <input class="form-control" type="text" name="streetAddress" 
                                           value="${userDetails.address.streetAddress}" required>
                                </div>
                            </div>
                        </div>

                        <div class="profile__card">
                            <div class="profile__info-row" style="justify-content: flex-end;">
                                <button class="profile__edit-button" type="submit" style="margin-right: 10px;">
                                    <i class="fa fa-save"></i> Lưu thay đổi
                                </button>
                                <a class="profile__edit-button" href="${pageContext.request.contextPath}/customer/viewprofile" 
                                   style="background-color: var(--secondary-color);">
                                    <i class="fa fa-backward"></i> Quay lại
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
</body>
</html>

