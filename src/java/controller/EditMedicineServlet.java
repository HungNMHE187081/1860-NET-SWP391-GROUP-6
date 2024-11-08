/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.MedicineDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Medicine;
import model.MedicineCategory;

/**
 *
 * @author User
 */
public class EditMedicineServlet extends HttpServlet {
   
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
            out.println("<title>Servlet EditMedicineServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditMedicineServlet at " + request.getContextPath () + "</h1>");
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
    int medicineID = Integer.parseInt(request.getParameter("id"));
    MedicineDAO medicineDAO = new MedicineDAO();
    Medicine medicine = medicineDAO.getMedicineById(medicineID);
    
    // Assuming this method is correctly implemented
    List<MedicineCategory> categories = medicineDAO.getAllCategories();
    
    request.setAttribute("medicine", medicine);
    request.setAttribute("categories", categories);
    request.getRequestDispatcher("/Staff_JSP/edit-medicine.jsp").forward(request, response);
}


    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
private boolean isEmptyOrSpaces(String input) {
    return input == null || input.trim().isEmpty();
}
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String action = request.getParameter("action");
    
    if ("update".equals(action)) {
        int medicineID = Integer.parseInt(request.getParameter("medicineID"));
        String name = request.getParameter("name");
        String uses = request.getParameter("uses");
        String dosage = request.getParameter("dosage");
        String manufactureName = request.getParameter("manufactureName");
        String userManual = request.getParameter("userManual");
        String contraindications = request.getParameter("contraindications");
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        
        // Kiểm tra các trường nhập liệu có trống hoặc chứa khoảng trắng
        if (isEmptyOrSpaces(name) || isEmptyOrSpaces(manufactureName) || isEmptyOrSpaces(uses) || isEmptyOrSpaces(dosage) || isEmptyOrSpaces(userManual) || isEmptyOrSpaces(contraindications)) {
            // Chuyển hướng đến trang lỗi nếu phát hiện trường chỉ chứa dấu cách
            request.setAttribute("errorMessage", "Các trường nhập liệu không được để trống hoặc chỉ chứa khoảng trắng.");
            request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
            return;
        }

        // Tạo đối tượng Medicine từ thông tin nhập vào
        Medicine medicine = new Medicine(medicineID, name, manufactureName, uses, dosage, userManual, contraindications, "", categoryID);

        // Kiểm tra nếu thuốc đã tồn tại trong cơ sở dữ liệu
        MedicineDAO medicineDAO = new MedicineDAO();
        if (medicineDAO.isMedicineExist(medicine)) {
            // Nếu thông tin thuốc đã tồn tại, chuyển hướng đến trang lỗi
            request.setAttribute("errorMessage", "Thông tin thuốc đã tồn tại trong cơ sở dữ liệu.");
            request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
            return;
        }

        // Lấy tên danh mục từ categoryID
        String categoryName = medicineDAO.getCategoryById(categoryID);

        // Cập nhật thuốc vào cơ sở dữ liệu
        medicine.setCategoryName(categoryName);
        medicineDAO.updateMedicine(medicine);
        
        // Redirect đến trang chi tiết thuốc sau khi cập nhật thành công
        response.sendRedirect("medicinedetail?id=" + medicineID);
    }
}


    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
 
}
