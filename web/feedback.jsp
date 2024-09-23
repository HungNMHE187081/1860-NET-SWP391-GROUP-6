<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Tiny Tots - Phản hồi</title>
        <!-- Bootstrap 4 CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- jQuery UI CSS -->
        <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
        <!-- Custom CSS for modern design -->
        <style>
            body {
                background-color: #f8f9fa;
                color: #333;
                font-family: 'Arial', sans-serif;
            }

            .navbar {
                background-color: #fff;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                border-radius: 0 0 .75rem .75rem;
            }

            .navbar-brand, .nav-link {
                color: #333 !important;
            }

            .card {
                background-color: #fff;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                border: none;
                border-radius: .75rem;
            }

            .button-40 {
                background-color: #111827;
                border: 1px solid transparent;
                border-radius: .75rem;
                box-sizing: border-box;
                color: #FFFFFF;
                cursor: pointer;
                flex: 0 0 auto;
                font-family: "Inter var",ui-sans-serif,system-ui,-apple-system,system-ui,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
                font-size: 1.125rem;
                font-weight: 600;
                line-height: 1.5rem;
                padding: .75rem 1.2rem;
                text-align: center;
                text-decoration: none #6B7280 solid;
                text-decoration-thickness: auto;
                transition-duration: .2s;
                transition-property: background-color,border-color,color,fill,stroke;
                transition-timing-function: cubic-bezier(.4, 0, 0.2, 1);
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
                width: auto;
            }

            .button-40:hover {
                background-color: #374151;
            }

            .button-40:focus {
                box-shadow: none;
                outline: 2px solid transparent;
                outline-offset: 2px;
            }

            @media (min-width: 768px) {
                .button-40 {
                    padding: .75rem 1.5rem;
                }
            }

            .star-rating {
                direction: rtl;
                display: inline-flex;
            }

            .star-rating input[type="radio"] {
                display: none;
            }

            .star-rating label {
                font-size: 2rem;
                color: #ddd;
                cursor: pointer;
            }

            .star-rating input[type="radio"]:checked ~ label {
                color: #ffc107;
            }

            .form-control {
                border: 1px solid #ced4da;
                border-radius: .75rem;
            }

            .form-control:focus {
                border-color: #80bdff;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

            .form-control.is-invalid, .was-validated .form-control:invalid {
                border-color: #e3342f;
                box-shadow: none;
            }

            .form-control.is-valid, .was-validated .form-control:valid {
                border-color: #38c172;
            }

            .ui-autocomplete {
                max-height: 200px;
                overflow-y: auto;
                overflow-x: hidden;
                white-space: nowrap;
                background-color: #fff;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                border-radius: .75rem;
            }

            .ui-menu-item {
                white-space: nowrap;
                padding: 5px 10px;
            }

            #preview {
                margin-top: 15px;
                max-width: 100%;
                border-radius: .75rem;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            #searchResults {
                list-style-type: none;
                padding: 0;
                margin-top: 10px;
            }

            #searchResults li {
                padding: 5px;
                cursor: pointer;
                border-radius: .75rem;
            }

            @media (max-width: 768px) {
                .col-md-3, .col-md-9 {
                    margin-bottom: 20px;
                }
            }
        </style>
    </head>
    <body>
        <!-- Header với menu -->
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="http://localhost:9999/G6_ChildrenCare/home.jsp">Tiny Tots</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Chuyển đổi điều hướng">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:9999/G6_ChildrenCare/home.jsp">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:9999/G6_ChildrenCare/feedback.jsp">Phản hồi</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container mt-4">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-3">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title">Tìm kiếm dịch vụ</h5>
                            <form id="searchForm">
                                <div class="form-group">
                                    <input type="text" id="serviceSearch" class="form-control" placeholder="Nhập tên dịch vụ...">
                                </div>
                                <button type="submit" class="button-40">Tìm kiếm</button>
                            </form>
                            <ul id="searchResults"></ul>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title">Danh mục dịch vụ</h5>
                            <ul class="list-unstyled">
                                <li><a href="#" class="text-dark">Trung Tâm Chăm Sóc Trẻ</a></li>
                                <li><a href="#" class="text-dark">Dịch Vụ Hỗ Trợ Phụ Huynh</a></li>
                                <li><a href="#" class="text-dark">Chương Trình Đặc Biệt</a></li>
                                <li><a href="#" class="text-dark">Chăm Sóc Khẩn Cấp</a></li>
                                <li><a href="#" class="text-dark">Chăm Sóc Sau Giờ Học</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Liên hệ</h5>
                            <p>Hỗ trợ khách hàng: (123) 456-7890</p>
                            <p>Yêu cầu bán hàng: (987) 654-3210</p>
                            <p>Yêu cầu chung: Tinytots.info@tinytots.com</p>
                            <p>Hỗ trợ: Tinytots.support@tinytots.com</p>
                            <p>Bán hàng: Tinytots.sales@tinytots.com</p>
                        </div>
                    </div>
                </div>

                <!-- Phần form nhập thông tin phản hồi -->
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-body">
                            <h4>Phản hồi dịch vụ</h4>
                            <div id="successMessage" class="alert alert-success d-none">
                                Cảm ơn bạn đã gửi phản hồi! Chúng tôi đã gửi email xác nhận đến địa chỉ của bạn.
                            </div>

                            <form action="submitFeedback.jsp" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                                <!-- Thông tin liên hệ -->
                                <div class="form-group">
                                    <label for="fullname">Họ và tên</label>
                                    <input type="text" class="form-control" id="fullname" name="fullname" required>
                                    <div class="invalid-feedback">Vui lòng nhập họ và tên.</div>
                                </div>

                                <div class="form-group">
                                    <label for="gender">Giới tính</label>
                                    <select class="form-control" id="gender" name="gender" required>
                                        <option value="" disabled selected>Chọn giới tính</option>
                                        <option value="male">Nam</option>
                                        <option value="female">Nữ</option>
                                        <option value="other">Khác</option>
                                    </select>
                                    <div class="invalid-feedback">Vui lòng chọn giới tính.</div>
                                </div>

                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                    <div class="invalid-feedback">Vui lòng nhập địa chỉ email hợp lệ.</div>
                                </div>

                                <div class="form-group">
                                    <label for="mobile">Số điện thoại</label>
                                    <input type="text" class="form-control" id="mobile" name="mobile" required>
                                    <div class="invalid-feedback">Vui lòng nhập số điện thoại.</div>
                                </div>

                                <!-- Loại phản hồi -->
                                <div class="form-group">
                                    <label for="feedbackType">Loại phản hồi</label>
                                    <select class="form-control" id="feedbackType" name="feedbackType" required>
                                        <option value="" disabled selected>Chọn loại phản hồi</option>
                                        <option value="service">Phản hồi dịch vụ</option>
                                        <option value="general">Phản hồi chung</option>
                                    </select>
                                    <div class="invalid-feedback">Vui lòng chọn loại phản hồi.</div>
                                </div>

                                <!-- Đánh giá -->
                                <div class="form-group">
                                    <label for="rating">Đánh giá (sao)</label>
                                    <div class="star-rating">
                                        <input type="radio" id="star5" name="rating" value="5" required><label for="star5">★</label>
                                        <input type="radio" id="star4" name="rating" value="4" required><label for="star4">★</label>
                                        <input type="radio" id="star3" name="rating" value="3" required><label for="star3">★</label>
                                        <input type="radio" id="star2" name="rating" value="2" required><label for="star2">★</label>
                                        <input type="radio" id="star1" name="rating" value="1" required><label for="star1">★</label>
                                    </div>
                                    <div class="invalid-feedback">Vui lòng chọn mức đánh giá.</div>
                                </div>

                                <!-- Hình ảnh đính kèm -->
                                <div class="form-group">
                                    <label for="attachment">Hình ảnh đính kèm</label>
                                    <input type="file" class="form-control-file" id="attachment" name="attachment" onchange="previewImage(event)" required>
                                    <div class="invalid-feedback">Vui lòng chọn một hình ảnh đính kèm.</div>
                                    <img id="preview" src="#" alt="Hình ảnh của bạn" class="d-none"/>
                                </div>

                                <!-- Phản hồi -->
                                <div class="form-group">
                                    <label for="feedback">Phản hồi</label>
                                    <textarea class="form-control" id="feedback" name="feedback" rows="5" required></textarea>
                                    <div class="invalid-feedback">Vui lòng nhập phản hồi của bạn.</div>
                                </div>

                                <button type="submit" class="button-40">Gửi phản hồi</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- jQuery UI JS -->
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!-- Bootstrap 4 JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script>
                                        $(function () {
                                            var services = [
                                                "Trung Tâm Chăm Sóc Trẻ",
                                                "Dịch Vụ Hỗ Trợ Phụ Huynh",
                                                "Chương Trình Đặc Biệt",
                                                "Chăm Sóc Khẩn Cấp",
                                                "Chăm Sóc Sau Giờ Học",
                                            ];

                                            $("#serviceSearch").on("input", function () {
                                                var searchTerm = $(this).val().toLowerCase();
                                                var matchedServices = services.filter(function (service) {
                                                    return service.toLowerCase().indexOf(searchTerm) > -1;
                                                });

                                                displaySearchResults(matchedServices);
                                            });

                                            $("#searchForm").on("submit", function (e) {
                                                e.preventDefault();
                                                var searchTerm = $("#serviceSearch").val().toLowerCase();
                                                var matchedServices = services.filter(function (service) {
                                                    return service.toLowerCase().indexOf(searchTerm) > -1;
                                                });

                                                displaySearchResults(matchedServices);
                                            });

                                            function displaySearchResults(results) {
                                                var $searchResults = $("#searchResults");
                                                $searchResults.empty();

                                                if (results.length > 0) {
                                                    results.forEach(function (service) {
                                                        $searchResults.append($("<li>").text(service));
                                                    });
                                                } else {
                                                    $searchResults.append($("<li>").text("Không tìm thấy dịch vụ phù hợp"));
                                                }
                                            }

                                            $("#searchResults").on("click", "li", function () {
                                                $("#serviceSearch").val($(this).text());
                                                $("#searchResults").empty();
                                            });
                                        });

                                        function previewImage(event) {
                                            var reader = new FileReader();
                                            reader.onload = function () {
                                                var output = document.getElementById('preview');
                                                output.src = reader.result;
                                                output.classList.remove('d-none');
                                            };
                                            reader.readAsDataURL(event.target.files[0]);
                                        }

                                        // Form validation
                                        (function () {
                                            'use strict';
                                            window.addEventListener('load', function () {
                                                var forms = document.getElementsByClassName('needs-validation');
                                                var validation = Array.prototype.filter.call(forms, function (form) {
                                                    form.addEventListener('submit', function (event) {
                                                        if (form.checkValidity() === false) {
                                                            event.preventDefault();
                                                            event.stopPropagation();
                                                        }
                                                        form.classList.add('was-validated');
                                                    }, false);
                                                });
                                            }, false);
                                        })();
        </script>
    </body>
</html>