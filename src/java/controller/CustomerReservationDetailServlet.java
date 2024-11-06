package controller;

import dal.ReservationDAO;
import dal.OrderDAO;
import dal.PaymentDAO;
import dal.ServiceDAO;
import dal.StaffDAO;
import dal.ChildrenDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Reservation;
import model.Order;
import model.OrderItem;
import model.Payment;
import model.Service;
import model.Staff;
import model.Children;
import model.Users;

public class CustomerReservationDetailServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            String reservationIdStr = request.getParameter("id");
            if (reservationIdStr == null || reservationIdStr.isEmpty()) {
                throw new Exception("Reservation ID is required");
            }

            int reservationId = Integer.parseInt(reservationIdStr);
            System.out.println("Getting details for reservation ID: " + reservationId);

            // Lấy thông tin reservation
            ReservationDAO reservationDAO = new ReservationDAO();
            Reservation reservation = reservationDAO.getReservationById(reservationId);

            if (reservation == null) {
                throw new Exception("Reservation not found");
            }

            // Lấy thông tin OrderItem
            OrderDAO orderDAO = new OrderDAO();
            OrderItem orderItem = orderDAO.getOrderItemById(reservation.getOrderItemID());

            if (orderItem == null) {
                throw new Exception("Order item not found");
            }

            // Lấy thông tin Order
            Order order = orderDAO.getOrderById(orderItem.getOrderID());

            // Kiểm tra xem reservation có thuộc về user hiện tại không
            if (order.getCustomerID() != user.getUserID()) {
                throw new Exception("Unauthorized access to reservation");
            }

            // Lấy các thông tin liên quan
            ServiceDAO serviceDAO = new ServiceDAO();
            Service service = serviceDAO.getServiceByID(orderItem.getServiceID());

            StaffDAO staffDAO = new StaffDAO();
            Staff staff = staffDAO.getStaffByID(reservation.getStaffID());

            ChildrenDAO childrenDAO = new ChildrenDAO();
            Children child = childrenDAO.getChildrenByID(orderItem.getChildID());

            PaymentDAO paymentDAO = new PaymentDAO();
            Payment payment = paymentDAO.getPaymentByReservationId(reservationId);

            // Set attributes
            request.setAttribute("reservation", reservation);
            request.setAttribute("orderItem", orderItem);
            request.setAttribute("order", order);
            request.setAttribute("service", service);
            request.setAttribute("staff", staff);
            request.setAttribute("child", child);
            request.setAttribute("payment", payment);

            // Forward to JSP
            request.getRequestDispatcher("/Common_JSP/reservation-detail.jsp")
                  .forward(request, response);

        } catch (Exception e) {
            System.out.println("Error in CustomerReservationDetailServlet: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Không thể tải thông tin đặt lịch: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
