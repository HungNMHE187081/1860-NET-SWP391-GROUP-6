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
public class CustomerListOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ReservationDAO reservationDAO = new ReservationDAO();
        List<Reservation> reservation = reservationDAO.getAllReservations();
        OrderDAO orderDAO = new OrderDAO();
        OrderItem orderItem = orderDAO.getOrderItemsByOrderItemID(1);
        Order order = orderDAO.getOrdersByOrderID(orderItem.getOrderID());
        ChildrenDAO childrenDAO = new ChildrenDAO();
        Children child = childrenDAO.getChildrenByID(orderItem.getChildID());
        ManagerUserDAO managerUserDAO = new ManagerUserDAO();
        Users user = managerUserDAO.getDetailUserByUserID(order.getCustomerID());
        ServiceDAO serviceDAO = new ServiceDAO();
        Service service = serviceDAO.getServiceByID(orderItem.getServiceID());
        AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
        AgeLimits ageLimits = ageLimitDAO.getAgeLimitByID(service.getAgeLimitID());
     
        request.setAttribute("reservation", reservation);
        request.setAttribute("child", child);
        request.setAttribute("user", user);
        request.setAttribute("order", order);
        request.setAttribute("orderItem", orderItem);
        request.setAttribute("service", service);
        request.setAttribute("ageLimits", ageLimits);
        request.getRequestDispatcher("/Common_JSP/home-orders-list.jsp").forward(request, response);
    } 

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
