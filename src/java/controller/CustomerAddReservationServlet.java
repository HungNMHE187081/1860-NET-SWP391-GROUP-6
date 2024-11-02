package controller;

import dal.AgeLimitDAO;
import dal.ChildrenDAO;
import dal.OrderDAO;
import dal.ReservationDAO;
import dal.ServiceDAO;
import dal.StaffDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import model.AgeLimits;
import model.Children;
import model.Order;
import model.OrderItem;
import model.Reservation;
import model.Service;
import model.Staff;
import model.Users;

public class CustomerAddReservationServlet extends HttpServlet {

    private Integer getServiceID(HttpServletRequest request) {
        String serviceIDParam = request.getParameter("serviceID");
        if (serviceIDParam == null || serviceIDParam.isEmpty()) {
            return null;
        }
        try {
            return Integer.parseInt(serviceIDParam);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            Integer serviceID = getServiceID(request);
            if (serviceID == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid service ID.");
                return;
            }

            ServiceDAO serviceDAO = new ServiceDAO();
            Service service = serviceDAO.getServiceByID(serviceID);
            int ageLimitID = service.getAgeLimitID();
            AgeLimitDAO ageDAO = new AgeLimitDAO();
            AgeLimits ageLimit = ageDAO.getAgeLimitByID(ageLimitID);
            if (service == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Service not found.");
                return;
            }

            ChildrenDAO childrenDAO = new ChildrenDAO();
            List<Children> allChildren = childrenDAO.getAgeOfChildrenByCustomerID(user.getUserID());
            List<Children> childrenByAge = new ArrayList<>();

            // Filtering logic based on service's age limit
            for (Children child : allChildren) {
                int age = child.getAge();
                if (ageLimitID == 1 && age < 1) {
                    childrenByAge.add(child);
                } else if (ageLimitID == 2 && age >= 1 && age < 6) {
                    childrenByAge.add(child);
                } else if (ageLimitID == 3 && age >= 6 && age < 13) {
                    childrenByAge.add(child);
                } else if (ageLimitID == 4 && age >= 13 && age < 18) {
                    childrenByAge.add(child);
                }
            }

            StaffDAO staffDAO = new StaffDAO();
            List<Staff> staffs = staffDAO.getStaffByDegreeID(service.getDegreeID());
            
            request.setAttribute("ageLimit", ageLimit);
            request.setAttribute("service", service);
            request.setAttribute("children", childrenByAge);
            request.setAttribute("staffs", staffs);

            request.getRequestDispatcher("/Common_JSP/home-add-reservation.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            try {
                // Get and debug all parameters
                Integer serviceID = getServiceID(request);
                String childIDStr = request.getParameter("childID");
                String startTime = request.getParameter("startTime") + ":00";
                String reservationDate = request.getParameter("reservationDate");
                String staffIDStr = request.getParameter("staffID");

                // Check parameters
                if (serviceID == null || childIDStr == null || startTime == null || 
                    reservationDate == null || staffIDStr == null || 
                    childIDStr.isEmpty() || startTime.isEmpty() || 
                    reservationDate.isEmpty() || staffIDStr.isEmpty()) {
                    throw new ServletException("Missing required parameters");
                }

                int childID = Integer.parseInt(childIDStr);
                int staffID = Integer.parseInt(staffIDStr);
                
                // Get service and child info
                ServiceDAO serviceDAO = new ServiceDAO();
                ChildrenDAO childrenDAO = new ChildrenDAO();
                Service service = serviceDAO.getServiceByID(serviceID);
                Children child = childrenDAO.getChildrenByID(childID);

                if (service == null || child == null) {
                    throw new ServletException("Service or Child not found");
                }
                
                // Create order with proper error handling
                OrderDAO orderDAO = new OrderDAO();
                Order order = new Order(0, user.getUserID(), 1, service.getPrice(), "", true);
                order = orderDAO.addOrder(order);
                
                if (order.getOrderID() <= 0) {
                    throw new ServletException("Failed to create order - invalid ID generated: " + order.getOrderID());
                }
                
                // Create order item with proper error handling
                OrderItem orderItem = new OrderItem(0, order.getOrderID(), serviceID, childID);
                orderItem = orderDAO.addOrderItem(orderItem);
                
                if (orderItem.getOrderItemID() <= 0) {
                    throw new ServletException("Failed to create order item - invalid ID generated: " + orderItem.getOrderItemID());
                }
                
                // Create reservation
                ReservationDAO reservationDAO = new ReservationDAO();
                Reservation reservation = new Reservation(
                    0, 
                    orderItem.getOrderItemID(),
                    reservationDate,
                    startTime,
                    staffID,
                    false,  // isExam
                    false   // hasRecord
                );
                
                boolean success = reservationDAO.addReservation(reservation);
                if (!success) {
                    throw new ServletException("Failed to add reservation - database error");
                }
                
                // If we get here, everything worked
                response.sendRedirect(request.getContextPath() + "/Common_JSP/reservationConfirmation.jsp");
                
            } catch (Exception e) {
                throw new ServletException(e);
            }
        } else {
            response.sendRedirect("login");
        }
    }
}
