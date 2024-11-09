package controller;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Logger;

/**
 *
 * @author HÙNG
 */
public class ResetPasswordServlet extends HttpServlet {
    private UserDAO userDAO;
    private static final Logger LOGGER = Logger.getLogger(ResetPasswordServlet.class.getName());
    
    @Override
    public void init() {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("ResetPasswordServlet - doGet started");
        String code = request.getParameter("code");
        System.out.println("Reset code received: " + code);
        
        request.setAttribute("code", code);
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
            System.out.println("Password match: false");
            System.out.println("Passwords do not match");
            
            request.setAttribute("code", code);
            request.setAttribute("error", "Mật khẩu không khớp!");
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
            return;
        }
        
        Integer userID = userDAO.validatePasswordReset(code);
        if (userID != null) {
            if (userDAO.updatePassword(userID, password)) {
                request.setAttribute("message", "Đặt lại mật khẩu thành công!");
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("code", code);
                request.setAttribute("error", "Không thể cập nhật mật khẩu. Vui lòng thử lại.");
                request.getRequestDispatcher("reset-password.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("code", code);
            request.setAttribute("error", "Mã xác nhận không hợp lệ hoặc đã hết hạn.");
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
        }
    }
}
