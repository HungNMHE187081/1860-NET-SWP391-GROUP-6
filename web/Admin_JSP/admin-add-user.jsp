<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Thêm nhân viên | Qu?n tr? Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/manager/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <script>
            function readURL(input, thumbimage) {
                if (input.files && input.files[0]) { //S? d?ng cho Firefox - chrome
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#thumbimage").attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                } else { // S? d?ng cho IE
                    $("#thumbimage").attr('src', input.value);
                }
                $("#thumbimage").show();
                $('.filename').text($("#uploadfile").val());
                $('.Choicefile').css('background', '#14142B');
                $('.Choicefile').css('cursor', 'default');
                $(".removeimg").show();
                $(".Choicefile").unbind('click');
            }

            $(document).ready(function () {
                $(".Choicefile").bind('click', function () {
                    $("#uploadfile").click();
                    $('.Choicefile').css('background', '#14142B');
                    $('.Choicefile').css('cursor', 'default');
                    $("#uploadfile").change(function () {
                        var filename = $("#uploadfile").val();
                        $('.filename').text(filename);
                    });
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <h2>Thêm nhân viên m?i</h2>
            <form action="${pageContext.request.contextPath}/admin/adminadduser" method="post" enctype="multipart/form-data">
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
                    </select>
                </div>
                <div class="form-group">
                    <label for="citizenIdentification">Citizen Identification:</label>
                    <input type="text" class="form-control" id="citizenIdentification" name="citizenIdentification" required>
                </div>
                <div class="form-group">
                    <label for="provinceID">Province:</label>
                    <select class="form-control" id="provinceID" name="provinceID" onchange="loadDistricts()" required>
                        <option value="">-- Select Province --</option>
                        <c:forEach var="province" items="${provinces}">
                            <option value="${province.provinceID}">${province.provinceName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="districtID">District:</label>
                    <select class="form-control" id="districtID" name="districtID" onchange="loadWards()" required>
                        <option value="">-- Select District --</option>
                        <c:forEach var="district" items="${districts}">
                            <option value="${district.id}">${district.districtName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="wardID">Ward:</label>
                    <select class="form-control" id="wardID" name="wardID" required>
                        <option value="">-- Select Ward --</option>
                        <c:forEach var="ward" items="${wards}">
                            <option value="${ward.id}">${ward.wardName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="streetAddress">Street Address:</label>
                    <input type="text" class="form-control" id="streetAddress" name="streetAddress" required>
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
                        <option value="Staff">Staff</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="profileImage">Profile Image:</label>
                    <input type="file" class="form-control" id="profileImage" name="profileImage">
                </div>
                <button type="submit" class="btn btn-primary">Add User</button>
            </form>
        </div>
    </body>

    <script>
        function loadDistricts() {
            var provinceID = document.getElementById("provinceID").value;
            $.ajax({
                url: '${pageContext.request.contextPath}/loadDistricts',
                type: 'GET',
                data: {provinceID: provinceID},
                success: function (data) {
                    var districtSelect = document.getElementById("districtID");
                    districtSelect.innerHTML = '<option value="">-- Select District --</option>';
                    data.forEach(function (district) {
                        var option = document.createElement("option");
                        option.value = district.id;
                        option.text = district.districtName;
                        districtSelect.appendChild(option);
                    });
                }
            });
        }

        function loadWards() {
            var districtID = document.getElementById("districtID").value;
            $.ajax({
                url: '${pageContext.request.contextPath}/loadWards',
                type: 'GET',
                data: {districtID: districtID},
                success: function (data) {
                    var wardSelect = document.getElementById("wardID");
                    wardSelect.innerHTML = '<option value="">-- Select Ward --</option>';
                    data.forEach(function (ward) {
                        var option = document.createElement("option");
                        option.value = ward.id;
                        option.text = ward.wardName;
                        wardSelect.appendChild(option);
                    });
                }
            });
        }
    </script>
</html>