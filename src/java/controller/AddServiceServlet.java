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
import java.util.List;
import model.AgeLimits;
import model.Service;

/**
 *
 * @author LENOVO
 */
public class AddServiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String serviceName = request.getParameter("serviceName");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        String serviceImage = request.getParameter("serviceImage");
        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
        String ageLimit = request.getParameter("ageLimit");
        int age = 0;
        
        ServiceDAO serviceDAO = new ServiceDAO();
        AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
        List<Service> services = serviceDAO.getAllServices();
        List<AgeLimits> ageLimits = ageLimitDAO.getAllAgeLimits();
        
        for (AgeLimits al : ageLimits){
            if (ageLimit.equalsIgnoreCase(al.getAgeLimit())){
                age = al.getAgeLimitID();
                break;
            }
        }
        
        serviceDAO.insertService(new Service(0, serviceName, description, price, duration, serviceImage, isActive, age));
        
        request.setAttribute("services", services);
        request.setAttribute("ageLimits", ageLimits);
        request.getRequestDispatcher("manager-add-service.jsp").forward(request, response);
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
