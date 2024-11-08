package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Children;
import dal.ChildrenDAO;
import model.Users;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 10 * 1024 * 1024,  // 10MB
    maxRequestSize = 50 * 1024 * 1024 // 50MB
)
public class EditChildren extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";
    private ChildrenDAO childrenDAO;

    @Override
    public void init() {
        childrenDAO = new ChildrenDAO(); // Initialize DAO
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int childID = Integer.parseInt(request.getParameter("childID"));
            Children child = childrenDAO.getChildrenByID(childID);
            request.setAttribute("children", child);
            request.getRequestDispatcher("/Common_JSP/edit-children-customer.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Handle errors gracefully
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            Users user = (Users) session.getAttribute("user");
            int customerID = user.getUserID();
            int childID = Integer.parseInt(request.getParameter("childID"));
            String firstName = request.getParameter("firstName");
            String middleName = request.getParameter("middleName");
            String lastName = request.getParameter("lastName");
            Date dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
            String gender = request.getParameter("gender");
              if (isEmptyOrSpaces(firstName) || isEmptyOrSpaces(middleName) || isEmptyOrSpaces(lastName)) {
                // Chuyển hướng đến trang lỗi nếu phát hiện trường chỉ chứa dấu cách
                request.setAttribute("errorMessage", "Tên không được để trống hoặc chỉ chứa khoảng trắng.");
                request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
                return;
            }
            // Handle file upload
            Part filePart = request.getPart("profileImage");
            String fileName = getFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + UPLOAD_DIR + File.separator;

            // Ensure upload directory exists
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String childImage = null;
            if (fileName != null && !fileName.isEmpty()) {
                filePart.write(uploadPath + fileName);
                childImage = UPLOAD_DIR + "/" + fileName;
            } else {
                childImage = request.getParameter("existingImage"); // Keep old image if no new one uploaded
            }

            // Create Children object
            Children child = new Children(childID, customerID ,firstName, middleName, lastName, dateOfBirth, gender, childImage);

            // Update child in database
            boolean isUpdated = childrenDAO.updateChild(child);
          
            if (isUpdated) {
                response.sendRedirect("listchildren?success=true");
            } else {
                response.sendRedirect("editchild.jsp?childID=" + childID + "&error=true");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page on failure
        }
    }
private boolean isEmptyOrSpaces(String input) {
    return input == null || input.trim().isEmpty();
}
    private String getFileName(Part part) {
        String header = part.getHeader("content-disposition");
        for (String content : header.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
