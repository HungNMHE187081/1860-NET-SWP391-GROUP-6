package controller;

import java.io.IOException;
import dal.FeedbackDAO;
import dal.ServiceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Feedback;
import model.Service;

public class StaffViewFeedbackServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int feedbackID = Integer.parseInt(request.getParameter("feedbackID"));
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        Feedback feedback = feedbackDAO.getFeedbackByID(feedbackID);
        
        ServiceDAO serviceDAO = new ServiceDAO();
        Service service = serviceDAO.getServiceByID(feedback.getServiceID());
        
        request.setAttribute("feedback", feedback);
        request.setAttribute("serviceName", service.getServiceName());
        
        request.getRequestDispatcher("/Staff_JSP/staff-view-feedback.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Handle POST requests if needed
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}