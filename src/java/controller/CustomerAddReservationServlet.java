/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ChildrenDAO;
import dal.OrderDAO;
import dal.ReservationDAO;
import dal.ServiceDAO;
import dal.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Children;
import model.Order;
import model.OrderItem;
import model.Reservation;
import model.Service;
import model.Users;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
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
            if (serviceID != null) {
                ServiceDAO serviceDAO = new ServiceDAO();
                Service service = serviceDAO.getServiceByID(serviceID);
                int AgeLimitID = service.getAgeLimitID();
                List<Service> services = serviceDAO.getServicesByAgeLimitID(AgeLimitID);
                ChildrenDAO childrenDAO = new ChildrenDAO();
                List<Children> children = childrenDAO.getAgeOfChildrenByCustomerID(user.getUserID());
                StaffDAO staffDAO = new StaffDAO();
                List<Children> childrenByAge = new ArrayList<>();

                if (AgeLimitID == 1) {
                    for (Children child : children) {
                        if (child.getAge() < 1) {
                            childrenByAge.add(child);
                        }
                    }
                } else if (AgeLimitID == 2) {
                    for (Children child : children) {
                        if (child.getAge() >= 1 && child.getAge() < 6) {
                            childrenByAge.add(child);
                        }
                    }
                } else if (AgeLimitID == 3) {
                    for (Children child : children) {
                        if (child.getAge() >= 6 && child.getAge() < 13) {
                            childrenByAge.add(child);
                        }
                    }
                } else if (AgeLimitID == 4) {
                    for (Children child : children) {
                        if (child.getAge() >= 13 && child.getAge() < 18) {
                            childrenByAge.add(child);
                        }
                    }
                }

                ReservationDAO reservationDAO = new ReservationDAO();

                request.setAttribute("children", childrenByAge);
                request.setAttribute("service", service);
                request.getRequestDispatcher("/Common_JSP/home-add-reservation.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/Common_JSP/home-list-service.jsp");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user != null) {
            try {
                int childID = Integer.parseInt(request.getParameter("childID"));
                int serviceID = Integer.parseInt(request.getParameter("serviceID"));
                String reservationDate = request.getParameter("reservationDate");
                String startTime = request.getParameter("startTime");
                int staffID = Integer.parseInt(request.getParameter("staffID"));
                int customerID = Integer.parseInt(request.getParameter("customerID"));
                int quantity = 1; // Assuming one service per reservation
                float totalPrice = Float.parseFloat(request.getParameter("totalPrice"));

                ChildrenDAO childrenDAO = new ChildrenDAO();

                LocalDate currentDate = LocalDate.now(); // Get the current date

                // Create a new order object
                Order order = new Order();
                order.setCustomerID(customerID);
                order.setQuantity(quantity);
                order.setTotalPrice(totalPrice);

                // Save the order to the database
                OrderDAO orderDAO = new OrderDAO();
                orderDAO.addOrder(order);

                // Create a new order item object
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderID(order.getOrderID());
                orderItem.setServiceID(serviceID);
                orderItem.setChildID(childID);

                // Save the order item to the database
                orderDAO.addOrderItem(orderItem);

                // Create a new reservation object
                Reservation reservation = new Reservation();
                reservation.setOrderItemID(orderItem.getOrderItemID());
                reservation.setReservationDate(reservationDate);
                reservation.setStartTime(startTime);
                reservation.setStaffID(staffID);

                // Save the reservation to the database
                ReservationDAO reservationDAO = new ReservationDAO();
                reservationDAO.addReservation(reservation);

                // Redirect to the doGet method to display the form again
                response.sendRedirect(request.getContextPath() + "/customer/addreservation?serviceID=" + serviceID);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/errorPage.jsp"); // Update this path to a valid error page
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
