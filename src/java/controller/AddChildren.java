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
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.Date;
import java.text.SimpleDateFormat;

@MultipartConfig
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
            if (filePart == null || filePart.getSize() == 0) {
                throw new ServletException("File is required.");
            }

            String fileName = filePart.getSubmittedFileName();
            File uploadDir = new File(getServletContext().getRealPath("") + File.separator + UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdir(); // Create the directory if it doesn't exist
            }

            String filePath = uploadDir.getAbsolutePath() + File.separator + fileName;

            // Save the file to the server
            try (InputStream inputStream = filePart.getInputStream()) {
                Files.copy(inputStream, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
            }

            // Create Child object
            Children child = new Children(customerID, firstName, middleName, lastName, dateOfBirth, gender, fileName);

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

    @Override
    public String getServletInfo() {
        return "Thêm thông tin trẻ em";
    }
}
