package controller;

import dal.UserDAO;
import model.Users;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class AdminEditUserServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        if (userIdStr != null && !userIdStr.isEmpty()) {
            try {
                int userId = Integer.parseInt(userIdStr);
                Users user = userDAO.getUserWithAddressById(userId);
                if (user != null) {
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("/Admin_JSP/admin-edit-user.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/adminsearchuser?error=User not found");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/admin/adminsearchuser?error=Invalid user ID");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/adminsearchuser?error=User ID is required");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Lấy giá trị từ request
    String userIdStr = request.getParameter("userId");
    String firstName = request.getParameter("firstName");
    String middleName = request.getParameter("middleName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");
    String dateOfBirthStr = request.getParameter("dateOfBirth"); // Khai báo và gán giá trị cho dateOfBirthStr
    String gender = request.getParameter("gender");
    String citizenIdentification = request.getParameter("citizenIdentification");

    // Chuyển đổi từ String sang java.util.Date
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date utilDate = null;
    java.sql.Date sqlDate = null;

    try {
        if (dateOfBirthStr != null && !dateOfBirthStr.isEmpty()) {
            utilDate = sdf.parse(dateOfBirthStr);
            if (utilDate != null) {
                sqlDate = new java.sql.Date(utilDate.getTime());
            }
        }
    } catch (ParseException e) {
        e.printStackTrace();
    }

    // Kiểm tra nếu sqlDate vẫn là null, có thể xử lý theo yêu cầu của bạn
    if (sqlDate == null) {
        // Xử lý trường hợp ngày sinh không hợp lệ hoặc không được cung cấp
        // Ví dụ: đặt giá trị mặc định hoặc thông báo lỗi
        sqlDate = new java.sql.Date(System.currentTimeMillis()); // Đặt giá trị mặc định là ngày hiện tại
    }

    if (userIdStr != null && !userIdStr.isEmpty()) {
        int userId = Integer.parseInt(userIdStr);
        Users user = new Users(userId, firstName, middleName, lastName, email, phoneNumber, sqlDate, gender, citizenIdentification);
        userDAO.updateUser(user);
        response.sendRedirect(request.getContextPath() + "/admin/adminuserslist");
    } else {
        response.sendRedirect(request.getContextPath() + "/admin/adminuserslist");
    }
}
}