/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BlogCommentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BlogComment;
import model.Users;

/**
 *
 * @author LENOVO
 */
public class CustomerEditBlogCommentServlet extends HttpServlet {
   
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
            out.println("<title>Servlet CustomerEditBlogCommentServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerEditBlogCommentServlet at " + request.getContextPath () + "</h1>");
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
         BlogCommentDAO dao = new BlogCommentDAO();
        int commentID = Integer.parseInt(request.getParameter("commentID"));
        List<BlogComment> replies = null;
        try {
            replies = dao.getReplies(commentID);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerEditBlogCommentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (!replies.isEmpty()) {
            dao.deleteReplies(commentID);
        }
        dao.deleteComment(commentID);
        response.sendRedirect(request.getContextPath() + "/customer/detailcustomerblog?blogID=" + request.getParameter("blogID"));
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

    int commentID = Integer.parseInt(request.getParameter("commentID"));
    int blogID = Integer.parseInt(request.getParameter("blogID"));
    Users user = (Users) request.getSession().getAttribute("user");
    String content = request.getParameter("editcontent");

     if (user != null && content != null && !content.trim().isEmpty()) {
        BlogCommentDAO commentDAO = new BlogCommentDAO();
        BlogComment comment = new BlogComment();
        comment.setCommentID(commentID);
        comment.setUser(user);
        comment.setContent(content);
        commentDAO.updateComment(comment);
     }



    response.sendRedirect(request.getContextPath() + "/customer/detailcustomerblog?blogID=" + blogID);
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
