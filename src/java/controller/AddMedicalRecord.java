/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ChildrenDAO;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.sql.Date; // Import java.sql.Date instead of java.util.Date
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import model.Children;
import model.MedicalRecord;
import model.MedicalRecordDAO;
import model.Staff;
import dal.StaffDAO;

/**
 *
 * @author User
 */
public class AddMedicalRecord extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private MedicalRecordDAO medicalRecordDAO;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddMedicalRecord</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMedicalRecord at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reservationID = request.getParameter("reservationID");
        String staffID_raw = request.getParameter("staffID");
        String reservationDate = request.getParameter("reservationDate");
        String childFirstName = request.getParameter("childFirstName");
        String childMiddleName = request.getParameter("childMiddleName");
        String childLastName = request.getParameter("childLastName");
        String childID_raw = request.getParameter("childID");
       String childImage = request.getParameter("childImage");
       StaffDAO staffDAO = new StaffDAO();
       
        try {
            // Parse the staffID as an integer
            int staffID = Integer.parseInt(staffID_raw);
            int childID = Integer.parseInt(childID_raw);
            Staff staff = staffDAO.getStaffByID(staffID);
            // Set attributes to be accessed in the JSP
            request.setAttribute("staff", staff);
            request.setAttribute("reservationID", reservationID);
            request.setAttribute("childFirstName", childFirstName);
            request.setAttribute("childMiddleName", childMiddleName);
            request.setAttribute("childLastName", childLastName);
            request.setAttribute("childImage", childImage);
            request.setAttribute("staffID", staffID);
            request.setAttribute("childID", childID);
            request.setAttribute("reservationDate", reservationDate);

        } catch (NumberFormatException e) {
            // Handle the case where staffID cannot be parsed to an integer
            e.printStackTrace(); // For debugging purposes
            request.setAttribute("error", "Invalid staff ID");
        }

        // Forward to the add-medical-record.jsp page
        request.getRequestDispatcher("/Staff_JSP/add-medical-record.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
            // Lấy dữ liệu từ form
            int childID = Integer.parseInt(request.getParameter("childID"));
            int staffID = Integer.parseInt(request.getParameter("staffID"));
            int reservationID = Integer.parseInt(request.getParameter("reservationID"));
            String diagnosis = request.getParameter("diagnosis");
            String treatment = request.getParameter("treatment");
            String notes = request.getParameter("notes");
            Date recordDate = Date.valueOf(request.getParameter("recordDate")); // yyyy-MM-dd
            Date reservationDate = Date.valueOf(request.getParameter("reservationDate")); // yyyy-MM-dd
            // Tạo MedicalRecord object
            MedicalRecord medicalRecord = new MedicalRecord(
                childID, staffID, reservationID, diagnosis, treatment, notes,reservationDate ,recordDate
            );

            // Gọi DAO để thêm bản ghi mới
            MedicalRecordDAO medicalRecordDAO = new MedicalRecordDAO();
            medicalRecordDAO.addMedicalRecordAndUpdateReservation(medicalRecord);

            // Chuyển hướng về danh sách Medical Records
            response.sendRedirect("medicalrecordlist");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding medical record.");
        }
    }
   
}

/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
