package controller;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author HÙNG
 */
public class ResetPasswordServlet extends HttpServlet {
    private UserDAO userDAO;
    
    @Override
    public void init() {
        userDAO = new UserDAO();
        System.out.println("ResetPasswordServlet initialized");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("ResetPasswordServlet - doGet started");
        String code = request.getParameter("code");
        System.out.println("Reset code received: " + code);
        
        if (code == null || code.trim().isEmpty()) {
            String error = java.net.URLEncoder.encode("Mã xác nhận không hợp lệ", "UTF-8");
            response.sendRedirect("login.jsp?error=" + error);
            return;
        }
        request.getRequestDispatcher("reset-password.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("ResetPasswordServlet - doPost started");
        String code = request.getParameter("code");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        System.out.println("Code: " + code);
        System.out.println("Password match: " + password.equals(confirmPassword));
        
        if (!password.equals(confirmPassword)) {
            System.out.println("Passwords do not match");
            String error = java.net.URLEncoder.encode("Mật khẩu không khớp", "UTF-8");
            response.sendRedirect("reset-password.jsp?code=" + code + "&error=" + error);
            return;
        }
        
        Integer userID = userDAO.validatePasswordReset(code);
        System.out.println("UserID from validation: " + userID);
        
        if (userID != null) {
            boolean updated = userDAO.updatePassword(userID, password);
            System.out.println("Password update result: " + updated);
            
            if (updated) {
                String message = java.net.URLEncoder.encode("Mật khẩu đã được đặt lại thành công", "UTF-8");
                response.sendRedirect("login.jsp?message=" + message);
            } else {
                String error = java.net.URLEncoder.encode("Không thể cập nhật mật khẩu", "UTF-8");
                response.sendRedirect("reset-password.jsp?code=" + code + "&error=" + error);
            }
        } else {
            System.out.println("Invalid or expired reset code");
            String error = java.net.URLEncoder.encode("Mã xác nhận không hợp lệ hoặc đã hết hạn", "UTF-8");
            response.sendRedirect("forgot-password.jsp?error=" + error);
        }
    }
}
