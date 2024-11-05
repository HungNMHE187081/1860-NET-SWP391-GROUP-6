package controller;

import dal.ChildrenDAO;
import dal.OrderDAO;
import dal.ReservationDAO;
import dal.ServiceDAO;
import dal.StaffDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;
import model.Users;

public class CustomerViewReservationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            System.out.println("=== CustomerViewReservationServlet START ===");
            
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            
            System.out.println("User from session: " + (user != null ? user.getUserID() : "null"));
            
            if (user != null) {
                String reservationID = request.getParameter("id");
                System.out.println("Received reservation ID: " + reservationID);
                
                if (reservationID != null && !reservationID.isEmpty()) {
                    ReservationDAO reservationDAO = new ReservationDAO();
                    
                    try {
                        int id = Integer.parseInt(reservationID);
                        System.out.println("Calling DAO with ID: " + id);
                        
                        Map<String, Object> details = reservationDAO.getReservationDetailsByID(id);
                        
                        System.out.println("DAO returned details: " + details);
                        
                        if (details != null && !details.isEmpty()) {
                            request.setAttribute("details", details);
                            System.out.println("Forwarding to JSP with details");
                            String jspPath = "/Common_JSP/view-reservation-details.jsp";
                            System.out.println("JSP path: " + jspPath);
                            
                            request.getRequestDispatcher(jspPath).forward(request, response);
                            return;
                        } else {
                            System.out.println("No details found for ID: " + id);
                        }
                    } catch (NumberFormatException e) {
                        System.out.println("Error parsing ID: " + e.getMessage());
                    }
                }
                
                System.out.println("Redirecting to list reservations");
                response.sendRedirect(request.getContextPath() + "/customer/listreservations");
                
            } else {
                System.out.println("No user in session, redirecting to login");
                response.sendRedirect(request.getContextPath() + "/login");
            }
            
            System.out.println("=== CustomerViewReservationServlet END ===");
            
        } catch (Exception e) {
            System.out.println("ERROR in CustomerViewReservationServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}