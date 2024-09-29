/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ManagerUserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.District;
import model.Provinces;
import model.UserAddresses;
import model.UserAuthentication;
import model.Users;
import model.Ward;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class AddUserServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "img";

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
            out.println("<title>Servlet AddUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUserServlet at " + request.getContextPath() + "</h1>");
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
        ManagerUserDAO userDAO = new ManagerUserDAO();

        // Lấy tất cả tỉnh thành để luôn hiển thị
        List<Provinces> provinces = userDAO.getAllProvinces();
        request.setAttribute("provinces", provinces);

        // Kiểm tra nếu provinceID được chọn để lấy districts
        String selectedProvinceID = request.getParameter("provinceID");
        List<District> districts = new ArrayList<>();
        if (selectedProvinceID != null && !selectedProvinceID.isEmpty()) {
            int provinceID = Integer.parseInt(selectedProvinceID);
            districts = userDAO.getDistrictsByProvince(provinceID);
            request.setAttribute("districts", districts);
        }

        // Kiểm tra nếu districtID được chọn để lấy wards
        String selectedDistrictID = request.getParameter("districtID");
        List<Ward> wards = new ArrayList<>();
        if (selectedDistrictID != null && !selectedDistrictID.isEmpty()) {
            int districtID = Integer.parseInt(selectedDistrictID);
            wards = userDAO.getWardsByDistrict(districtID);
            request.setAttribute("wards", wards);
        }

        request.setAttribute("selectedProvinceID", selectedProvinceID);
        request.setAttribute("selectedDistrictID", selectedDistrictID);

        // Chuyển tiếp đến form JSP
        request.getRequestDispatcher("form-add-user.jsp").forward(request, response);
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
        try {
            // Lấy thông tin người dùng từ form
            String firstName = request.getParameter("firstName");
            String middleName = request.getParameter("middleName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String gender = request.getParameter("gender");
            String citizenIdentification = request.getParameter("citizenIdentification");
            String streetAddress = request.getParameter("streetAddress");
            int wardID = Integer.parseInt(request.getParameter("wardID"));
            String username = request.getParameter("username");
            String passwordHash = request.getParameter("passwordHash");
            java.sql.Date dateOfBirth = java.sql.Date.valueOf(request.getParameter("dateOfBirth"));
            Part filePart = request.getPart("profileImage");
            // Thiết lập đường dẫn upload file
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

            // Tạo thư mục upload nếu chưa tồn tại
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Xử lý file upload
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String filePath = uploadPath + File.separator + fileName;

            // Lưu file vào thư mục chỉ định
            filePart.write(filePath);
            // Tạo đối tượng Users và thiết lập các thuộc tính
            Users user = new Users();
            user.setFirstName(firstName);
            user.setMiddleName(middleName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);
            user.setDateOfBirth(dateOfBirth);
            user.setGender(gender);
            user.setCitizenIdentification(citizenIdentification);
            user.setProfileImage(UPLOAD_DIR + "/" + fileName);

            // Thêm địa chỉ
            UserAddresses address = new UserAddresses();
            address.setStreetAddress(streetAddress);
            address.setWardID(wardID);
            user.setAddress(address);

            // Thêm thông tin đăng nhập
            UserAuthentication userAuth = new UserAuthentication();
            userAuth.setUsername(username);
            userAuth.setPasswordHash(passwordHash);
            user.setUser(userAuth);

            // Gọi phương thức addUser trong ManagerUserDAO
            ManagerUserDAO userDAO = new ManagerUserDAO();
            userDAO.addUser(user);

            // Chuyển hướng đến trang quản lý người dùng sau khi thêm thành công
            response.sendRedirect("manageuser");
        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý lỗi và chuyển hướng đến trang lỗi nếu cần
            request.setAttribute("errorMessage", "Lỗi khi thêm người dùng: " + e.getMessage());
            request.getRequestDispatcher("form-add-user.jsp").forward(request, response);
        }
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
