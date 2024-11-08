package controller;

import java.io.IOException;
import java.util.List;

import dal.FeedbackDAO;
import dal.ServiceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Feedback;
import model.Service;

public class GuestFeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchName = request.getParameter("searchName");
        String searchRatingParam = request.getParameter("searchRating");
        Integer searchRating = null;
        if (searchRatingParam != null && !searchRatingParam.trim().isEmpty()) {
            try {
                searchRating = Integer.parseInt(searchRatingParam);
            } catch (NumberFormatException e) {
                // Handle invalid rating input
            }
        }

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        ServiceDAO serviceDAO = new ServiceDAO();
        List<Feedback> feedbackList = feedbackDAO.searchFeedbacks(searchName, searchRating);
        List<Service> serviceList = serviceDAO.getAllServices();

        request.setAttribute("service", serviceList);
        request.setAttribute("feedback", feedbackList);
        request.getRequestDispatcher("/Guest_JSP/guest-feedback.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}