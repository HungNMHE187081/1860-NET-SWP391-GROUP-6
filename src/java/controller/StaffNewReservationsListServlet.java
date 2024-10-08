/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ChildrenDAO;
import dal.ManagerUserDAO;
import dal.ReservationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Children;
import model.Reservation;
import model.Users;

/**
 *
 * @author LENOVO
 */
public class StaffNewReservationsListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ReservationDAO reservationDAO = new ReservationDAO();
        List<Reservation> reservations = reservationDAO.getReservationByIsExam(true);
        ChildrenDAO childrenDAO = new ChildrenDAO();
        List<Children> children = childrenDAO.getAllChildren();
        ManagerUserDAO managerUserDAO = new ManagerUserDAO();
        List<Users> users = managerUserDAO.getAllUsers();
        
        Collections.sort(reservations, new Comparator<Reservation>() {
            @Override
            public int compare(Reservation s1, Reservation s2) {
                return s1.getReservationDate().compareTo(s2.getReservationDate());
            }
        });
        
        request.setAttribute("reservations", reservations);
        request.setAttribute("children", children);
        request.setAttribute("users", users);
        request.getRequestDispatcher("/Staff_JSP/staff-new-reservations-list.jsp").forward(request, response);
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
