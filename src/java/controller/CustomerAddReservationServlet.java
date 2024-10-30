/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.OrderDAO;
import dal.ReservationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Time;
import model.Order;
import model.OrderItem;
import model.Reservation;

/**
 *
 * @author LENOVO
 */
public class CustomerAddReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int childID = Integer.parseInt(request.getParameter("childID"));
        int serviceID = Integer.parseInt(request.getParameter("serviceID"));
        Date reservationDate = Date.valueOf(request.getParameter("reservationDate"));
        Time startTime = Time.valueOf(request.getParameter("startTime") + ":00");
        int staffID = Integer.parseInt(request.getParameter("staffID"));
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        int quantity = 1; // Assuming one service per reservation
        float totalPrice = Float.parseFloat(request.getParameter("totalPrice"));

        // Create a new order object
        Order order = new Order();
        order.setCustomerID(customerID);
        order.setQuantity(quantity);
        order.setTotalPrice(totalPrice);

        // Save the order to the database
        OrderDAO orderDAO = new OrderDAO();
        int orderID = orderDAO.addOrder(order);

        // Create a new order item object
        OrderItem orderItem = new OrderItem();
        orderItem.setOrderID(orderID);
        orderItem.setServiceID(serviceID);
        orderItem.setChildID(childID);

        // Save the order item to the database
        int orderItemID = orderDAO.addOrderItem(orderItem);

        // Create a new reservation object
        Reservation reservation = new Reservation();
        reservation.setOrderItemID(orderItemID);
        reservation.setReservationDate(reservationDate);
        reservation.setStartTime(startTime);
        reservation.setStaffID(staffID);

        // Save the reservation to the database
        ReservationDAO reservationDAO = new ReservationDAO();
        reservationDAO.addReservation(reservation);

        // Redirect to a confirmation page or back to the form
        response.sendRedirect("reservationConfirmation.jsp");
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
        doGet(request, response);
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
