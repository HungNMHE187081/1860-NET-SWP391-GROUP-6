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
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import model.BlogCategory;
import model.BlogCategoryMapping;

/**
 *
 * @author LENOVO
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddBlogServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "img"; // Define upload directory

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
            out.println("<title>Servlet AddBlogServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBlogServlet at " + request.getContextPath() + "</h1>");
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
        BlogDAO blogDAO = new BlogDAO();
        List<BlogCategory> cate = blogDAO.getAllBlogCategory();
        request.setAttribute("cate", cate);
        request.getRequestDispatcher("/Manager_JSP/manager-add-blog.jsp").forward(request, response);
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
        
        List<String> errors = new ArrayList<>();
        
        // Retrieve and validate form fields
        String title = request.getParameter("title");
        if (title == null || title.trim().isEmpty()) {
            errors.add("Tiêu đề không được để trống");
        }

        String content = request.getParameter("content");
        if (content == null || content.trim().isEmpty()) {
            errors.add("Nội dung không được để trống");
        }

        String author = request.getParameter("author");
        if (author == null || author.trim().isEmpty()) {
            errors.add("Tên tác giả không được để trống");
        }

        String isPublished = request.getParameter("isPublished");
        if (isPublished == null || isPublished.trim().isEmpty()) {
            errors.add("Trạng thái xuất bản không được để trống");
        }

        // Validate file upload
        Part filePart = request.getPart("thumbNail");
        if (filePart == null || filePart.getSize() == 0) {
            errors.add("Hình ảnh thumbnail không được để trống");
        }

        String blogCategoryStr = request.getParameter("blogCategory");
        if (blogCategoryStr == null || blogCategoryStr.trim().isEmpty()) {
            errors.add("Danh mục blog không được để trống");
        }

        // If there are validation errors, return to the form with error messages
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            // Preserve the entered values
            request.setAttribute("title", title);
            request.setAttribute("content", content);
            request.setAttribute("author", author);
            request.setAttribute("isPublished", isPublished);
            
            // Get categories again for the form
            BlogDAO blogDAO = new BlogDAO();
            List<BlogCategory> cate = blogDAO.getAllBlogCategory();
            request.setAttribute("cate", cate);
            
            // Forward back to the form
            request.getRequestDispatcher("/Manager_JSP/manager-add-blog.jsp").forward(request, response);
            return;
        }

        // If validation passes, proceed with saving the blog
        String fileName = extractFileName(filePart);
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        int blogCategoryID = Integer.parseInt(blogCategoryStr);

        // Create directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Save the uploaded file
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Save blog to the database
        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setContent(content);
        blog.setAuthorName(author);
        blog.setIsPublished("Published".equals(isPublished));
        blog.setThumbnailPath(UPLOAD_DIRECTORY + "/" + fileName);

        // Call DAO method to insert the blog
        BlogDAO blogDAO = new BlogDAO();
        blogDAO.addBlog(blog, blogCategoryID);
        
        // Redirect to success page
        response.sendRedirect(request.getContextPath() + "/manager/manageblog");
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
