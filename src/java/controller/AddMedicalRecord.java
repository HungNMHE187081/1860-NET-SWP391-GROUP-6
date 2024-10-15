/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ChildrenDAO;
import java.sql.*;
import dal.MedicalRecordDAO;
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

        String childID_raw = request.getParameter("childID");
        ChildrenDAO childrenDAO = new ChildrenDAO();
        Children children = new Children();

        try {
            // Parse the staffID as an integer
            int staffID = Integer.parseInt(staffID_raw);
            int childID = Integer.parseInt(childID_raw);
            children = childrenDAO.getChildrenByID(childID);
            // Set attributes to be accessed in the JSP
            request.setAttribute("reservationID", reservationID);
            request.setAttribute("children", children);

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
            int childID = Integer.parseInt(request.getParameter("childID"));
            int staffID = Integer.parseInt(request.getParameter("staffID"));
            int reservationID = Integer.parseInt(request.getParameter("reservationID")); // Get reservationID
            String diagnosis = request.getParameter("diagnosis");
            String treatment = request.getParameter("treatment");
            String notes = request.getParameter("notes");
            Date recordDate = Date.valueOf(request.getParameter("recordDate"));

            MedicalRecord medicalRecord = new MedicalRecord(childID, staffID, reservationID, diagnosis, treatment, notes, recordDate); // Pass reservationID
            medicalRecordDAO.addMedicalRecordAndUpdateReservation(medicalRecord);

            response.sendRedirect("medicalRecords.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addMedicalRecord.jsp?error=true");
        }
    }

}

/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
