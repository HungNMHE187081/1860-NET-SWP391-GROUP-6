/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.PaymentDAO;
import dal.ReservationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Reservation;

/**
 *
 * @author LENOVO
 */
public class StaffIsExamReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            int reservationID = Integer.parseInt(request.getParameter("reservationID"));
            
            // Update the reservation status to indicate exam completion
            ReservationDAO reservationDAO = new ReservationDAO();
            reservationDAO.updateIsExamReservation(reservationID);
            
            // Update the payment status from 'PENDING' to 'SUCCESS'
            PaymentDAO paymentDAO = new PaymentDAO();
            paymentDAO.updatePaymentStatusByReservationId(reservationID);
            
            // Redirect back to the new reservations list
            response.sendRedirect(request.getContextPath() + "/staff/newreservationslist");
        } catch (NumberFormatException e) {
            System.out.println("Invalid ReservationID format.");
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ReservationID.");
        } catch (Exception e) {
            System.out.println("Error processing reservation confirmation: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
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
