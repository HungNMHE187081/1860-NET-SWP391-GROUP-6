<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Th�m nh�n vi�n m?i</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>

    <body>
        <div class="container">
            <h2 class="mt-5">Th�m nh�n vi�n m?i</h2>

            <!-- Kiểm tra và hiển thị thông báo lỗi -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/admin/adminadduser" method="post" enctype="multipart/form-data">

                <div class="col-md-3 text-center">
                    <div class="form-group">
                        <label class="control-label">?nh ??i di?n</label>
                        <div class="profile-img-container">
                            <img id="imagePreview" src="https://via.placeholder.com/150" alt="Image Preview" class="rounded-circle img-fluid">
                        </div>
                        <input class="form-control-file mt-3" type="file" name="profileImage" id="profileImage" onchange="previewImage(event)">
                    </div>
                </div>
                <div class="form-group">
                    <label for="firstName">First Name:</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" required>
                </div>
                <div class="form-group">
                    <label for="middleName">Middle Name:</label>
                    <input type="text" class="form-control" id="middleName" name="middleName">
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name:</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
                </div>
                <div class="form-group">
                    <label for="dateOfBirth">Date of Birth:</label>
                    <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required>
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <select class="form-control" id="gender" name="gender" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="citizenIdentification">Citizen Identification:</label>
                    <input type="text" class="form-control" id="citizenIdentification" name="citizenIdentification"
                           required>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="role">Role:</label>
                    <select class="form-control" id="role" name="role" required>
                        <option value="Manager">Manager</option>
                        <option value="Doctor">Doctor</option>
                        <option value="Nurse">Nurse</option>
                        <!-- Thêm các vai trò khác nếu cần -->
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">T?nh/Th�nh ph?</label>
                    <select class="form-control" id="provinceID" name="provinceID" onchange="loadDistricts()">
                        <option value="">-- Ch?n T?nh --</option>
                        <c:forEach var="province" items="${provinces}">
                            <option value="${province.provinceID}">${province.provinceName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">Qu?n/Huy?n</label>
                    <select class="form-control" id="districtSelect" name="districtID" onchange="loadWards()">
                        <option value="">-- Ch?n Huy?n --</option>
                        <c:forEach var="district" items="${districts}">
                            <option value="${district.id}">${district.districtName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">Ph??ng/X�</label>
                    <select class="form-control" id="wardSelect" name="wardID">
                        <option value="">-- Ch?n X� --</option>
                        <c:forEach var="ward" items="${wards}">
                            <option value="${ward.id}">${ward.wardName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">??a ch?</label>
                    <input class="form-control" type="text" name="streetAddress" required>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

        <script>
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
                        wardSelect.innerHTML = '<option value="">-- Chọn Xã --</option>'; // Reset ward dropdown
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
                        image.src = e.target.result; // G�n URL ?nh cho thu?c t�nh src c?a <img>
                        image.style.display = 'block'; // Hi?n ?nh
                    }

                    reader.readAsDataURL(file); // ??c file ?nh
                } else {
                    image.src = '#'; // Reset n?u kh�ng c� file
                    image.style.display = 'none'; // ?n ?nh
                }
            }

        </script>
        <style>
            .profile-img-container {
                width: 150px;
                height: 150px;
                overflow: hidden;
                border-radius: 20%;
                margin: 0 auto;
            }

            .profile-img-container img {
                width: 100%;
                height: auto;
            }

            .form-control-file {
                display: block;
                margin-top: 10px;
            }
        </style>
    </body>

</html>