/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.MedicineDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Medicine;
import model.MedicineCategory;

/**
 *
 * @author User
 */
public class MedicineListServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MedicineListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MedicineListServlet at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pageIndex = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        String categoryID = request.getParameter("category");  // Use categoryID for filtering
        String manufactureName = request.getParameter("manufacturer");
        String searchQuery = request.getParameter("search");
        String sort = request.getParameter("sort");

        MedicineDAO medicineDAO = new MedicineDAO();

        List<Medicine> medicineList = medicineDAO.getMedicines(pageIndex, 5, categoryID, manufactureName, searchQuery, sort);

        int totalMedicines = medicineDAO.getTotalMedicines(categoryID, manufactureName, searchQuery);

        int totalPages = (int) Math.ceil((double) totalMedicines / 5);

        HttpSession session = request.getSession();
        List<MedicineCategory> categories = medicineDAO.getAllCategories();
        session.setAttribute("categories", categories);

        request.setAttribute("medicineList", medicineList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("search", searchQuery); // Preserve search query
        request.setAttribute("category", categoryID); // Preserve selected category
        request.setAttribute("manufacturer", manufactureName); // Preserve manufacturer
        request.setAttribute("sort", sort); // Preserve sort option

        // Forward the request to the JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("medicine-list.jsp");
        dispatcher.forward(request, response);
    }

}

/**
 * Handles the HTTP <code>POST</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
