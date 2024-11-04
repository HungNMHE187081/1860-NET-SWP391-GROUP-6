/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DegreeDAO;
import dal.ManagerUserDAO;
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
import model.Users;

/**
 *
 * @author LENOVO
 */
public class ManagerEditStaffServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int StaffID = Integer.parseInt(request.getParameter("staffID"));
        StaffDAO staffDAO = new StaffDAO();
        Staff staff = staffDAO.getStaffByID(StaffID);
        ManagerUserDAO userDAO = new ManagerUserDAO();
        Users user = userDAO.getDetailUserByUserID(StaffID);
        DegreeDAO degreeDAO = new DegreeDAO();
        List<Degree> degrees = degreeDAO.getAllDegrees();
        SpecializationDAO specializationDAO = new SpecializationDAO();
        List<Specialization> specializations = specializationDAO.getAllSpecializations();

        request.setAttribute("staff", staff);
        request.setAttribute("user", user);
        request.setAttribute("degrees", degrees);
        request.setAttribute("specializations", specializations);
        request.getRequestDispatcher("/Manager_JSP/manager-edit-staff.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int degree = Integer.parseInt(request.getParameter("degree"));
        int specialization = Integer.parseInt(request.getParameter("specialization"));
        int yearsOfExperience = Integer.parseInt(request.getParameter("yearsOfExperience"));
        String hireDate = request.getParameter("hireDate");
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
