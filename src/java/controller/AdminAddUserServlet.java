package controller;

import dal.ManagerUserDAO;
import dal.RolesDAO;
import dal.UserDAO;
import model.UserAuthentication;
import model.Users;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Base64;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import model.District;
import model.Provinces;
import model.UserAddresses;
import model.Ward;

@MultipartConfig
public class AdminAddUserServlet extends HttpServlet {
    
    private static final String UPLOAD_DIR = "UserProfilesImages";


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
        request.getRequestDispatcher("/Admin_JSP/admin-add-user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String middleName = request.getParameter("middleName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String dateOfBirthStr = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");
        String citizenIdentification = request.getParameter("citizenIdentification");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String streetAddress = request.getParameter("streetAddress");
        int wardID = Integer.parseInt(request.getParameter("wardID"));
        Part filePart = request.getPart("profileImage");
        
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadDir = getServletContext().getRealPath("/") + UPLOAD_DIR;
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdir();
        }
        String filePath = uploadDir + File.separator + fileName;
        filePart.write(filePath);
        String img = UPLOAD_DIR + File.separator + fileName;
        
         //Kiểm tra các trường dữ liệu đầu vào
        if (firstName == null || firstName.isEmpty()
                || lastName == null || lastName.isEmpty()
                || email == null || email.isEmpty()
                || phoneNumber == null || phoneNumber.isEmpty()
                || dateOfBirthStr == null || dateOfBirthStr.isEmpty()
                || gender == null || gender.isEmpty()
                || citizenIdentification == null || citizenIdentification.isEmpty()
                || username == null || username.isEmpty()
                || password == null || password.isEmpty()
                || role == null || role.isEmpty()) {
            request.setAttribute("error", "Missing required fields");
            request.getRequestDispatcher("/Admin_JSP/admin-add-user.jsp").forward(request, response);
            return;
        }

        Date dateOfBirth = Date.valueOf(dateOfBirthStr);

        Users user = new Users();
        user.setFirstName(firstName);
        user.setMiddleName(middleName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setDateOfBirth(dateOfBirth);
        user.setGender(gender);
        user.setCitizenIdentification(citizenIdentification);
        user.setProfileImage(img);

        UserAuthentication userAuth = new UserAuthentication();
        userAuth.setUsername(username);
        String salt = generateSalt();
        userAuth.setSalt(salt);
        userAuth.setPasswordHash(hashPassword(password, salt));
        userAuth.setLastLogin(new Timestamp(System.currentTimeMillis()));
        user.setUser(userAuth);
        
        UserAddresses address = new UserAddresses();
        address.setStreetAddress(streetAddress);
        address.setWardID(wardID);
        user.setAddress(address);

        UserDAO userDAO = new UserDAO();
        int userID = userDAO.addUser(user);

        if (userID != -1) {
            RolesDAO rolesDAO = new RolesDAO();
            int roleID = rolesDAO.getRoleIDByName(role);
            if (roleID != -1) {
                userDAO.addUserRole(userID, roleID);
                response.sendRedirect(request.getContextPath() + "/admin/adminuserslist");
            } else {
                request.setAttribute("error", "Failed to add user because of Role");
                request.getRequestDispatcher("/Admin_JSP/admin-add-user.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Failed to add user");
            request.getRequestDispatcher("/Admin_JSP/admin-add-user.jsp").forward(request, response);
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
