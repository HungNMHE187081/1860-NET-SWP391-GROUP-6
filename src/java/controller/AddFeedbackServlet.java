package controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.List;

import dal.FeedbackDAO;
import dal.ServiceDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Feedback;
import model.Service;
import model.Users;

@MultipartConfig
public class AddFeedbackServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        Users user = userDAO.getUserById(1);
        ServiceDAO serviceDAO = new ServiceDAO();
        List<Service> serviceList = serviceDAO.getAllServices();
        request.setAttribute("user", user);
        request.setAttribute("service", serviceList);
        request.getRequestDispatcher("/Common_JSP/feedback-new.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        String userName = request.getParameter("userName");
        String emailAddress = request.getParameter("emailAddress");
        String phoneNumber = request.getParameter("phoneNumber");
        int serviceID = Integer.parseInt(request.getParameter("serviceID"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");
        String suggestion = request.getParameter("suggestion");
        String experienceRating = request.getParameter("experienceRating");

        Part filePart = request.getPart("attachment");
        String attachmentPath = null;
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            InputStream fileContent = filePart.getInputStream();
            // Save the file to a specific location
            // For simplicity, let's assume the file is saved to "uploads" directory
            attachmentPath = "uploads/" + fileName;
            // Save the file content to the specified path
            // (You need to implement the file saving logic)
        }

        Feedback feedback = new Feedback(0, userID, serviceID, userName, emailAddress, phoneNumber, rating, experienceRating, comment, suggestion, attachmentPath, false);
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        feedbackDAO.insertFeedback(feedback);

        response.sendRedirect("feedback");
    }
}