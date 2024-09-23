/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ManagerUserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.District;
import model.Provinces;
import model.Ward;

/**
 *
 * @author LENOVO
 */
public class AddUserServlet extends HttpServlet {
   
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
            out.println("<title>Servlet AddUserServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUserServlet at " + request.getContextPath () + "</h1>");
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
   
    String provinceID = request.getParameter("provinceID");
    String districtID = request.getParameter("districtID");
    
    ManagerUserDAO dao = new ManagerUserDAO();
    
    // Fetch districts by province
    List<District> districts = null;
    if (provinceID != null) {
        districts = dao.getDistrictsByProvince(provinceID);
        request.setAttribute("districts", districts);
    }
    
    // Fetch wards by district
    List<Ward> wards = null;
    if (districtID != null) {
        wards = dao.getWardsByDistrict(districtID);
        request.setAttribute("wards", wards);
    }

    // Fetch all provinces for initial load
    List<Provinces> provinces = dao.getAllProvinces();
    request.setAttribute("provinces", provinces);

    request.getRequestDispatcher("form-add-user.jsp").forward(request, response);
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
        String firstName = request.getParameter("firstName");
    String middleName = request.getParameter("middleName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");
    String dateOfBirth = request.getParameter("dateOfBirth");
    String gender = request.getParameter("gender");
    String citizenIdentification = request.getParameter("citizenIdentification");
    String username = request.getParameter("username");
    String passwordHash = request.getParameter("passwordHash"); // Lưu ý rằng bạn cần xử lý mã hóa mật khẩu
    String salt = request.getParameter("salt"); // Lưu ý xử lý salt nếu cần
    int roleID = 2; // Đặt roleID mặc định là customer
    String streetAddress = request.getParameter("streetAddress");
    int wardID = Integer.parseInt(request.getParameter("wardID")); // Lấy wardID từ dropdown

    // Gọi phương thức addUser để thêm người dùng
    ManagerUserDAO userDAO = new ManagerUserDAO();
    userDAO.addUser(firstName, middleName, lastName, email, phoneNumber, dateOfBirth, gender, 
                     citizenIdentification, username, passwordHash, salt, roleID, streetAddress, wardID);

    // Chuyển hướng đến trang thành công hoặc thông báo
response.sendRedirect("manageuser"); // Hoặc trang bạn muốn
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
