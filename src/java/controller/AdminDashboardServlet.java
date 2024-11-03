/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.statistics.*;
import dal.StatisticsDAO;

/**
 *
 * @author HÙNG
 */
public class AdminDashboardServlet extends HttpServlet {
    private StatisticsDAO statisticsDAO;
    private Gson gson;
    
    @Override
    public void init() {
        statisticsDAO = new StatisticsDAO();
        gson = new Gson();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Lấy dữ liệu thống kê
        List<ServiceStatistics> serviceStats = statisticsDAO.getServiceStatistics();
        List<StaffStatistics> staffStats = statisticsDAO.getStaffStatistics();
        List<ChildrenAgeStatistics> childrenAgeStats = statisticsDAO.getChildrenAgeStatistics();
        List<CategoryStatistics> categoryStats = statisticsDAO.getCategoryStatistics();
        List<FeedbackStatistics> feedbackStats = statisticsDAO.getFeedbackStatistics();
        List<MonthlyOrderStatistics> monthlyStats = statisticsDAO.getMonthlyOrderStatistics();
        
        // Chuyển đổi sang JSON
        request.setAttribute("serviceStats", gson.toJson(serviceStats));
        request.setAttribute("staffStats", gson.toJson(staffStats));
        request.setAttribute("childrenAgeStats", gson.toJson(childrenAgeStats));
        request.setAttribute("categoryStats", gson.toJson(categoryStats));
        request.setAttribute("feedbackStats", gson.toJson(feedbackStats));
        request.setAttribute("monthlyStats", gson.toJson(monthlyStats));
        
        // Forward đến trang JSP
        request.getRequestDispatcher("/Admin_JSP/admin-dashboard.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
