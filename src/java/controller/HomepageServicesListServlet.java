package controller;

import dal.ServiceDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Service;

public class HomepageServicesListServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String query = request.getParameter("query");
        ServiceDAO serviceDAO = new ServiceDAO();
        List<Service> services;
        
        if (query != null && !query.trim().isEmpty()) {
            services = serviceDAO.searchServicesByKeyword(query);
        } else {
            services = serviceDAO.getAllServices();
        }
        
        request.setAttribute("services", services);
        request.getRequestDispatcher("homepageserviceslist.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}