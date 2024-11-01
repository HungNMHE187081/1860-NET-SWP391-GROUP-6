package controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import dal.AgeLimitDAO;
import dal.ServiceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.AgeLimits;
import model.Service;

public class CustomerListServicesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        String ageLimitIDStr = request.getParameter("ageLimit");
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");
        String priceFilter = request.getParameter("priceFilter");

        int ageLimitID = ageLimitIDStr != null && !ageLimitIDStr.isEmpty() ? Integer.parseInt(ageLimitIDStr) : 0;
        double minPrice = minPriceStr != null && !minPriceStr.isEmpty() ? Double.parseDouble(minPriceStr) : 0;
        double maxPrice = maxPriceStr != null && !maxPriceStr.isEmpty() ? Double.parseDouble(maxPriceStr) : Double.MAX_VALUE;

        ServiceDAO serviceDAO = new ServiceDAO();
        AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
        List<Service> services;

        if (keyword != null && !keyword.isEmpty() && ageLimitID > 0) {
            services = serviceDAO.searchServicesByKeywordAgeLimitAndPrice(keyword, ageLimitID, minPrice, maxPrice);
        } else if (keyword != null && !keyword.isEmpty()) {
            services = serviceDAO.searchServicesByKeywordAndPrice(keyword, minPrice, maxPrice);
        } else if (ageLimitID > 0) {
            services = serviceDAO.searchServicesByAgeLimitIDAndPrice(ageLimitID, minPrice, maxPrice);
        } else {
            services = serviceDAO.getAllServices();
        }

        if (priceFilter != null) {
            if (priceFilter.equals("lowToHigh")) {
                services = services.stream()
                        .sorted((s1, s2) -> Double.compare(s1.getPrice(), s2.getPrice()))
                        .collect(Collectors.toList());
            } else if (priceFilter.equals("highToLow")) {
                services = services.stream()
                        .sorted((s1, s2) -> Double.compare(s2.getPrice(), s1.getPrice()))
                        .collect(Collectors.toList());
            }
        }

        List<AgeLimits> ageLimits = ageLimitDAO.getAllAgeLimits();

        request.setAttribute("services", services);
        request.setAttribute("ageLimits", ageLimits);
        request.getRequestDispatcher("/Common_JSP/home-list-service.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "CustomerListServicesServlet handles the listing of services for customers.";
    }
}