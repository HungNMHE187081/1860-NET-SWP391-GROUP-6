/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ChildrenDAO;
import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import model.Children;
import model.MedicalRecord;
import model.MedicalRecordDAO;
import model.Users;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class HomePageMedicalRecordList extends HttpServlet {

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
            out.println("<title>Servlet HomePageMedicalRecordList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomePageMedicalRecordList at " + request.getContextPath() + "</h1>");
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
    MedicalRecordDAO dao = new MedicalRecordDAO();
    UserDAO uDAO = new UserDAO();
    HttpSession session = request.getSession();
    Users user = (session != null) ? (Users) session.getAttribute("user") : null;

    // Get the child's name from the request parameter
    String childName = request.getParameter("search");
    String month = request.getParameter("month");
    String sortBy = request.getParameter("sortBy"); // sortBy can be "dateAdded" or null

    if (user != null) {
        List<Integer> childrens = new ArrayList<>();

        // Khối try-catch để xử lý SQLException
        try {
            childrens = uDAO.getChildrenByUserId(user.getUserID());
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi vào console
            request.setAttribute("errorMessage", "Unable to retrieve children. Please try again later.");
        }

        List<MedicalRecord> records = new ArrayList<>(); // Khởi tạo danh sách records
        try {
            records = dao.getMedicalRecordsByMonthAndChildName(childName, month);
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi vào console
            request.setAttribute("errorMessage", "Unable to retrieve medical records. Please try again later.");
        }

        request.setAttribute("user", user);
        request.setAttribute("records", records);
        request.setAttribute("childrens", childrens); // Thêm childrens vào request

        // Forward to the JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Common_JSP/home-list-medicalrecord.jsp");
        dispatcher.forward(request, response);
        
    } else {
        // Nếu người dùng không được xác thực, chuyển hướng đến trang đăng nhập
        response.sendRedirect(request.getContextPath() + "/login.jsp");
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
public static void main(String[] args) {
        List<Integer> childrens = new ArrayList<>();
         UserDAO uDAO = new UserDAO();
          childrens = uDAO.getChildrenByUserId(4);
          System.out.println(childrens);
    }
}
