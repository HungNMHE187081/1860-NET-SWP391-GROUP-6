package controller;

import java.io.IOException;
import java.util.List;

import dal.AgeLimitDAO;
import dal.CategoryDAO;
import dal.DegreeDAO;
import dal.ServiceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.AgeLimits;
import model.Category;
import model.Degree;
import model.Service;

public class GuestViewServiceServlet extends HttpServlet {

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

        request.getRequestDispatcher("/Guest_JSP/guest-view-service.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Handle POST requests if needed
    }

    @Override
    public String getServletInfo() {
        return "Guest View Service Servlet";
    }
}