/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ChildrenDAO;
import dal.ManagerUserDAO;
import dal.OrderDAO;
import dal.ReservationDAO;
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
import model.Children;
import model.Order;
import model.OrderItem;
import model.Reservation;
import model.Staff;
import model.Users;

/**
 *
 * @author LENOVO
 */
public class ManagerReservationsListServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ReservationDAO reservationDAO = new ReservationDAO();
        List<Reservation> reservations = reservationDAO.getReservationByIsExam(false);
        OrderDAO orderDAO = new OrderDAO();
        List<OrderItem> orderItems = orderDAO.getAllOrderItems();
        List<Order> orders = orderDAO.getAllOrders();
        ChildrenDAO childrenDAO = new ChildrenDAO();
        List<Children> children = childrenDAO.getAllChildren();
        ManagerUserDAO managerUserDAO = new ManagerUserDAO();
        List<Users> users = managerUserDAO.getAllUsers();
        StaffDAO staffDAO = new StaffDAO();
        List<Staff> staffs = staffDAO.getAllStaffs();
 
      
            Collections.sort(reservations, new Comparator<Reservation>() {
                @Override
                public int compare(Reservation s1, Reservation s2) {
                    return s1.getReservationDate().compareTo(s2.getReservationDate());
                }
            });
     

        request.setAttribute("reservations", reservations);
        request.setAttribute("children", children);
        request.setAttribute("users", users);
        request.setAttribute("staffs", staffs);
        request.setAttribute("orders", orders);
        request.setAttribute("orderItems", orderItems);
        request.getRequestDispatcher("/Manager_JSP/manager-reservations-list.jsp").forward(request, response);
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
