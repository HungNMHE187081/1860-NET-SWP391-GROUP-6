/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ChildrenDAO;
import dal.ManagerUserDAO;
import dal.OrderDAO;
import dal.ReservationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Children;
import model.Order;
import model.OrderItem;
import model.Reservation;
import model.Users;

/**
 *
 * @author LENOVO
 */
public class StaffSearchOldReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        String timeOfDay = request.getParameter("timeOfDay");

        ReservationDAO reservationDAO = new ReservationDAO();
        List<Reservation> reservations = reservationDAO.getReservationByIsExam(true);
        OrderDAO orderDAO = new OrderDAO();
        List<OrderItem> orderItems = orderDAO.getAllOrderItems();
        List<Order> orders = orderDAO.getAllCheckOutOrders();
        ChildrenDAO childrenDAO = new ChildrenDAO();
        List<Children> children = childrenDAO.getAllChildren();
        ManagerUserDAO managerUserDAO = new ManagerUserDAO();
        List<Users> users = managerUserDAO.getAllUsers();
        

        if (keyword != null && !keyword.isEmpty() && timeOfDay != null && !timeOfDay.isEmpty()) {
            reservations = reservationDAO.searchReservationsByKeywordAndTimeOfDay(keyword, timeOfDay, true);
        } else if (keyword != null && !keyword.isEmpty()) {
            reservations = reservationDAO.searchReservationByKeyword(keyword, true);
        } else if (timeOfDay != null && !timeOfDay.isEmpty()) {
            reservations = reservationDAO.searchReservationsByTimeOfDay(timeOfDay, true);
        } else {
            reservations = reservationDAO.getReservationByIsExam(true);
        }


        request.setAttribute("reservations", reservations);
        request.setAttribute("children", children);
        request.setAttribute("users", users);
        request.setAttribute("orders", orders);
        request.setAttribute("orderItems", orderItems);
        request.getRequestDispatcher("/Staff_JSP/staff-old-reservations-list.jsp").forward(request, response);
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
