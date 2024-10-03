/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AgeLimitDAO;
import dal.CategoryDAO;
import dal.DegreeDAO;
import dal.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.AgeLimits;
import model.Category;
import model.Degree;
import model.Service;

/**
 *
 * @author LENOVO
 */
public class ManagerViewServiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
        List<AgeLimits> ageLimits = ageLimitDAO.getAllAgeLimits();
        request.setAttribute("ageLimits", ageLimits);
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categories = categoryDAO.getAllCategories();
        request.setAttribute("categories", categories);
        DegreeDAO degreeDAO = new DegreeDAO();
        List<Degree> degrees = degreeDAO.getAllDegrees();
        request.setAttribute("degrees", degrees);
        
        int serviceID = Integer.parseInt(request.getParameter("serviceID"));
        ServiceDAO serviceDAO = new ServiceDAO();
        Service service = serviceDAO.getServiceByID(serviceID);
        request.setAttribute("service", service);


        request.getRequestDispatcher("/Manager_JSP/manager-view-service.jsp").forward(request, response);
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
