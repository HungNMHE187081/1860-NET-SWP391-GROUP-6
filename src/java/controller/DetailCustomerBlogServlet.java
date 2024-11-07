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
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;
import model.BlogComment;
import model.Users;

/**
 *
 * @author LENOVO
 */
public class DetailCustomerBlogServlet extends HttpServlet {

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
            out.println("<title>Servlet DetailCustomerBlogServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailCustomerBlogServlet at " + request.getContextPath() + "</h1>");
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
        int blogid = Integer.parseInt(request.getParameter("blogID"));
        BlogDAO dao = new BlogDAO();
        BlogCommentDAO cdao = new BlogCommentDAO();
        List<BlogComment> comments = null;
        List<Blog> lastestBlog = null;
        List<Blog> releatedBlog = dao.getRelatedBlogs(blogid);
        try {
            lastestBlog = dao.getLatestBlogs();
        } catch (SQLException ex) {
            Logger.getLogger(DetailCustomerBlogServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            comments = cdao.getBlogCommentsByBlogId(blogid);
        } catch (SQLException ex) {
            Logger.getLogger(DetailCustomerBlogServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        // Đặt danh sách bình luận vào request attribute
        request.setAttribute("comments", comments);
        Blog blog = dao.getBlogById(blogid);
        request.setAttribute("blog", blog);
        request.setAttribute("lastestBlog", lastestBlog);
        request.setAttribute("releatedBlog", releatedBlog);
        request.getRequestDispatcher("/Common_JSP/blog-detail.jsp").forward(request, response);
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
        int blogId = Integer.parseInt(request.getParameter("blogID"));
        String content = request.getParameter("message");
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
        // Chuyển hướng đến trang đăng nhập nếu người dùng chưa đăng nhập
        response.sendRedirect(request.getContextPath() + "/login");
        return; // Đảm bảo dừng thực thi sau khi chuyển hướng
    }
        
        if (user != null && content != null && !content.trim().isEmpty()) {
        BlogCommentDAO commentDAO = new BlogCommentDAO();
        BlogComment comment = new BlogComment();
        comment.setBlogID(blogId);
        comment.setUser(user);
        comment.setContent(content);
         // Check if this is a reply by looking for parentID
        String parentIdStr = request.getParameter("parentID");
        if (parentIdStr != null && !parentIdStr.isEmpty()) {
            int parentId = Integer.parseInt(parentIdStr);
            BlogComment parentComment = new BlogComment();
            parentComment.setCommentID(parentId);
            comment.setParent(parentComment);
        }
        commentDAO.addComment(comment);
    }
   session.setAttribute("user", user);
    response.sendRedirect(request.getContextPath() +"/customer/detailcustomerblog?blogID=" + blogId);
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
