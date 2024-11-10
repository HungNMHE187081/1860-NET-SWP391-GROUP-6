<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Dashboard | Children Care</title>
    <!-- ApexCharts -->
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
    <!-- Boxicons CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager/services.css">
    
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #858796;
            --success-color: #1cc88a;
            --info-color: #36b9cc;
            --warning-color: #f6c23e;
            --danger-color: #e74a3b;
        }
        
        body {
            background-color: #f8f9fc;
            font-family: 'Nunito', sans-serif;
        }
        
        .dashboard-header {
            margin-top: 50px;
            
            background: white;
            padding: 1rem 2rem;
            box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.15);
            margin-bottom: 1.5rem;
        }
        
        .dashboard-title {
            color: #5a5c69;
            font-size: 1.75rem;
            font-weight: 400;
            margin: 0;
        }
        
        .stats-card {
            border-left: .25rem solid;
            border-radius: .35rem;
            box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.15);
            margin-bottom: 1.5rem;
            padding: 1.5rem;
            position: relative;
            transition: transform .2s;
        }
        
        .stats-card:hover {
            transform: translateY(-3px);
        }
        
        .stats-card.primary { border-left-color: var(--primary-color); }
        .stats-card.success { border-left-color: var(--success-color); }
        .stats-card.info { border-left-color: var(--info-color); }
        .stats-card.warning { border-left-color: var(--warning-color); }
        
        .stats-card-title {
            color: var(--secondary-color);
            font-size: .7rem;
            font-weight: 700;
            text-transform: uppercase;
        }
        
        .stats-card-value {
            color: #5a5c69;
            font-size: 1.5rem;
            font-weight: 700;
            margin: .5rem 0;
        }
        
        .chart-container {
            background: white;
            border-radius: .35rem;
            box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.15);
            margin-bottom: 1.5rem;
            padding: 1.25rem;
        }
        
        .chart-header {
            border-bottom: 1px solid #e3e6f0;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
        }
        
        .chart-title {
            color: #4e73df;
            font-size: 1rem;
            font-weight: 700;
            margin: 0;
        }
        
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
            padding: 0 1.5rem;
        }
        
        @media (max-width: 992px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }
        
        .stats-row {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 1.5rem;
            padding: 0 1.5rem;
            margin-bottom: 1.5rem;
        }
        
        @media (max-width: 768px) {
            .stats-row {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 576px) {
            .stats-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar-->
    <header class="app-header">
        <!-- Sidebar toggle button-->
        <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
        <!-- Navbar Right Menu-->
        <ul class="app-nav">
            <!-- User Menu-->
            <li><a class="app-nav__item" href="${pageContext.request.contextPath}/logout">
                <i class='bx bx-log-out bx-rotate-180'></i>
            </a></li>
        </ul>
    </header>

    <!-- Include dashboardleft -->
    <%@ include file="dashboardleft.jsp" %>

    <!-- Main Content -->
    <main class="app-content">
        <!-- Dashboard Header -->
        <div class="dashboard-header">
            <h1 class="dashboard-title">Dashboard</h1>
        </div>
        
        <!-- Stats Cards -->
        <div class="stats-row">
            <div class="stats-card primary">
                <div class="stats-card-title">Tồng số dịch vụ</div>
                <div class="stats-card-value" id="totalServices">0</div>
                <i class="fas fa-calendar fa-2x text-gray-300 position-absolute end-0 top-50 translate-middle-y me-3"></i>
            </div>
            
            <div class="stats-card success">
                <div class="stats-card-title">Tổng số nhân viên</div>
                <div class="stats-card-value" id="totalStaff">0</div>
                <i class="fas fa-users fa-2x text-gray-300 position-absolute end-0 top-50 translate-middle-y me-3"></i>
            </div>
            
            <div class="stats-card info">
                <div class="stats-card-title">Đánh giá trung bình</div>
                <div class="stats-card-value" id="avgRating">0</div>
                <i class="fas fa-star fa-2x text-gray-300 position-absolute end-0 top-50 translate-middle-y me-3"></i>
            </div>
            
            <div class="stats-card warning">
                <div class="stats-card-title">Tổng số trẻ em</div>
                <div class="stats-card-value" id="totalChildren">0</div>
                <i class="fas fa-child fa-2x text-gray-300 position-absolute end-0 top-50 translate-middle-y me-3"></i>
            </div>
        </div>
        
        <!-- Charts Grid -->
        <div class="dashboard-grid">
            <!-- Service Statistics Chart -->
            <div class="chart-container">
                <div class="chart-header">
                    <h2 class="chart-title">
                        <i class="fas fa-chart-bar me-2"></i>
                        Thống kê dịch vụ
                    </h2>
                </div>
                <div id="serviceChart"></div>
            </div>
            
            <!-- Staff Performance Chart -->
            <div class="chart-container">
                <div class="chart-header">
                    <h2 class="chart-title">
                        <i class="fas fa-user-tie me-2"></i>
                        Thống kê nhân viên
                    </h2>
                </div>
                <div id="staffChart"></div>
            </div>
            
            <!-- Children Age Distribution Chart -->
            <div class="chart-container">
                <div class="chart-header">
                    <h2 class="chart-title">
                        <i class="fas fa-child me-2"></i>
                        Thống kê độ tuổi trẻ em
                    </h2>
                </div>
                <div id="childrenAgeChart"></div>
            </div>
            
            <!-- Category Distribution Chart -->
            <div class="chart-container">
                <div class="chart-header">
                    <h2 class="chart-title">
                        <i class="fas fa-th-list me-2"></i>
                        Thống kê danh mục dịch vụ
                    </h2>
                </div>
                <div id="categoryChart"></div>
            </div>
            
            <!-- Feedback Distribution Chart -->
            <div class="chart-container">
                <div class="chart-header">
                    <h2 class="chart-title">
                        <i class="fas fa-star me-2"></i>
                        Thống kê đánh giá
                    </h2>
                </div>
                <div id="feedbackChart"></div>
            </div>
            
            <!-- Monthly Order Statistics Chart -->
            <div class="chart-container">
                <div class="chart-header">
                    <h2 class="chart-title">
                        <i class="fas fa-chart-line me-2"></i>
                        Thống kê đơn hàng
                    </h2>
                </div>
                <div id="monthlyChart"></div>
            </div>
        </div>
    </main>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>
    
    <!-- Existing Chart Scripts -->
    <script>
        // Parse JSON data from server
        const serviceStats = ${serviceStats};
        const staffStats = ${staffStats};
        const childrenAgeStats = JSON.parse('${childrenAgeStats}');
        const categoryStats = ${categoryStats};
        const feedbackStats = ${feedbackStats};
        const monthlyStats = ${monthlyStats};

        // Calculate summary statistics for cards
        document.getElementById('totalServices').textContent = serviceStats.length;
        document.getElementById('totalStaff').textContent = staffStats.length;
        document.getElementById('avgRating').textContent = 
            (feedbackStats.reduce((acc, curr) => acc + curr.rating * curr.ratingCount, 0) / 
             feedbackStats.reduce((acc, curr) => acc + curr.ratingCount, 0)).toFixed(1);
        document.getElementById('totalChildren').textContent = 
            childrenAgeStats.reduce((acc, curr) => acc + curr.childCount, 0);

        // Chart configurations with improved styling
        const chartOptions = {
            chart: {
                toolbar: {
                    show: false
                },
                zoom: {
                    enabled: false
                }
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                curve: 'smooth',
                width: 2
            },
            grid: {
                borderColor: '#e7e7e7',
                row: {
                    colors: ['#f3f3f3', 'transparent'],
                    opacity: 0.5
                }
            }
        };

        // Service Statistics Chart
        new ApexCharts(document.querySelector("#serviceChart"), {
            ...chartOptions,  // Sử dụng chartOptions đã định nghĩa
            chart: {
                type: 'bar',
                height: 350,
                toolbar: {
                    show: false
                }
            },
            series: [{
                name: 'Bookings',
                data: serviceStats.map(stat => stat.bookingCount)
            }],
            xaxis: {
                categories: serviceStats.map(stat => stat.serviceName),
                labels: {
                    rotate: -45,
                    trim: true,
                    style: {
                        fontSize: '12px'
                    }
                }
            },
            colors: ['#4e73df']
        }).render();

        // Staff Performance Chart
        if (staffStats && staffStats.length > 0) {
            new ApexCharts(document.querySelector("#staffChart"), {
                ...chartOptions,
                chart: {
                    type: 'bar',
                    height: 350,
                    toolbar: {
                        show: false
                    }
                },
                series: [{
                    name: 'Appointments',
                    data: staffStats.map(stat => stat.totalAppointments)
                }, {
                    name: 'Unique Services',
                    data: staffStats.map(stat => stat.uniqueServices)
                }],
                plotOptions: {
                    bar: {
                        horizontal: false,
                        columnWidth: '55%',
                        endingShape: 'rounded'
                    },
                },
                xaxis: {
                    categories: staffStats.map(stat => stat.staffName),
                    labels: {
                        rotate: -45,
                        trim: true,
                        style: {
                            fontSize: '12px'
                        }
                    }
                },
                colors: ['#1cc88a', '#36b9cc']
            }).render();
        }

        // Children Age Distribution Chart
        if (childrenAgeStats && childrenAgeStats.length > 0) {
            new ApexCharts(document.querySelector("#childrenAgeChart"), {
                chart: {
                    type: 'pie',
                    height: 350
                },
                series: childrenAgeStats.map(stat => stat.childCount),
                labels: childrenAgeStats.map(stat => 
                    `${stat.age} tuổi (${stat.childCount} trẻ em)`
                ),
                colors: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b', 
                        '#6610f2', '#fd7e14', '#20c997', '#6f42c1', '#dc3545'],
                legend: {
                    position: 'bottom',
                    formatter: function(seriesName, opts) {
                        const stat = childrenAgeStats[opts.seriesIndex];
                        return `${stat.age} tuổi - ${stat.childCount} trẻ em (${stat.percentage.toFixed(1)}%)`;
                    }
                },
                tooltip: {
                    y: {
                        formatter: function(value, { seriesIndex, w }) {
                            const stat = childrenAgeStats[seriesIndex];
                            return `${stat.age} tuổi: ${value} trẻ em (${stat.percentage.toFixed(1)}%)`;
                        }
                    }
                },
                plotOptions: {
                    pie: {
                        dataLabels: {
                            offset: -5,
                            minAngleToShowLabel: 10
                        }
                    }
                },
                dataLabels: {
                    enabled: true,
                    formatter: function(val, opts) {
                        const stat = childrenAgeStats[opts.seriesIndex];
                        return [
                            `${stat.age} tuổi`,
                            `${stat.childCount} trẻ em`,
                            `${stat.percentage.toFixed(1)}%`
                        ];
                    },
                    style: {
                        fontSize: '12px',
                        fontFamily: 'Helvetica, Arial, sans-serif',
                        fontWeight: 'bold'
                    }
                }
            }).render();
        } else {
            document.querySelector("#childrenAgeChart").innerHTML = 
                '<div class="text-center p-3">Không có dữ liệu về độ tuổi</div>';
        }

        // Category Distribution Chart
        if (categoryStats && categoryStats.length > 0) {
            new ApexCharts(document.querySelector("#categoryChart"), {
                chart: {
                    type: 'pie',
                    height: 350
                },
                series: categoryStats.map(stat => parseInt(stat.serviceCount)),
                labels: categoryStats.map(stat => stat.categoryName),
                colors: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b'],
                legend: {
                    position: 'bottom'
                },
                tooltip: {
                    y: {
                        formatter: function(value) {
                            return value + " dịch vụ";
                        }
                    }
                },
                dataLabels: {
                    formatter(val, opts) {
                        const name = opts.w.globals.labels[opts.seriesIndex];
                        return [name, val.toFixed(1) + '%'];
                    }
                }
            }).render();
        } else {
            document.querySelector("#categoryChart").innerHTML = 
                '<div class="text-center p-3">Không có dữ liệu về danh mục</div>';
        }

        // Feedback Distribution Chart
        new ApexCharts(document.querySelector("#feedbackChart"), {
            ...chartOptions,
            chart: {
                type: 'bar',
                height: 350,
                toolbar: {
                    show: false
                }
            },
            series: [{
                name: 'Ratings',
                data: feedbackStats.map(stat => stat.ratingCount)
            }],
            xaxis: {
                categories: feedbackStats.map(stat => `${stat.rating} Stars`),
                labels: {
                    style: {
                        fontSize: '12px'
                    }
                }
            },
            colors: ['#f6c23e'],
            plotOptions: {
                bar: {
                    borderRadius: 4,
                    horizontal: false,
                }
            }
        }).render();

        // Monthly Order Statistics Chart
        new ApexCharts(document.querySelector("#monthlyChart"), {
            ...chartOptions,
            chart: {
                type: 'line',
                height: 350,
                toolbar: {
                    show: false
                }
            },
            series: [{
                name: 'Orders',
                data: monthlyStats.map(stat => stat.totalOrders)
            }, {
                name: 'Services',
                data: monthlyStats.map(stat => stat.totalServices)
            }],
            xaxis: {
                categories: monthlyStats.map(stat => `Month ${stat.month}`),
                labels: {
                    style: {
                        fontSize: '12px'
                    }
                }
            },
            colors: ['#4e73df', '#1cc88a'],
            stroke: {
                curve: 'smooth',
                width: 2
            },
            markers: {
                size: 4
            }
        }).render();
    </script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>