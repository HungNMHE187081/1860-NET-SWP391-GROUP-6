/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlogCommentDAO;
import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;
import model.BlogComment;

/**
 *
 * @author LENOVO
 */
public class ViewDetailsBlogServlet extends HttpServlet {

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
            out.println("<title>Servlet ViewDetailsBlogServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewDetailsBlogServlet at " + request.getContextPath() + "</h1>");
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
        BlogDAO dao = new BlogDAO();
        int id = Integer.parseInt(request.getParameter("blogid"));
        Blog blogDetails = dao.getBlogById(id);
        BlogCommentDAO cdao = new BlogCommentDAO();
        List<BlogComment> comments = null;
        try {
            comments = cdao.getBlogCommentsByBlogIdForManager(id);
        } catch (SQLException ex) {
            Logger.getLogger(DetailCustomerBlogServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("comments", comments);
        request.setAttribute("blogDetails", blogDetails);
        request.getRequestDispatcher("/Manager_JSP/view-details-blog.jsp").forward(request, response);
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
 // Lấy thông tin từ form
    int commentId = Integer.parseInt(request.getParameter("commentId"));
    int currentStatus = Integer.parseInt(request.getParameter("currentStatus"));
    
    // Chuyển trạng thái từ 1 (Ẩn) thành 0 (Công khai) hoặc ngược lại
    boolean isApproved = currentStatus == 1 ? false : true;

    BlogCommentDAO cdao = new BlogCommentDAO();
    try {
        // Cập nhật trạng thái bình luận trong cơ sở dữ liệu
        cdao.changeCommentStatus(commentId, isApproved);

        // Sau khi cập nhật, chuyển hướng lại về trang chi tiết blog
        response.sendRedirect(request.getHeader("Referer")); // Trở về trang trước đó
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
     
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

}
