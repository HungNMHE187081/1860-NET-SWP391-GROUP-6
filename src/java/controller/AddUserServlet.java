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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

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
        request.getRequestDispatcher("/form-add-user.jsp").forward(request, response);
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
            ManagerUserDAO userDAO = new ManagerUserDAO();
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
            String password = request.getParameter("passwordHash");
            java.sql.Date dateOfBirth = java.sql.Date.valueOf(request.getParameter("dateOfBirth"));
            Part filePart = request.getPart("profileImage");
            String provinceID = request.getParameter("provinceID");
            String districtID = request.getParameter("districtID");
            String salt = generateSalt();
            String passwordHash = hashPassword(password, salt);
            // Thiết lập đường dẫn upload file
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

            List<Provinces> provinces = userDAO.getAllProvinces();
            request.setAttribute("provinces", provinces);

            // Load districts nếu có provinceID
            if (provinceID != null && !provinceID.isEmpty()) {
                List<District> districts = userDAO.getDistrictsByProvince(Integer.parseInt(provinceID));
                request.setAttribute("districts", districts);
            }

            // Load wards nếu có districtID
            if (districtID != null && !districtID.isEmpty()) {
                List<Ward> wards = userDAO.getWardsByDistrict(Integer.parseInt(districtID));
                request.setAttribute("wards", wards);
            }

            // Kiểm tra các trường không được để null hoặc rỗng
            if (firstName == null || firstName.trim().isEmpty() || username == null || username.trim().isEmpty()) {
                request.setAttribute("oldData", request.getParameterMap());
                request.setAttribute("errorMessage", "Họ và tên, Username không được để trống");
                request.getRequestDispatcher("/form-add-user.jsp").forward(request, response);
                return;
            }
            if (userDAO.checkUsernameExists(username)) {
                request.setAttribute("oldData", request.getParameterMap());
                request.setAttribute("errorMessage", "Username đã tồn tại");
                request.getRequestDispatcher("/form-add-user.jsp").forward(request, response);
                return;
            }

            // Kiểm tra tuổi phải trên 18
            java.util.Date today = new java.util.Date();
            long ageInMillis = today.getTime() - dateOfBirth.getTime();
            long ageInYears = ageInMillis / (1000L * 60 * 60 * 24 * 365);
            if (ageInYears < 18) {
                request.setAttribute("oldData", request.getParameterMap());
                request.setAttribute("errorMessage", "Tuổi phải trên 18");
                request.getRequestDispatcher("/form-add-user.jsp").forward(request, response);
                return;
            }

            // Kiểm tra CCCD phải đủ 12 số và không được trùng
            if (citizenIdentification == null || citizenIdentification.length() != 12 || !citizenIdentification.matches("\\d+")) {
                request.setAttribute("oldData", request.getParameterMap());
                request.setAttribute("errorMessage", "CCCD phải đủ 12 số");
                request.getRequestDispatcher("/form-add-user.jsp").forward(request, response);
                return;
            }
            if (userDAO.isCitizenIdentificationExists(citizenIdentification)) {
                request.setAttribute("oldData", request.getParameterMap());
                request.setAttribute("errorMessage", "CCCD đã tồn tại");
                request.getRequestDispatcher("/form-add-user.jsp").forward(request, response);
                return;
            }

            // Kiểm tra số điện thoại phải đủ 10 số
            if (phoneNumber == null || phoneNumber.length() != 10 || !phoneNumber.matches("\\d+")) {
                request.setAttribute("oldData", request.getParameterMap());
                request.setAttribute("errorMessage", "Số điện thoại phải đủ 10 số");
                request.getRequestDispatcher("/form-add-user.jsp").forward(request, response);
                return;
            }
            if (userDAO.isPhoneNumberExists(phoneNumber)) {
                request.setAttribute("oldData", request.getParameterMap());
                request.setAttribute("errorMessage", "SDT đã tồn tại");
                request.getRequestDispatcher("/form-add-user.jsp").forward(request, response);
                return;
            }

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
            userAuth.setSalt(salt);
            user.setUser(userAuth);

            // Gọi phương thức addUser trong ManagerUserDAO
            userDAO.addUser(user);

            // Chuyển hướng đến trang quản lý người dùng sau khi thêm thành công
            response.sendRedirect(request.getContextPath()+"/manager/manageuser");
        } catch (Exception e) {
            e.printStackTrace();
            // Load lại danh sách trước khi forward về form
            ManagerUserDAO userDAO = new ManagerUserDAO();
            List<Provinces> provinces = userDAO.getAllProvinces();
            request.setAttribute("provinces", provinces);

            String provinceID = request.getParameter("provinceID");
            if (provinceID != null && !provinceID.isEmpty()) {
                List<District> districts = userDAO.getDistrictsByProvince(Integer.parseInt(provinceID));
                request.setAttribute("districts", districts);
            }

            String districtID = request.getParameter("districtID");
            if (districtID != null && !districtID.isEmpty()) {
                List<Ward> wards = userDAO.getWardsByDistrict(Integer.parseInt(districtID));
                request.setAttribute("wards", wards);
            }
            // Xử lý lỗi và chuyển hướng đến trang lỗi nếu cần
            request.setAttribute("errorMessage", "Lỗi khi thêm người dùng: " + e.getMessage());
            request.getRequestDispatcher("/form-add-user.jsp").forward(request, response);
        }
    }

    private String generateSalt() {
        byte[] salt = new byte[16];
        new java.security.SecureRandom().nextBytes(salt);
        return Base64.getEncoder().encodeToString(salt);
    }

    private String hashPassword(String password, String salt) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(Base64.getDecoder().decode(salt));
            byte[] hashedPassword = md.digest(password.getBytes());
            return Base64.getEncoder().encodeToString(hashedPassword);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
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