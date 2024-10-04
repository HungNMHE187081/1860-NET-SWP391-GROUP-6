/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import dal.AgeLimitDAO;
import dal.CategoryDAO;
import dal.ServiceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.AgeLimits;
import model.Category;
import model.Service;

/**
 *
 * @author LENOVO
 */
public class StaffServicesListServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ServiceDAO serviceDAO = new ServiceDAO();
        AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Service> services = serviceDAO.getAllServices();
        List<AgeLimits> ageLimits = ageLimitDAO.getAllAgeLimits();
        List<Category> categories = categoryDAO.getAllCategories();
        Collections.sort(services, new Comparator<Service>() {
            @Override
            public int compare(Service s1, Service s2) {
                return Integer.compare(s1.getAgeLimitID(), s2.getAgeLimitID());
            }
        });
        request.setAttribute("services", services);
        request.setAttribute("ageLimits", ageLimits);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/Staff_JSP/staff-services-list.jsp").forward(request, response);
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
