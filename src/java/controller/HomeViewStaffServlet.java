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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Degree;
import model.Specialization;
import model.Staff;

/**
 *
 * @author LENOVO
 */
public class HomeViewStaffServlet extends HttpServlet {
   
  @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    StaffDAO staffDAO = new StaffDAO();
    DegreeDAO degreeDAO = new DegreeDAO();
    SpecializationDAO specializationDAO = new SpecializationDAO();

    String keyword = request.getParameter("keyword");
    String specializationIDStr = request.getParameter("specializationID");
    int specializationID = specializationIDStr != null && !specializationIDStr.isEmpty() ? Integer.parseInt(specializationIDStr) : -1;

    List<Staff> staffs;
    if (keyword != null && !keyword.isEmpty() && specializationID != -1) {
        staffs = staffDAO.searchStaffByKeywordAndSpecialization(keyword, specializationID);
    } else if (keyword != null && !keyword.isEmpty()) {
        staffs = staffDAO.searchStaffByKeyword(keyword);
    } else if (specializationID != -1) {
        staffs = staffDAO.searchStaffBySpecializationID(specializationID);
    } else {
        staffs = staffDAO.getAllStaffs();
    }

    List<Degree> degrees = degreeDAO.getAllDegrees();
    List<Specialization> specializations = specializationDAO.getAllSpecializations();

Collections.sort(staffs, Comparator.comparing(Staff::getStaffName, Comparator.nullsFirst(String::compareTo)));

    request.setAttribute("staffs", staffs);
    request.setAttribute("degrees", degrees);
    request.setAttribute("specializations", specializations);
    request.getRequestDispatcher("/Common_JSP/home-view-staff.jsp").forward(request, response);
}
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
