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
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class EditBlogServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "img";

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
            out.println("<title>Servlet EditBlogServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditBlogServlet at " + request.getContextPath() + "</h1>");
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
        boolean isPublished = "true".equals(request.getParameter("isPublished")); // Kiểm tra trạng thái
        // Lấy đường dẫn ảnh hiện tại từ form (ảnh cũ)
        // Kiểm tra xem có ảnh mới được tải lên không
        Part filePart = request.getPart("thumbNail");
        String finalThumbnailPath;

        if (filePart != null && filePart.getSize() > 0) {
            // Nếu có ảnh mới, xử lý ảnh mới
            String fileName = extractFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            // Sử dụng đường dẫn ảnh mới
            finalThumbnailPath = UPLOAD_DIRECTORY + "/" + fileName;
        } else {
            Blog b = dao.getBlogById(blogID);
            finalThumbnailPath = b.getThumbnailPath();
        }

        // Tạo đối tượng Blog và cập nhật
        Blog blog = new Blog();
        blog.setBlogID(blogID);
        blog.setTitle(title);
        blog.setAuthorName(author);
        blog.setContent(content);
        blog.setIsPublished(isPublished);
        blog.setThumbnailPath(finalThumbnailPath);
        dao.updateBlog(blog); // Gọi phương thức updateBlog
        int categoryID = Integer.parseInt(request.getParameter("blogCategoryEdit"));
        dao.updateBlogCategoryMapping(blogID, categoryID);
        // Chuyển hướng về trang danh sách blog hoặc thông báo thành công
        response.sendRedirect(request.getContextPath() + "/manager/manageblog"); // Chỉnh sửa theo đường dẫn thực tế của bạn
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String token : contentDisposition.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
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
