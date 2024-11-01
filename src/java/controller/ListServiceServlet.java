package controller;

import java.io.IOException;
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

public class ListServiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServiceDAO serviceDAO = new ServiceDAO();
        AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        List<Service> services = serviceDAO.getAllServices();
        List<AgeLimits> ageLimits = ageLimitDAO.getAllAgeLimits();
        List<Category> categories = categoryDAO.getAllCategories();

        request.setAttribute("services", services);
        request.setAttribute("ageLimits", ageLimits);
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("/Common_JSP/list-service.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST requests if needed
    }

    @Override
    public String getServletInfo() {
        return "ListServiceServlet handles the listing of services.";
    }
}