/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Service;

/**
 *
 * @author LENOVO
 */
public class EditServiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServiceDAO dao = new ServiceDAO();
//        int ServiceID = request.getParameter("ServiceID");
//        String ServiceName = rs.getString("ServiceName");
//        String Description = rs.getString("Description");
//        double Price = rs.getDouble("Price");
//        int Duration = rs.getInt("Duration");
//        String ServiceImage = rs.getString("ServiceImage");
//        boolean IsActive = rs.getBoolean("IsActive");
//        int AgeLimitID = rs.getInt("AgeLimitID");
//        listServices.add(new Service(ServiceID, ServiceName, Description, Price, Duration, ServiceImage, IsActive, AgeLimitID));
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
