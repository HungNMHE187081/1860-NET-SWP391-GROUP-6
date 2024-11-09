<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head> 
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ChildCare</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
       <style>
    :root {
        --primary-color: #4a90e2;
        --secondary-color: #f4f4f4;
        --text-color: #333;
        --light-text-color: #666;
        --card-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        --transition-speed: 0.3s;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Roboto', sans-serif;
        line-height: 1.6;
        color: var(--text-color);
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        min-height: 100vh;
    }

    .container {
        width: 100%;
        min-height: 100vh;
        padding: 0;
        opacity: 0;
        animation: fadeIn 0.6s ease-out forwards;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    .card {
        background-color: #fff;
        box-shadow: var(--card-shadow);
        overflow: hidden;
        transition: box-shadow var(--transition-speed);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    .card:hover {
        box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
    }

    .card-image {
        width: 100%;
        height: 50vh;
        object-fit: cover;
        transition: transform var(--transition-speed);
    }

    .card:hover .card-image {
        transform: scale(1.02);
    }

    .card-content {
        padding: 2.5rem;
        position: relative;
        background: linear-gradient(to bottom, #fff 0%, #f9f9f9 100%);
        flex-grow: 1;
    }

    .back-link {
        display: inline-flex;
        align-items: center;
        margin-bottom: 1.5rem;
        color: var(--primary-color);
        text-decoration: none;
        font-weight: 500;
        padding: 0.5rem 1rem;
        border-radius: 25px;
        background-color: rgba(74, 144, 226, 0.1);
        transition: all var(--transition-speed);
    }

    .back-link:hover {
        background-color: var(--primary-color);
        color: white;
        transform: translateX(-5px);
    }

    .back-link .icon {
        margin-right: 0.5rem;
        transition: transform var(--transition-speed);
    }

    .back-link:hover .icon {
        transform: translateX(-3px);
    }

    h1 {
        font-size: 2.5rem;
        margin-bottom: 1.5rem;
        color: var(--primary-color);
        position: relative;
        padding-bottom: 0.5rem;
    }

    h1::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 60px;
        height: 3px;
        background-color: var(--primary-color);
        transition: width var(--transition-speed);
    }

    h1:hover::after {
        width: 100px;
    }

    .service-details {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 1.5rem;
        margin-bottom: 2.5rem;
    }

    .detail-item {
        background-color: #fff;
        padding: 1.5rem;
        border-radius: 12px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        transition: all var(--transition-speed);
        border: 1px solid rgba(0, 0, 0, 0.05);
        position: relative;
        cursor: pointer;
    }

    .detail-item:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 12px rgba(0, 0, 0, 0.1);
        border-color: var(--primary-color);
    }

    .detail-item h2 {
        font-size: 1.1rem;
        margin-bottom: 0.75rem;
        color: var(--light-text-color);
        display: flex;
        align-items: center;
    }

    .detail-item p {
        font-weight: 500;
        color: var(--text-color);
        font-size: 1.1rem;
    }

    .icon {
        margin-right: 0.5rem;
        color: var(--primary-color);
        transition: transform var(--transition-speed);
    }

    .detail-item:hover .icon {
        transform: scale(1.2);
    }

    .description {
        line-height: 1.8;
        white-space: pre-line;
        padding: 1.5rem;
        background-color: rgba(74, 144, 226, 0.05);
        border-radius: 12px;
        margin-top: 1rem;
        border-left: 4px solid var(--primary-color);
        transition: all var(--transition-speed);
    }

    .description:hover {
        background-color: rgba(74, 144, 226, 0.1);
        transform: translateX(5px);
    }

    @media (max-width: 768px) {
        .card-image {
            height: 30vh;
        }

        .card-content {
            padding: 1.5rem;
        }

        h1 {
            font-size: 2rem;
        }

        .service-details {
            gap: 1rem;
        }

        .detail-item {
            padding: 1rem;
        }
    }

    /* Tooltip styles */
    .detail-item::before {
        content: attr(data-tooltip);
        position: absolute;
        bottom: 100%;
        left: 50%;
        transform: translateX(-50%) translateY(-10px);
        background-color: rgba(0, 0, 0, 0.8);
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 6px;
        font-size: 0.875rem;
        white-space: nowrap;
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
        z-index: 1000;
        pointer-events: none;
    }

    .detail-item::after {
        content: '';
        position: absolute;
        bottom: 100%;
        left: 50%;
        transform: translateX(-50%);
        border: 8px solid transparent;
        border-top-color: rgba(0, 0, 0, 0.8);
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
        pointer-events: none;
    }

    .detail-item:hover::before,
    .detail-item:hover::after {
        opacity: 1;
        visibility: visible;
        transform: translateX(-50%) translateY(0);
    }

    .detail-item .info-icon {
        position: absolute;
        top: 0.5rem;
        right: 0.5rem;
        color: var(--primary-color);
        font-size: 0.8rem;
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    .detail-item:hover .info-icon {
        opacity: 1;
    }

    .detail-content {
        position: relative;
        z-index: 1;
    }

    .expandable-info {
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.3s ease-out;
        background-color: rgba(74, 144, 226, 0.05);
        border-radius: 6px;
        margin-top: 0.5rem;
    }

    .detail-item:hover .expandable-info {
        max-height: 200px;
        padding: 0.5rem;
    }
</style>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <img src="${pageContext.request.contextPath}/${service.serviceImage}" 
                     alt="Image of ${service.serviceName}" class="card-image" loading="lazy">
                <div class="card-content">
                    <a href="${pageContext.request.contextPath}/guest/services" class="back-link">
                        <i class="fas fa-arrow-left icon"></i> Trở về
                    </a>
                    <h1>${service.serviceName}</h1>
                    <div class="service-details">
                    <div class="detail-item" data-tooltip="Phạm vi độ tuổi phù hợp cho dịch vụ này">
                        <i class="fas fa-info-circle info-icon"></i>
                        <div class="detail-content">
                            <h2><i class="fas fa-child icon"></i>Độ tuổi</h2>
                            <p>
                                <c:forEach var="ageLimit" items="${ageLimits}">
                                    <c:if test="${ageLimit.ageLimitID == service.ageLimitID}">
                                        ${ageLimit.ageLimit}
                                    </c:if>
                                </c:forEach>
                            </p>
                            <div class="expandable-info">
                                Dịch vụ được thiết kế đặc biệt cho độ tuổi này, đảm bảo phương pháp và cách tiếp cận phù hợp với sự phát triển của trẻ.
                            </div>
                        </div>
                    </div>
                    
                    <div class="detail-item" data-tooltip="Phân loại và đặc điểm của dịch vụ">
                        <i class="fas fa-info-circle info-icon"></i>
                        <div class="detail-content">
                            <h2><i class="fas fa-concierge-bell icon"></i>Loại dịch vụ</h2>
                            <p>
                                <c:forEach var="category" items="${categories}">
                                    <c:if test="${category.categoryID == service.categoryID}">
                                        ${category.categoryName}
                                    </c:if>
                                </c:forEach>
                            </p>
                            <div class="expandable-info">
                                Mỗi loại dịch vụ được thiết kế để đáp ứng nhu cầu cụ thể của trẻ và gia đình.
                            </div>
                        </div>
                    </div>

                    <div class="detail-item" data-tooltip="Trình độ chuyên môn của nhân viên">
                        <i class="fas fa-info-circle info-icon"></i>
                        <div class="detail-content">
                            <h2><i class="fas fa-user-tie icon"></i>Nhân viên thực hiện</h2>
                            <p>
                                <c:forEach var="degree" items="${degrees}">
                                    <c:if test="${degree.degreeID == service.degreeID}">
                                        ${degree.degreeName}
                                    </c:if>
                                </c:forEach>
                            </p>
                            <div class="expandable-info">
                                Đội ngũ nhân viên được đào tạo chuyên sâu và có chứng chỉ phù hợp để đảm bảo chất lượng dịch vụ tốt nhất.
                            </div>
                        </div>
                    </div>

                    <div class="detail-item" data-tooltip="Chi phí dịch vụ">
                        <i class="fas fa-info-circle info-icon"></i>
                        <div class="detail-content">
                            <h2><i class="fas fa-money-bill-wave icon"></i>Giá</h2>
                            <p><fmt:formatNumber value="${service.price}" type="number" groupingUsed="true" />₫</p>
                            <div class="expandable-info">
                                Giá đã bao gồm đầy đủ chi phí và thiết bị cần thiết cho dịch vụ.
                            </div>
                        </div>
                    </div>

                    <div class="detail-item" data-tooltip="Thời gian dự kiến cho mỗi buổi">
                        <i class="fas fa-info-circle info-icon"></i>
                        <div class="detail-content">
                            <h2><i class="fas fa-clock icon"></i>Thời gian khám tối đa</h2>
                            <p>${service.duration} phút</p>
                            <div class="expandable-info">
                                Thời gian được tính toán để đảm bảo dịch vụ được thực hiện đầy đủ và hiệu quả nhất.
                            </div>
                        </div>
                    </div>
                </div>
                    <h2>Mô tả</h2>
                    <p class="description">${service.description}</p>
                </div>
            </div>
        </div>

        <script>
            // Add loading state handling
            document.addEventListener('DOMContentLoaded', function() {
                const img = document.querySelector('.card-image');
                img.classList.add('loading');
                
                img.onload = function() {
                    img.classList.remove('loading');
                }
            });

            // Add smooth scroll behavior
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    document.querySelector(this.getAttribute('href')).scrollIntoView({
                        behavior: 'smooth'
                    });
                });
            });
        </script>
    </body>
</html>