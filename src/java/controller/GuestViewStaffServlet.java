/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DegreeDAO;
import dal.ManagerDAO;
import dal.ManagerUserDAO;
import dal.SpecializationDAO;
import dal.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Degree;
import model.Specialization;
import model.Staff;
import model.Users;

/**
 *
 * @author LENOVO
 */
public class GuestViewStaffServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        StaffDAO staffDAO = new StaffDAO();
        List<Staff> stafflist = staffDAO.getAllStaffs();
        DegreeDAO degreeDAO = new DegreeDAO();
        List<Degree> degrees = degreeDAO.getAllDegrees();
        SpecializationDAO specializationDAO = new SpecializationDAO();
        List<Specialization> specializations = specializationDAO.getAllSpecializations();
        ManagerUserDAO managerUserDAO = new ManagerUserDAO();
        List<Users> users = new ArrayList<>();
        List<Staff> staffs = new ArrayList<>();
        for (Staff staff : stafflist){
            if (staff.getStaffName() != null)
                staffs.add(staff);
            users.add(managerUserDAO.getDetailUserByUserID(staff.getStaffID()));
        }
        
        Collections.sort(staffs, new Comparator<Staff>() {
            @Override
            public int compare(Staff s1, Staff s2) {
                return s1.getStaffName().compareTo(s2.getStaffName());
            }
        });

        request.setAttribute("staffs", staffs);
        request.setAttribute("users", users);
        request.setAttribute("degrees", degrees);
        request.setAttribute("specializations", specializations);
        request.getRequestDispatcher("/Guest_JSP/guest-view-staff.jsp").forward(request, response);
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
