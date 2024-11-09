<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phản Hồi Dịch Vụ</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Outfit", sans-serif;
        }

body {
    background: white;
    color: black;
    min-height: 100vh;
    padding: 0;  /* Remove padding */
    display: flex;
    flex-direction: column;
}

.form-container {
    background: white;
    padding: 30px;
    width: 100%;
    max-width: 800px;
    margin: 20px auto;  /* Add margin-top */
    flex-grow: 1;
    display: flex;
    flex-direction: column;
}
        h1 {
            font-size: 26px;
            margin-bottom: 15px;
            color: #111;
            display: flex;
            align-items: center;
        }

        p {
            font-size: 16px;
            margin-bottom: 25px;
            color: #555;
        }

        label {
            font-size: 15px;
            margin-top: 15px;
            color: #111;
            display: block;
        }

        input[type="text"], input[type="email"], input[type="tel"], input[type="url"], input[type="date"],
        input[type="number"], select, textarea, input[type="file"] {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            border-radius: 8px;
            border: 1px solid #bbb;
            font-size: 14px;
            background-color: #f9f9f9;
            color: #111;
            transition: border 0.3s ease;
        }

        input:focus, textarea:focus, select:focus {
            border-color: black;
            outline: none;
        }

        textarea {
            height: 120px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: black;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 25px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #333;
            transform: translateY(-2px);
        }

        .rating {
            display: flex;
            gap: 50px;
            justify-content: center;
            margin-bottom: 10px;
        }

        .emoji {
            font-size: 2.5rem;
            cursor: pointer;
            display: inline-block;
            text-align: center;
            margin-bottom: 10px;
        }

        .chat-message {
            margin-top: 10px;
            font-size: 1.2rem;
            color: #333;
            text-align: center;
        }

        .hidden {
            display: none;
        }

        #preview-container img {
            width: 100px;
            height: auto;
            margin-right: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        #clear-images-btn {
            display: none;
            margin-top: 10px;
        }

        #guidance-message {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #f0f0f0;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            z-index: 1000;
            display: none;
        }

        @media (max-width: 640px) {
            .rating {
                gap: 20px;
            }
        }

        input[readonly] {
            background-color: #f0f0f0;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    
    <div class="form-container">
         <style>
             .back-button {
            padding: 8px 16px;
            font-size: 19px;
            background-color: #000; /* Black background */
            color: #fff; /* White text */
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 40px; /* Adjust the width to make it longer */
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .back-button i {
            margin-right: 8px; /* Space between icon and text */
        }
    </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <button type="button" class="back-button" onclick="history.back()">
            <i class="fas fa-arrow-left"></i>
        </button>
        <h1>
            <span class="material-symbols-outlined" style="font-size: 40px;">
                edit_document
            </span>
            <br>
            Phản Hồi Dịch Vụ
        </h1>
        <p>Chúng tôi coi trọng phản hồi của bạn. Vui lòng chia sẻ trải nghiệm của bạn với chúng tôi.</p>

        <form action="addfeedback" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="userID" value="${user.userID}">

            <label for="name">Tên của bạn</label>
            <input type="text" id="name" name="userName" 
                value="${user.firstName} ${user.middleName} ${user.lastName}" readonly>

            <label for="email">Địa chỉ Email</label>
            <input type="email" id="email" name="emailAddress" 
                value="${user.email}" readonly>

            <label for="phone">Số Điện Thoại</label>
            <input type="tel" id="phone" name="phoneNumber" 
                value="${user.phoneNumber}" readonly>

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

            <label for="attachment">Đính Kèm Tệp</label>
            <input type="file" id="attachment" name="attachment" required multiple accept=".jpg, .jpeg, .png">
            <div id="preview-container"></div>
            <button type="button" id="clear-images-btn">Xóa Hình Ảnh</button>

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

    <div id="guidance-message"></div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const previewContainer = document.getElementById('preview-container');
            const clearImagesBtn = document.getElementById('clear-images-btn');
            const fileInput = document.getElementById('attachment');
            const chatMessage = document.getElementById('chat-message');
            const guidanceElement = document.getElementById('guidance-message');

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
                    guidanceElement.textContent = message;
                    guidanceElement.style.display = 'block';
                }
            }

            function hideGuidance() {
                guidanceElement.style.display = 'none';
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

                emoji.addEventListener('click', function () {
                    const chatMessage = this.getAttribute('data-chat');
                    document.getElementById('chat-message').textContent = chatMessage;
                    document.getElementById('chat-message').classList.remove('hidden');
                });
            });

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

            // Add animation to form inputs
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

            // Add a subtle animation to the submit button
            const submitButton = document.querySelector('button[type="submit"]');
            submitButton.addEventListener('mouseover', function () {
                this.style.transition  = 'all 0.3s ease';
                this.style.transform = 'translateY(-2px)';
                this.style.boxShadow = '0 4px 8px rgba(0,0,0,0.1)';
            });

            submitButton.addEventListener('mouseout', function () {
                this.style.transform = 'translateY(0)';
                this.style.boxShadow = 'none';
            });
        });
    </script>
</body>
</html>