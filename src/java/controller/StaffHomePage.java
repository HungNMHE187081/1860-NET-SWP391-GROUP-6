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

        if (user != null) {
            StaffDAO staffDAO = new StaffDAO();
            ReservationHomeDAO reservationHomeDAO = new ReservationHomeDAO();
            
            Staff staff = staffDAO.getStaffByID(user.getUserID());

            if (staff != null) {
                List<ReservationHome> listReservation = reservationHomeDAO.getReservationsByStaffID(staff.getStaffID());
                
                request.setAttribute("staff", staff);
                request.setAttribute("listReservation", listReservation);

                request.getRequestDispatcher("/Staff_JSP/staff-home-page.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Staff information not found.");
                response.sendRedirect(request.getContextPath() + "/login");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); 
    }

    @Override
    public String getServletInfo() {
        return "Servlet for displaying staff home page with reservations.";
    }
}
