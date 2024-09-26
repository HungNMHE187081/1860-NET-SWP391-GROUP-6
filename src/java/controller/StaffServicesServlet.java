/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AgeLimitDAO;
import dal.ServiceDAO;
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
import model.Service;

/**
 *
 * @author LENOVO
 */
public class StaffServicesServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ServiceDAO serviceDAO = new ServiceDAO();
        AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
        List<Service> services = serviceDAO.getAllServices();
        List<AgeLimits> ageLimits = ageLimitDAO.getAllAgeLimits();
        Collections.sort(services, new Comparator<Service>() {
            @Override
            public int compare(Service s1, Service s2) {
                return Integer.compare(s1.getAgeLimitID(), s2.getAgeLimitID());
            }
        });
        request.setAttribute("services", services);
        request.setAttribute("ageLimits", ageLimits);
        request.getRequestDispatcher("staff-services-list.jsp").forward(request, response);
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
