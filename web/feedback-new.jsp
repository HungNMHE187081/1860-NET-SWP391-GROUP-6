<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Biểu Mẫu Phản Hồi</title>
        <link rel="stylesheet" href="css/feedback.css">
    </head>
    <body>
        <br>
        <div class="form-container">
            <h1>Biểu Mẫu Phản Hồi</h1>
            <p>Chúng tôi coi trọng phản hồi của bạn. Vui lòng chia sẻ trải nghiệm của bạn với chúng tôi.</p>

            <form action="addfeedback" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="userID" value="${user.userID}">

    <label for="name">Tên của bạn</label>
    <input type="text" id="name" name="userName" value="${user.firstName} ${user.middleName} ${user.lastName}" readonly>

    <label for="email">Địa chỉ Email</label>
    <input type="email" id="email" name="emailAddress" value="${user.email}" readonly>

    <label for="phone">Số Điện Thoại</label>
    <input type="tel" id="phone" name="phoneNumber" value="${user.phoneNumber}" readonly>

    <label for="serviceName">Chọn dịch vụ đã sử dụng</label>
    <select id="serviceName" name="serviceID">
        <c:forEach var="service" items="${service}">
            <option value="${service.serviceID}">${service.serviceName}</option>
        </c:forEach>
    </select>

    <label for="rating">Đánh Giá Dịch Vụ Của Chúng Tôi</label>
    <select id="rating" name="rating" required>
        <option value="" disabled selected>Chọn đánh giá</option>
        <option value="5">★★★★★ - Xuất Sắc</option>
        <option value="4">★★★★☆ - Tốt</option>
        <option value="3">★★★☆☆ - Trung Bình</option>
        <option value="2">★★☆☆☆ - Kém</option>
        <option value="1">★☆☆☆☆ - Rất Kém</option>
    </select>

    <label for="comment">Chi Tiết Phản Hồi</label>
    <textarea id="comment" name="comment" placeholder="Mô tả các mặt hàng bạn muốn đặt hàng với số lượng" required></textarea>

    <label for="suggestion">Góp Ý Dịch Vụ (tùy chọn)</label>
    <textarea id="suggestion" name="suggestion" placeholder="Chia sẻ ý kiến của bạn về cách chúng tôi có thể cải thiện"></textarea>

    <label for="attachment">Đính Kèm Tệp (tùy chọn)</label>
    <input type="file" id="attachment" name="attachment" multiple accept=".jpg, .jpeg, .png">

    <label>Đánh Giá Trải Nghiệm Của Bạn</label>
    <div class="rating">
        <input type="radio" name="experienceRating" id="very-bad" value="Rất tức giận">
        <label for="very-bad" class="emoji" data-chat="Rất tức giận">&#128544;</label>

        <input type="radio" name="experienceRating" id="bad" value="Không hài lòng">
        <label for="bad" class="emoji" data-chat="Không hài lòng">&#128577;</label>

        <input type="radio" name="experienceRating" id="neutral" value="Bình thường">
        <label for="neutral" class="emoji" data-chat="Bình thường">&#128528;</label>

        <input type="radio" name="experienceRating" id="good" value="Hài lòng">
        <label for="good" class="emoji" data-chat="Hài lòng">&#128578;</label>

        <input type="radio" name="experienceRating" id="very-good" value="Rất hài lòng">
        <label for="very-good" class="emoji" data-chat="Rất hài lòng">&#128513;</label>
    </div>

    <button type="submit">Gửi Phản Hồi</button>
</form>
        </div>

        <script>
            const previewContainer = document.getElementById('preview-container');
            const clearImagesBtn = document.getElementById('clear-images-btn');
            const fileInput = document.getElementById('attachment');

            fileInput.addEventListener('change', function (event) {
                const files = event.target.files;
                previewContainer.innerHTML = '';

                if (files.length > 0) {
                    clearImagesBtn.style.display = 'block';
                } else {
                    clearImagesBtn.style.display = 'none';
                }

                Array.from(files).forEach(file => {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        const img = document.createElement('img');
                        img.src = e.target.result;
                        img.style.width = '100px';
                        img.style.height = 'auto';
                        img.style.marginRight = '10px';
                        previewContainer.appendChild(img);
                    };

                    reader.readAsDataURL(file);
                });
            });

            clearImagesBtn.addEventListener('click', function () {
                fileInput.value = '';
                previewContainer.innerHTML = '';
                clearImagesBtn.style.display = 'none';
            });

            document.querySelectorAll('.emoji').forEach(emoji => {
                emoji.addEventListener('click', function () {
                    const chatMessage = emoji.getAttribute('data-chat');
                    const messageContainer = document.getElementById('chat-message');

                    messageContainer.textContent = chatMessage;
                    messageContainer.classList.remove('hidden');
                });
            });
        </script>
    </body>
</html>