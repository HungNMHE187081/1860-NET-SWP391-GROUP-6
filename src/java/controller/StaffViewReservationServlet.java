/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AgeLimitDAO;
import dal.ChildrenDAO;
import dal.ManagerUserDAO;
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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.AgeLimits;
import model.Children;
import model.Order;
import model.OrderItem;
import model.Reservation;
import model.Service;
import model.Staff;
import model.Users;

/**
 *
 * @author LENOVO
 */
public class StaffViewReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int reservationID = Integer.parseInt(request.getParameter("reservationID"));
                
        ReservationDAO reservationDAO = new ReservationDAO();
        Reservation reservation = reservationDAO.getReservationByID(reservationID);
        OrderDAO orderDAO = new OrderDAO();
        OrderItem orderItem = orderDAO.getOrderItemsByOrderItemID(reservation.getOrderItemID());
        Order order = orderDAO.getOrdersByOrderID(orderItem.getOrderID());
        ChildrenDAO childrenDAO = new ChildrenDAO();
        Children child = childrenDAO.getChildrenByID(orderItem.getChildID());
        ManagerUserDAO managerUserDAO = new ManagerUserDAO();
        Users user = managerUserDAO.getDetailUserByUserID(order.getCustomerID());
        ServiceDAO serviceDAO = new ServiceDAO();
        Service service = serviceDAO.getServiceByID(orderItem.getServiceID());
        AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
        AgeLimits ageLimits = ageLimitDAO.getAgeLimitByID(service.getAgeLimitID());
        StaffDAO staffDAO = new StaffDAO();
        Staff staff = staffDAO.getStaffByID(reservation.getStaffID());
     
        request.setAttribute("reservation", reservation);
        request.setAttribute("child", child);
        request.setAttribute("user", user);
        request.setAttribute("order", order);
        request.setAttribute("orderItem", orderItem);
        request.setAttribute("service", service);
        request.setAttribute("ageLimits", ageLimits);
        request.setAttribute("staff", staff);
        request.getRequestDispatcher("/Staff_JSP/staff-view-reservation.jsp").forward(request, response);
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
