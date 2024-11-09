package controller;

import dal.ReservationDAO;
import dal.StaffDAO;
import dal.ReservationHomeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.ReservationHome;
import model.Staff;
import model.Users;

public class StaffHomePage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        // Kiểm tra xem người dùng đã đăng nhập chưa
        if (user != null) {
            StaffDAO staffDAO = new StaffDAO();
            ReservationHomeDAO reservationHomeDAO = new ReservationHomeDAO();
            
            // Lấy thông tin nhân viên từ ID người dùng
            Staff staff = staffDAO.getStaffByID(user.getUserID());

            if (staff != null) {
                // Lấy danh sách các cuộc hẹn của nhân viên
                List<ReservationHome> listReservation = reservationHomeDAO.getReservationsByStaffID(staff.getStaffID());
                
                // Set thông tin nhân viên và danh sách cuộc hẹn vào request attribute
                request.setAttribute("staff", staff);
                request.setAttribute("listReservation", listReservation);

                // Forward sang trang JSP để hiển thị
                request.getRequestDispatcher("/Staff_JSP/staff-home-page.jsp").forward(request, response);
            } else {
                // Nếu không tìm thấy nhân viên, chuyển hướng về trang lỗi hoặc hiển thị thông báo
                request.setAttribute("error", "Staff information not found.");
                response.sendRedirect(request.getContextPath() + "/login");
            }
        } else {
            // Nếu người dùng chưa đăng nhập, chuyển hướng về trang login
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý logic cho POST request nếu cần
        doGet(request, response); // Gọi lại doGet nếu không có logic POST đặc biệt
    }

    @Override
    public String getServletInfo() {
        return "Servlet for displaying staff home page with reservations.";
    }
}
