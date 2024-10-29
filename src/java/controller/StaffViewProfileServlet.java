package controller;

import dal.DegreeDAO;
import dal.SpecializationDAO;
import dal.UserDAO;
import model.Users;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Degree;
import model.Specialization;

public class StaffViewProfileServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            Users userDetails = userDAO.getUserWithAddressById(user.getUserID());

            DegreeDAO degreeDAO = new DegreeDAO();
            List<Degree> degrees = degreeDAO.getDegreesByUserId(user.getUserID());
            SpecializationDAO specializationDAO = new SpecializationDAO();
            List<Specialization> specializations = specializationDAO.getSpecializationsByUserId(user.getUserID());

            request.setAttribute("userDetails", userDetails);
            request.setAttribute("degrees", degrees);
            request.setAttribute("specializations", specializations);
            request.getRequestDispatcher("/Staff_JSP/staff-view-profile.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
