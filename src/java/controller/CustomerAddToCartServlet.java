/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ChildrenDAO;
import dal.OrderDAO;
import dal.ReservationDAO;
import dal.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Children;
import model.Order;
import model.OrderItem;
import model.Reservation;
import model.Service;
import model.Users;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class CustomerAddToCartServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            try {
                // Get parameters
                int serviceID = Integer.parseInt(request.getParameter("serviceID")); 
                int childID = Integer.parseInt(request.getParameter("childID"));
                String startTime = request.getParameter("startTime");
                String reservationDate = request.getParameter("reservationDate");
                int staffID = Integer.parseInt(request.getParameter("staffID"));

                // Create DAOs
                ServiceDAO serviceDAO = new ServiceDAO();
                OrderDAO orderDAO = new OrderDAO();
                ReservationDAO resDAO = new ReservationDAO();

                // Get service price
                Service service = serviceDAO.getServiceByID(serviceID);

                // Create order and order item first to get IDs
                Order order = new Order();
                order.setCustomerID(user.getUserID());
                order.setQuantity(1);
                order.setTotalPrice(service.getPrice());
                order.setOrderDate(new Date());
                order.setCheckOut(false);  // Set as cart item
                
                // Add order and get ID
                int orderId = orderDAO.insert(order);
                if (orderId > 0) {
                    order.setOrderID(orderId);
                    System.out.println("Created order with ID: " + orderId);
                } else {
                    throw new Exception("Failed to create order");
                }

                // Create and add order item
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderID(order.getOrderID());
                orderItem.setServiceID(serviceID);
                orderItem.setChildID(childID);
                orderItem = orderDAO.addOrderItem(orderItem);

                // Create and add reservation
                Reservation reservation = new Reservation();
                reservation.setOrderItemID(orderItem.getOrderItemID());
                reservation.setStaffID(staffID);
                reservation.setReservationDate(reservationDate);
                reservation.setStartTime(startTime);
                reservation.setIsExam(false);
                reservation.setHasRecord(false);
                resDAO.addReservation(reservation);

                // Add to session cart
                Map<String, Object> cartItem = new HashMap<>();
                cartItem.put("orderID", order.getOrderID());
                cartItem.put("orderItemID", orderItem.getOrderItemID());
                cartItem.put("serviceID", serviceID);
                cartItem.put("childID", childID);
                cartItem.put("staffID", staffID);
                cartItem.put("startTime", startTime);
                cartItem.put("reservationDate", reservationDate);
                cartItem.put("price", service.getPrice());

                List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
                if (cart == null) {
                    cart = new ArrayList<>();
                }
                cart.add(cartItem);
                session.setAttribute("cart", cart);

                response.sendRedirect(request.getContextPath() + "/customer/viewcart");

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error adding to cart: " + e.getMessage());
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
