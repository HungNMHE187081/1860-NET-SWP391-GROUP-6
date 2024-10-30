package controller;

import dal.DegreeDAO;
import dal.SpecializationDAO;
import dal.StaffDAO;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Degree;
import model.Specialization;
import model.Staff;

public class ManagerStaffsListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        StaffDAO staffDAO = new StaffDAO();
        List<Staff> staffs = staffDAO.getAllStaffs();
        DegreeDAO degreeDAO = new DegreeDAO();
        List<Degree> degrees = degreeDAO.getAllDegrees();
        SpecializationDAO specializationDAO = new SpecializationDAO();
        List<Specialization> specializations = specializationDAO.getAllSpecializations();

        request.setAttribute("staffs", staffs);
        request.setAttribute("degrees", degrees);
        request.setAttribute("specializations", specializations);
        request.getRequestDispatcher("/Manager_JSP/manager-staffs-list.jsp").forward(request, response);
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