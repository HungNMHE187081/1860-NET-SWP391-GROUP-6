package controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import dal.ChildrenDAO;
import model.Children;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date; // SQL Date for the database
import model.Users;

public class EditChildren extends HttpServlet {
    private ChildrenDAO childrenDAO;

    @Override
    public void init() {
        // Initialize your DAO here (if needed)
        childrenDAO = new ChildrenDAO(); // Adjust as necessary to match your implementation
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditChildren</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditChildren at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int childID = Integer.parseInt(request.getParameter("childID"));
            Children children = childrenDAO.getChildrenByID(childID);
            request.setAttribute("children", children);
            request.getRequestDispatcher("/Common_JSP/edit-children-customer.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        int childID = Integer.parseInt(request.getParameter("childID"));
        String firstName = request.getParameter("firstName");
        String middleName = request.getParameter("middleName");
        String lastName = request.getParameter("lastName");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");

        // Lấy dữ liệu cũ của trẻ để giữ lại tên hình ảnh hiện tại
        Children existingChild = childrenDAO.getChildrenByID(childID);
        String oldImageName = existingChild.getChildImage();

        // Xử lý tải lên tệp
        Part filePart = request.getPart("profileImage"); // Đảm bảo tên này khớp với tên input của bạn
        String fileName = filePart.getSubmittedFileName();

        String newImageName = (fileName != null && !fileName.isEmpty()) ? saveFile(filePart) : oldImageName;

        // Tạo đối tượng Child và cập nhật nó
        Children child = new Children(childID, firstName, middleName, lastName, Date.valueOf(dateOfBirth), gender, newImageName);
        childrenDAO.updateChild(child); // Gọi phương thức cập nhật trong DAO

        response.sendRedirect("listchildren"); // Chuyển hướng đến trang thành công
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Cập nhật trẻ không thành công. Vui lòng thử lại.");
        request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
    }
}



    private String saveFile(Part filePart) {
        // Define the directory where you want to save uploaded files
        String uploads = "C:/path_to_your_directory/uploads"; // Change to your desired directory
        String fileName = extractFileName(filePart);
        String filePath = uploads + "/" + fileName;

        // Create the uploads directory if it doesn't exist
        File uploadDir = new File(uploads);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Save the file to the specified directory
        try {
            filePart.write(filePath); // This will save the file
        } catch (IOException e) {
            e.printStackTrace(); // Handle exception appropriately
            return null; // Return null if file saving fails
        }

        // Return the relative path to be stored in the database
        return "uploads/" + fileName; // Adjust based on how you access images
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String token : contentDisposition.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 2, token.length() - 1);
            }
        }
        return null; // Return null if the filename cannot be extracted
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
