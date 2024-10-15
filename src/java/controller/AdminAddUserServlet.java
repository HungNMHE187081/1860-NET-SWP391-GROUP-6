package controller;

import dal.ManagerUserDAO;
import dal.RolesDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import model.District;
import model.Provinces;
import model.UserAddresses;
import model.UserAuthentication;
import model.Users;
import model.Ward;
import java.sql.Timestamp;

/**
 *
 */
public class AdminAddUserServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "img";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        String fullPath = "/Admin_JSP/admin-add-user.jsp";
        request.getRequestDispatcher(fullPath).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String middleName = request.getParameter("middleName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String dateOfBirthStr = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");
        String citizenIdentification = request.getParameter("citizenIdentification");
        String streetAddress = request.getParameter("streetAddress");
        String provinceIDStr = request.getParameter("provinceID");
        String districtIDStr = request.getParameter("districtID");
        String wardIDStr = request.getParameter("wardID");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Kiểm tra provinceID
        int provinceID = 0;
        if (provinceIDStr != null && !provinceIDStr.isEmpty()) {
            try {
                provinceID = Integer.parseInt(provinceIDStr);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/admin/admin-add-user.jsp?error=invalid_provinceID");
                return;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/admin-add-user.jsp?error=missing_provinceID");
            return;
        }

        // Kiểm tra districtID
        int districtID = 0;
        if (districtIDStr != null && !districtIDStr.isEmpty()) {
            try {
                districtID = Integer.parseInt(districtIDStr);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/admin/admin-add-user.jsp?error=invalid_districtID");
                return;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/admin-add-user.jsp?error=missing_districtID");
            return;
        }

        // Kiểm tra wardID
        int wardID = 0;
        if (wardIDStr != null && !wardIDStr.isEmpty()) {
            try {
                wardID = Integer.parseInt(wardIDStr);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/admin/admin-add-user.jsp?error=invalid_wardID");
                return;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/admin-add-user.jsp?error=missing_wardID");
            return;
        }

        // Kiểm tra dateOfBirth
        Date dateOfBirth = null;
        if (dateOfBirthStr != null && !dateOfBirthStr.isEmpty()) {
            try {
                dateOfBirth = Date.valueOf(dateOfBirthStr);
            } catch (IllegalArgumentException e) {
                response.sendRedirect(request.getContextPath() + "/admin/admin-add-user.jsp?error=invalid_date");
                return;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/admin-add-user.jsp?error=missing_date");
            return;
        }

        Part filePart = request.getPart("profileImage");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

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

        UserAuthentication userAuth = new UserAuthentication();
        userAuth.setUsername(username);
        userAuth.setPasswordHash(hashPassword(password, generateSalt()));
        userAuth.setLastLogin(new Timestamp(System.currentTimeMillis()));
        user.setUser(userAuth);

        UserDAO userDAO = new UserDAO();
        int userID = userDAO.addUser(user);

        if (userID != -1) {
            RolesDAO rolesDAO = new RolesDAO();
            int roleID = rolesDAO.getRoleIDByName(role);
            userDAO.addUserRole(userID, roleID);
            response.sendRedirect(request.getContextPath() + "/admin/adminuserslist");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/admin-add-user.jsp?error=true");
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
}