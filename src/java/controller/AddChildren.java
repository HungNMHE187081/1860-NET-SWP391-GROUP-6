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
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 10 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
@WebServlet("/AddChildren")
public class AddChildren extends HttpServlet {

    private ChildrenDAO childrenDAO = new ChildrenDAO();
    private static final String UPLOAD_DIR = "uploads";
    private static final String DEFAULT_IMAGE = "images/default-avatar.jpg"; // Đường dẫn ảnh mặc định

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Kiểm tra file ảnh tải lên
            Part filePart = request.getPart("childImage");
            String childImage = ""; // Khởi tạo với ảnh mặc định

            if (filePart != null && filePart.getSize() > 0) {
                // Xử lý upload file nếu người dùng chọn ảnh
                String fileName = getFileName(filePart);
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR + File.separator;

                // Tạo thư mục upload nếu chưa tồn tại
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                if (fileName != null && !fileName.isEmpty()) {
                    filePart.write(uploadPath + fileName);
                    childImage = UPLOAD_DIR + "/" + fileName; // Cập nhật childImage nếu có ảnh tải lên
                } else {
                    // Nếu tên file không hợp lệ, vẫn dùng ảnh mặc định
                    request.setAttribute("error", "Tên file không hợp lệ. Đã sử dụng ảnh mặc định.");
                    childImage = DEFAULT_IMAGE;
                }
            }

            // Lấy dữ liệu form
            int customerID = Integer.parseInt(request.getParameter("customerID"));
            String firstName = request.getParameter("firstName");
            String middleName = request.getParameter("middleName");
            String lastName = request.getParameter("lastName");
            java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dateOfBirth"));
            Date dateOfBirth = new Date(utilDate.getTime());
            String gender = request.getParameter("gender");

            // Tạo đối tượng Children
            Children child = new Children(customerID, firstName, middleName, lastName, dateOfBirth, gender, childImage);

            // Thêm thông tin trẻ vào database
            childrenDAO.addChild(child);

            // Chuyển hướng về trang danh sách
            response.sendRedirect("listchildren");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra khi thêm thông tin. Vui lòng thử lại.");
            request.getRequestDispatcher("/Common_JSP/add-children.jsp").forward(request, response);
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
