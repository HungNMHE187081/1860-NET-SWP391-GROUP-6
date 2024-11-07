/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ManagerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Provinces;
import java.sql.SQLException;
import java.util.List;
/**
 *
 * @author LENOVO
 */
public class EditProvincesServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet EditProvinces</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProvinces at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
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
    // Get the parameters from the form
    int provinceID = Integer.parseInt(request.getParameter("id"));
    String provinceName = request.getParameter("name").trim();
    
    ManagerDAO dao = new ManagerDAO();

    try {
        // Check if the province name already exists (case-insensitive and without accents)
        if (dao.isProvinceNameExist(provinceName)) {
            request.setAttribute("errorMessage", "Tên tỉnh thành đã tồn tại.");
            List<Provinces> listP = dao.getAllProvinces();
        request.setAttribute("listP", listP);

        // Chuyển hướng về trang manager-address.jsp
        request.getRequestDispatcher("/Manager_JSP/Address/manager-address.jsp").forward(request, response);
            return;
        }

        // If not, create a Provinces object and update it
        Provinces province = new Provinces();
        province.setProvinceID(provinceID);
        province.setProvinceName(provinceName);
        
        // Call the DAO to update the province
        dao.updateProvinces(province);
        
        // Redirect to manageraddress after successful update
        response.sendRedirect(request.getContextPath() + "/manager/manageraddress");
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("error", "Có lỗi xảy ra khi cập nhật tỉnh thành.");
       List<Provinces> listP = dao.getAllProvinces();
        request.setAttribute("listP", listP);

        // Chuyển hướng về trang manager-address.jsp
        request.getRequestDispatcher("/Manager_JSP/Address/manager-address.jsp").forward(request, response);
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
