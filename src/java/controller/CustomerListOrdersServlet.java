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
//        String customerID = request.getParameter("userID");
OrderDAO orderDAO = new OrderDAO();
List<Order> orders = orderDAO.getOrdersByCustomerID(1);

request.setAttribute("orders", orders);

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
