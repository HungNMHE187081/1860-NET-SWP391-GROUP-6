package controller;

import dal.DegreeDAO;
import dal.SpecializationDAO;
import dal.StaffDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Degree;
import model.Specialization;
import model.Staff;

public class CustomerSearchStaffServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        String specializationIDStr = request.getParameter("specializationID");
        int specializationID = specializationIDStr != null && !specializationIDStr.isEmpty() ? Integer.parseInt(specializationIDStr) : -1;

        StaffDAO staffDAO = new StaffDAO();
        DegreeDAO degreeDAO = new DegreeDAO();
        SpecializationDAO specializationDAO = new SpecializationDAO();

        List<Staff> staffs;
        List<Degree> degrees = degreeDAO.getAllDegrees();
        List<Specialization> specializations = specializationDAO.getAllSpecializations();

        if (keyword != null && !keyword.isEmpty() && specializationID != -1) {
            staffs = staffDAO.searchStaffByKeywordAndSpecialization(keyword, specializationID);
        } else if (keyword != null && !keyword.isEmpty()) {
            staffs = staffDAO.searchStaffByKeyword(keyword);
        } else if (specializationID != -1) {
            staffs = staffDAO.searchStaffBySpecializationID(specializationID);
        } else {
            staffs = staffDAO.getAllStaffs();
        }

        request.setAttribute("staffs", staffs);
        request.setAttribute("degrees", degrees);
        request.setAttribute("specializations", specializations);
        request.getRequestDispatcher("/Common_JSP/home-view-staff.jsp").forward(request, response);
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