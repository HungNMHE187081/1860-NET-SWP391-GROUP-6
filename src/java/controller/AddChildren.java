package controller;

import model.Children;
import dal.ChildrenDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 10 * 1024 * 1024,  // 10MB
    maxRequestSize = 50 * 1024 * 1024 // 50MB
)
@WebServlet("/AddChildren")
public class AddChildren extends HttpServlet {
    private ChildrenDAO childrenDAO = new ChildrenDAO();
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve form data
            int customerID = Integer.parseInt(request.getParameter("customerID"));
            String firstName = request.getParameter("firstName");
            String middleName = request.getParameter("middleName");
            String lastName = request.getParameter("lastName");
            java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dateOfBirth"));
            Date dateOfBirth = new Date(utilDate.getTime());
            String gender = request.getParameter("gender");

            // Handle file upload
            Part filePart = request.getPart("childImage");
            String fileName = getFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR + File.separator;

            // Ensure upload directory exists
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String childImage = null;
            if (fileName != null && !fileName.isEmpty()) {
                filePart.write(uploadPath + fileName);
                childImage = UPLOAD_DIR + "/" + fileName;
            } else {
                throw new ServletException("File is required.");
            }

            // Create Child object
            Children child = new Children(customerID, firstName, middleName, lastName, dateOfBirth, gender, childImage);

            // Add child to the database
            childrenDAO.addChild(child);

            // Redirect to success page
            response.sendRedirect("listchildren");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to add child. Please try again.");
            request.getRequestDispatcher("addChild.jsp").forward(request, response);
        }
    }

    private String getFileName(Part part) {
        String header = part.getHeader("content-disposition");
        for (String content : header.split(";")) {
            if (content.trim().startsWith("filename")) {
                return Paths.get(content.substring(content.indexOf('=') + 1).trim().replace("\"", "")).getFileName().toString();
            }
        }
        return null;
    }

    @Override
    public String getServletInfo() {
        return "Thêm thông tin trẻ em";
    }
}
