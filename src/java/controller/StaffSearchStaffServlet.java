/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DegreeDAO;
import dal.SpecializationDAO;
import dal.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Degree;
import model.Specialization;
import model.Staff;

/**
 *
 * @author LENOVO
 */
public class StaffSearchStaffServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        String specializationIDStr = request.getParameter("specializationID");
        int specializationID = specializationIDStr != null && !specializationIDStr.isEmpty() ? Integer.parseInt(specializationIDStr) : 0;

        StaffDAO staffDAO = new StaffDAO();
        DegreeDAO degreeDAO = new DegreeDAO();
        SpecializationDAO specializationDAO = new SpecializationDAO();

        List<Staff> staffs;
        List<Degree> degrees = degreeDAO.getAllDegrees();
        List<Specialization> specializations = specializationDAO.getAllSpecializations();

        if (keyword != null && !keyword.isEmpty() && specializationID > 0) {
            staffs = staffDAO.searchStaffByKeywordAndSpecialization(keyword, specializationID);
        } else if (keyword != null && !keyword.isEmpty()) {
            staffs = staffDAO.searchStaffByKeyword(keyword);
        } else if (specializationID > 0) {
            staffs = staffDAO.searchStaffBySpecializationID(specializationID);
        } else {
            staffs = staffDAO.getAllStaffs();
        }

        request.setAttribute("staffs", staffs);
        request.setAttribute("degrees", degrees);
        request.setAttribute("specializations", specializations);
        request.getRequestDispatcher("/Staff_JSP/staff-staffs-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
