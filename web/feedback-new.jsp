<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tiny Tots - Phản Hồi</title>
        <link rel="stylesheet" href="css/feedback.css">
    </head>
    <body>
        <br>
        <div class="form-container">
            <h1><span class="material-symbols-outlined" style="font-size: 40px;">
                    edit_document
                </span>
                Phản Hồi Dịch Vụ</h1>
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

                <label for="suggestion">Góp Ý Dịch Vụ</label>
                <textarea id="suggestion" name="suggestion" placeholder="Chia sẻ ý kiến của bạn về cách chúng tôi có thể cải thiện" required></textarea>

                <style>
                    label, input, #preview-container, #clear-images-btn {
                        margin-bottom: 10px;
                    }
                </style>

                <label for="attachment">Đính Kèm Tệp</label>
                <input type="file" id="attachment" name="attachment" required multiple accept=".jpg, .jpeg, .png">
                <!-- Thêm phần xem trước ở đây -->
                <div id="preview-container"></div>

                <!-- Thêm nút Xóa hình ảnh ở đây -->
                <button type="button" id="clear-images-btn" style="display:none;">Xóa Hình Ảnh</button>

                <button type="button" id="clear-images-btn" style="display:none;">Xóa Hình Ảnh</button>
                <label>Đánh Giá Trải Nghiệm Của Bạn</label>
                <div class="rating" required >
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
                <div id="chat-message" class="chat-message hidden"></div>
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
            // Wait for the DOM to be fully loaded
            document.addEventListener('DOMContentLoaded', function () {
                // Smooth scroll to form
                const formContainer = document.querySelector('.form-container');
                formContainer.scrollIntoView({behavior: 'smooth'});

                // Add animation to form inputs
                const inputs = document.querySelectorAll('input, select, textarea');
                inputs.forEach(input => {
                    input.addEventListener('focus', function () {
                        this.style.transition = 'all 0.3s ease';
                        this.style.transform = 'scale(1.02)';
                        this.style.boxShadow = '0 0 10px rgba(0,0,0,0.1)';
                    });

                    input.addEventListener('blur', function () {
                        this.style.transform = 'scale(1)';
                        this.style.boxShadow = 'none';
                    });
                });

                // Enhance emoji rating interaction
                const emojis = document.querySelectorAll('.emoji');
                emojis.forEach(emoji => {
                    emoji.addEventListener('mouseover', function () {
                        this.style.transition = 'all 0.2s ease';
                        this.style.transform = 'scale(1.2)';
                    });

                    emoji.addEventListener('mouseout', function () {
                        this.style.transform = 'scale(1)';
                    });

                    emoji.addEventListener('click', function () {
                        emojis.forEach(e => e.classList.remove('selected'));
                        this.classList.add('selected');
                        this.style.transform = 'scale(1.1)';
                    });
                });

                // Smooth transition for chat message
                const chatMessage = document.getElementById('chat-message');
                const showChatMessage = (message) => {
                    chatMessage.textContent = message;
                    chatMessage.style.transition = 'all 0.3s ease';
                    chatMessage.style.opacity = '0';
                    chatMessage.classList.remove('hidden');
                    setTimeout(() => {
                        chatMessage.style.opacity = '1';
                    }, 50);
                };

                document.querySelectorAll('.emoji').forEach(emoji => {
                    emoji.addEventListener('click', function () {
                        const chatMessage = this.getAttribute('data-chat');
                        showChatMessage(chatMessage);
                    });
                });

                // Add a subtle animation to the submit button
                const submitButton = document.querySelector('button[type="submit"]');
                submitButton.addEventListener('mouseover', function () {
                    this.style.transition = 'all 0.3s ease';
                    this.style.transform = 'translateY(-2px)';
                    this.style.boxShadow = '0 4px 8px rgba(0,0,0,0.1)';
                });

                submitButton.addEventListener('mouseout', function () {
                    this.style.transform = 'translateY(0)';
                    this.style.boxShadow = 'none';
                });
            });
            document.addEventListener('DOMContentLoaded', function () {
                const guidanceMessages = {
                    'name': 'Tên của bạn đã được điền sẵn và không thể thay đổi.',
                    'email': 'Email của bạn đã được điền sẵn và không thể thay đổi.',
                    'phone': 'Số điện thoại của bạn đã được điền sẵn và không thể thay đổi.',
                    'serviceName': 'Vui lòng chọn dịch vụ bạn đã sử dụng từ danh sách thả xuống.',
                    'rating': 'Vui lòng chọn mức đánh giá từ 1 đến 5 sao để thể hiện mức độ hài lòng của bạn với dịch vụ.',
                    'comment': 'Hãy mô tả dịch vụ bạn đã trải nghiệm.',
                    'suggestion': 'Chia sẻ ý kiến của bạn về cách chúng tôi có thể cải thiện dịch vụ.',
                    'attachment': 'Tải lên hình ảnh liên quan đến phản hồi của bạn (chấp nhận định dạng: .jpg, .jpeg, .png).',
                    'experienceRating': 'Nhấp vào biểu tượng cảm xúc để đánh giá trải nghiệm tổng thể của bạn.'

                };

                function showGuidance(inputId) {
                    const message = guidanceMessages[inputId];
                    if (message) {
                        const guidanceElement = document.getElementById('guidance-message');
                        if (!guidanceElement) {
                            const newGuidanceElement = document.createElement('div');
                            newGuidanceElement.id = 'guidance-message';
                            newGuidanceElement.style.position = 'fixed';
                            newGuidanceElement.style.bottom = '20px';
                            newGuidanceElement.style.right = '20px';
                            newGuidanceElement.style.backgroundColor = '#f0f0f0';
                            newGuidanceElement.style.padding = '10px';
                            newGuidanceElement.style.borderRadius = '5px';
                            newGuidanceElement.style.boxShadow = '0 2px 5px rgba(0,0,0,0.2)';
                            newGuidanceElement.style.zIndex = '1000';
                            document.body.appendChild(newGuidanceElement);
                        }
                        document.getElementById('guidance-message').textContent = message;
                        document.getElementById('guidance-message').style.display = 'block';
                    }
                }

                function hideGuidance() {
                    const guidanceElement = document.getElementById('guidance-message');
                    if (guidanceElement) {
                        guidanceElement.style.display = 'none';
                    }
                }

                const inputs = document.querySelectorAll('input, select, textarea');
                inputs.forEach(input => {
                    input.addEventListener('focus', function () {
                        showGuidance(this.id);
                    });

                    input.addEventListener('blur', function () {
                        hideGuidance();
                    });
                });

                const emojis = document.querySelectorAll('.emoji');
                emojis.forEach(emoji => {
                    emoji.addEventListener('mouseover', function () {
                        showGuidance('experienceRating');
                    });

                    emoji.addEventListener('mouseout', function () {
                        hideGuidance();
                    });
                });
            });
        </script>
    </body>
</html>