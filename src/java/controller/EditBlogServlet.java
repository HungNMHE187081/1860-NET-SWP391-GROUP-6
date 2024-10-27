/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.List;
import model.Blog;
import model.BlogCategory;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class EditBlogServlet extends HttpServlet {
   
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
            out.println("<title>Servlet EditBlogServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditBlogServlet at " + request.getContextPath () + "</h1>");
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
        BlogDAO dao = new BlogDAO();
        int id = Integer.parseInt(request.getParameter("blogid"));
        Blog blogDetails = dao.getBlogById(id);
        List<BlogCategory> cate = dao.getAllBlogCategory();
        request.setAttribute("cate", cate);
        request.setAttribute("blogDetails", blogDetails);
        request.getRequestDispatcher("Manager_JSP/manager-edit-blog.jsp").forward(request, response);
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
    request.setCharacterEncoding("UTF-8"); // Đảm bảo mã hóa UTF-8
    BlogDAO dao = new BlogDAO(); // Khởi tạo BlogDAO

    // Lấy thông tin từ biểu mẫu
    int blogID = Integer.parseInt(request.getParameter("blogid"));
    String title = request.getParameter("titleEdit");
    String author = request.getParameter("author");
    String content = request.getParameter("contentedit");
    boolean isPublished = "Công Khai".equals(request.getParameter("isPublished")); // Kiểm tra trạng thái
    String thumbnailPath = null;

    // Xử lý thumbnail
    Part filePart = request.getPart("thumbNail");
    if (filePart != null && filePart.getSize() > 0) {
        // Lưu file thumbnail vào thư mục mong muốn
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads"; // Đường dẫn lưu ảnh
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir(); // Tạo thư mục nếu không tồn tại

        thumbnailPath = uploadDir + File.separator + Paths.get(filePart.getSubmittedFileName()).getFileName(); // Lấy tên file
        filePart.write(thumbnailPath); // Lưu file
    }

    // Tạo đối tượng Blog và cập nhật
    Blog blog = new Blog();
    blog.setBlogID(blogID);
    blog.setTitle(title);
    blog.setAuthorName(author);
    blog.setContent(content);
    blog.setIsPublished(isPublished);
    blog.setThumbnailPath(thumbnailPath);
    dao.updateBlog(blog); // Gọi phương thức updateBlog

    // Chuyển hướng về trang danh sách blog hoặc thông báo thành công
    response.sendRedirect("manageblog"); // Chỉnh sửa theo đường dẫn thực tế của bạn
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
