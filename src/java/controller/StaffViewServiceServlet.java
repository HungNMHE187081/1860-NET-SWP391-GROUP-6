/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.util.List;

import dal.AgeLimitDAO;
import dal.ServiceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.AgeLimits;
import model.Service;

/**
 *
 * @author LENOVO
 */
public class StaffViewServiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String serviceIdStr = request.getParameter("serviceID");
        if (serviceIdStr != null && !serviceIdStr.isEmpty()) {
            int serviceId = Integer.parseInt(serviceIdStr);
            ServiceDAO serviceDAO = new ServiceDAO();
            AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
            Service service = serviceDAO.getServiceByID(serviceId);
            List<AgeLimits> ageLimitList = ageLimitDAO.getAllAgeLimits();
            request.setAttribute("service", service);
            request.setAttribute("ageLimit", ageLimitList);
            request.getRequestDispatcher("/Staff_JSP/staff-view-service.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/Staff_JSP/staff-services-list.jsp");
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
