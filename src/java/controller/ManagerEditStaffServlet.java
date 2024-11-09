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
        try {
            int staffID = Integer.parseInt(request.getParameter("staffID"));
            StaffDAO staffDAO = new StaffDAO();
            Staff staff = staffDAO.getStaffByID(staffID);

            ManagerUserDAO userDAO = new ManagerUserDAO();
            Users user = userDAO.getDetailUserByUserID(staffID);

            DegreeDAO degreeDAO = new DegreeDAO();
            List<Degree> degrees = degreeDAO.getAllDegrees();

            SpecializationDAO specializationDAO = new SpecializationDAO();
            List<Specialization> specializations = specializationDAO.getAllSpecializations();

            request.setAttribute("staff", staff);
            request.setAttribute("user", user);
            request.setAttribute("degrees", degrees);
            request.setAttribute("specializations", specializations);
            request.getRequestDispatcher("/Manager_JSP/manager-edit-staff.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Staff ID.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
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
        try {
            // Retrieve form parameters
            int staffID = Integer.parseInt(request.getParameter("staffID"));
            String staffName = request.getParameter("staffName");
            int yearsOfExperience = Integer.parseInt(request.getParameter("yearsOfExperience"));
            int specializationID = Integer.parseInt(request.getParameter("specializationID"));
            int degreeID = Integer.parseInt(request.getParameter("degreeID"));
            String hireDate = request.getParameter("hireDate");
            double salary = Double.parseDouble(request.getParameter("salary"));

            // Optionally, retrieve user-related parameters if needed
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            // Add more user fields as necessary

            // Update staff information
            StaffDAO staffDAO = new StaffDAO();
            staffDAO.updateStaff(staffID, degreeID, specializationID, yearsOfExperience, hireDate, salary);

            response.sendRedirect(request.getContextPath() + "/manager/staffslist");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input format.");
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while updating the staff.");
            doGet(request, response);
        }
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
