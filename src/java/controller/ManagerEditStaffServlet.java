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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Staff ID format.");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server Error: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<String> errors = new ArrayList<>();
        
        try {
            // Parse input parameters
            int staffID = Integer.parseInt(request.getParameter("staffID"));
            int degreeID = Integer.parseInt(request.getParameter("degree"));
            int specializationID = Integer.parseInt(request.getParameter("specialization"));
            int yearsOfExperience = Integer.parseInt(request.getParameter("yearsOfExperience"));
            String hireDate = request.getParameter("hireDate");
            double salary = Double.parseDouble(request.getParameter("salary"));

            // Validate basic requirements
            if (degreeID <= 0) {
                errors.add("Vui lòng chọn bằng cấp hợp lệ");
            }
            
            if (specializationID <= 0) {
                errors.add("Vui lòng chọn chuyên môn hợp lệ");
            }
            
            if (yearsOfExperience <= 0) {
                errors.add("Số năm kinh nghiệm phải lớn hơn 0");
            }
            
            if (salary < 1000000) {
                errors.add("Lương phải lớn hơn hoặc bằng 1.000.000 VNĐ");
            }

            // Validate hire date
            if (hireDate == null || hireDate.trim().isEmpty()) {
                errors.add("Ngày thuê không được để trống");
            } else {
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    sdf.setLenient(false);
                    Date hireDateParsed = sdf.parse(hireDate);
                    Date currentDate = new Date();
                    
                    if (hireDateParsed.after(currentDate)) {
                        errors.add("Ngày thuê không được lớn hơn ngày hiện tại");
                    }
                } catch (ParseException e) {
                    errors.add("Định dạng ngày không hợp lệ");
                }
            }

            // If there are errors, redisplay the form
            if (!errors.isEmpty()) {
                request.setAttribute("errorMessages", errors);
                
                doGet(request, response);
                return;
            }

            // Update staff if validation passes
            StaffDAO staffDAO = new StaffDAO();
            staffDAO.updateStaff(staffID, degreeID, specializationID, yearsOfExperience, hireDate, salary);
            
            // Redirect to staff list on success
            response.sendRedirect(request.getContextPath() + "/manager/staffslist");
            
        } catch (NumberFormatException e) {
            errors.add("Dữ liệu nhập vào không hợp lệ");
            request.setAttribute("errorMessages", errors);
            doGet(request, response);
        } catch (Exception e) {
            errors.add("Có lỗi xảy ra: " + e.getMessage());
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