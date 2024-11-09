package controller;

import dal.DegreeDAO;
import dal.ManagerUserDAO;
import dal.SpecializationDAO;
import dal.StaffDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Degree;
import model.Specialization;
import model.Staff;
import model.Users;

public class ManagerEditStaffServlet extends HttpServlet {
    
    private static final Logger logger = Logger.getLogger(ManagerEditStaffServlet.class.getName());

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
            logger.log(Level.WARNING, "Invalid Staff ID format: {0}", request.getParameter("staffID"));
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Staff ID.");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error processing doGet request.", e);
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
        List<String> errors = new ArrayList<>();
        
        try {
            // Retrieve form parameters
            String staffIDStr = request.getParameter("staffID");
            String staffName = request.getParameter("staffName");
            String yearsOfExperienceStr = request.getParameter("yearsOfExperience");
            String specializationIDStr = request.getParameter("specializationID");
            String degreeIDStr = request.getParameter("degreeID");
            String hireDate = request.getParameter("hireDate");
            String salaryStr = request.getParameter("salary");

            // User-related parameters
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            // Add more user fields as necessary

            // Validate Staff ID
            int staffID = 0;
            try {
                staffID = Integer.parseInt(staffIDStr);
                if (staffID <= 0) {
                    errors.add("Staff ID must be a positive integer.");
                }
            } catch (NumberFormatException e) {
                errors.add("Invalid Staff ID format.");
            }

            // Validate Staff Name
            if (staffName == null || staffName.trim().isEmpty()) {
                errors.add("Tên nhân viên không được để trống.");
            }

            // Validate Years of Experience
            int yearsOfExperience = 0;
            try {
                yearsOfExperience = Integer.parseInt(yearsOfExperienceStr);
                if (yearsOfExperience < 0) {
                    errors.add("Số năm kinh nghiệm không thể âm.");
                }
            } catch (NumberFormatException e) {
                errors.add("Định dạng số năm kinh nghiệm không hợp lệ.");
            }

            // Validate Specialization ID
            int specializationID = 0;
            try {
                specializationID = Integer.parseInt(specializationIDStr);
                if (specializationID <= 0) {
                    errors.add("Chuyên môn ID phải là số nguyên dương.");
                }
            } catch (NumberFormatException e) {
                errors.add("Định dạng chuyên môn ID không hợp lệ.");
            }

            // Validate Degree ID
            int degreeID = 0;
            try {
                degreeID = Integer.parseInt(degreeIDStr);
                if (degreeID <= 0) {
                    errors.add("Học vị ID phải là số nguyên dương.");
                }
            } catch (NumberFormatException e) {
                errors.add("Định dạng học vị ID không hợp lệ.");
            }

            // Validate Hire Date
            if (hireDate == null || hireDate.trim().isEmpty()) {
                errors.add("Ngày tuyển dụng không được để trống.");
            }
            // Additional date format validation can be added here

            // Validate Salary
            double salary = 0;
            try {
                salary = Double.parseDouble(salaryStr);
                if (salary < 0) {
                    errors.add("Lương không thể âm.");
                }
            } catch (NumberFormatException e) {
                errors.add("Định dạng lương không hợp lệ.");
            }

            // Validate Username
            if (username == null || username.trim().isEmpty()) {
                errors.add("Tên đăng nhập không được để trống.");
            }

            // Validate Email
            if (email == null || email.trim().isEmpty()) {
                errors.add("Email không được để trống.");
            } else {
                // Simple email pattern check
                String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
                if (!email.matches(emailRegex)) {
                    errors.add("Định dạng email không hợp lệ.");
                }
            }

            // Add more validations as necessary

            if (!errors.isEmpty()) {
                request.setAttribute("errorMessages", errors);
                
                // Re-populate dropdowns
                DegreeDAO degreeDAO = new DegreeDAO();
                List<Degree> degrees = degreeDAO.getAllDegrees();
                request.setAttribute("degrees", degrees);

                SpecializationDAO specializationDAO = new SpecializationDAO();
                List<Specialization> specializations = specializationDAO.getAllSpecializations();
                request.setAttribute("specializations", specializations);
                
                // Re-populate staff and user details
                StaffDAO staffDAO = new StaffDAO();
                Staff staff = staffDAO.getStaffByID(staffID);
                request.setAttribute("staff", staff);

                ManagerUserDAO userDAO = new ManagerUserDAO();
                Users user = userDAO.getDetailUserByUserID(staffID);
                request.setAttribute("user", user);

                request.getRequestDispatcher("/Manager_JSP/manager-edit-staff.jsp").forward(request, response);
                return;
            }

            // Update staff information
            StaffDAO staffDAO = new StaffDAO();
            staffDAO.updateStaff(staffID, degreeID, specializationID, yearsOfExperience, hireDate, salary);
            logger.log(Level.INFO, "Staff ID {0} updated successfully.", staffID);


            response.sendRedirect(request.getContextPath() + "/manager/staffslist");
        } catch (NumberFormatException e) {
            logger.log(Level.WARNING, "Number format exception: {0}", e.getMessage());
            errors.add("Định dạng đầu vào không hợp lệ.");
            request.setAttribute("errorMessages", errors);
            doGet(request, response);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error updating staff.", e);
            errors.add("Đã xảy ra lỗi khi cập nhật nhân viên.");
            request.setAttribute("errorMessages", errors);
            doGet(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "ManagerEditStaffServlet handles editing of staff information with validation.";
    }

}