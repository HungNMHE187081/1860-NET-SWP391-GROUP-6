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
        System.out.println("=== START PROCESSING ADD USER REQUEST ===");
        List<String> errors = new ArrayList<>();
        
        try {
            // Lấy parameters và validate
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
            String wardIDStr = request.getParameter("wardID");

            // Validate required fields
            if (firstName == null || firstName.trim().isEmpty()) {
                errors.add("Họ không được để trống");
            }
            if (lastName == null || lastName.trim().isEmpty()) {
                errors.add("Tên không được để trống");
            }
            if (email == null || email.trim().isEmpty()) {
                errors.add("Email không được để trống");
            } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                errors.add("Email không hợp lệ");
            }
            if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
                errors.add("Số điện thoại không được để trống");
            } else if (!phoneNumber.matches("^[0-9]{10}$")) {
                errors.add("Số điện thoại phải có 10 chữ số");
            }
            if (citizenIdentification == null || citizenIdentification.trim().isEmpty()) {
                errors.add("Số CMND không được để trống");
            } else if (!citizenIdentification.matches("^[0-9]{9}$|^[0-9]{12}$")) {
                errors.add("Số CMND phải có 9 hoặc 12 chữ số");
            }
            if (username == null || username.trim().isEmpty()) {
                errors.add("Tên đăng nhập không được để trống");
            } else if (username.length() <= 3) {
                errors.add("Tên đăng nhập phải có ít nhất 3 ký tự");
            }
            if (password == null || password.trim().isEmpty()) {
                errors.add("Mật khẩu không được để trống");
            } else if (password.length() < 8) {
                errors.add("Mật khẩu phải có ít nhất 8 ký tự");
            }
            if (wardIDStr == null || wardIDStr.trim().isEmpty()) {
                errors.add("Vui lòng chọn phường/xã");
            }
            if (streetAddress == null || streetAddress.trim().isEmpty()) {
                errors.add("Địa chỉ không được để trống");
            }

            // Validate date
            Date dateOfBirth = null;
            if (dateOfBirthStr == null || dateOfBirthStr.trim().isEmpty()) {
                errors.add("Ngày sinh không được để trống");
            } else {
                try {
                    dateOfBirth = Date.valueOf(dateOfBirthStr);
                    // Kiểm tra tuổi (ví dụ: phải trên 18 tuổi)
                    long age = java.time.Period.between(dateOfBirth.toLocalDate(), java.time.LocalDate.now()).getYears();
                    if (age < 18) {
                        errors.add("Người dùng phải trên 18 tuổi");
                    }
                } catch (IllegalArgumentException e) {
                    errors.add("Ngày sinh không hợp lệ");
                }
            }

            // Nếu có lỗi, trả về form với thông báo lỗi
            if (!errors.isEmpty()) {
                request.setAttribute("errors", errors);
                // Lưu lại các giá trị đã nhập
                request.setAttribute("firstName", firstName);
                request.setAttribute("middleName", middleName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("email", email);
                request.setAttribute("phoneNumber", phoneNumber);
                request.setAttribute("dateOfBirth", dateOfBirthStr);
                request.setAttribute("gender", gender);
                request.setAttribute("citizenIdentification", citizenIdentification);
                request.setAttribute("username", username);
                request.setAttribute("streetAddress", streetAddress);
                
                // Load lại danh sách provinces
                ManagerUserDAO userDAO = new ManagerUserDAO();
                List<Provinces> provinces = userDAO.getAllProvinces();
                request.setAttribute("provinces", provinces);
                
                request.getRequestDispatcher("/Admin_JSP/admin-add-user.jsp").forward(request, response);
                return;
            }

            // Tiếp tục xử lý nếu không có lỗi
            // Log các parameters nhận được
            System.out.println("Received Parameters:");
            System.out.println("firstName: " + firstName);
            System.out.println("middleName: " + middleName);
            System.out.println("lastName: " + lastName);
            System.out.println("email: " + email);
            System.out.println("phoneNumber: " + phoneNumber);
            System.out.println("dateOfBirth: " + dateOfBirthStr);
            System.out.println("gender: " + gender);
            System.out.println("citizenIdentification: " + citizenIdentification);
            System.out.println("username: " + username);
            System.out.println("role: " + role);
            System.out.println("streetAddress: " + streetAddress);

            // Log thông tin về ward
            System.out.println("wardID received: " + wardIDStr);
            
            int wardID;
            try {
                wardID = Integer.parseInt(wardIDStr);
                System.out.println("Parsed wardID: " + wardID);
            } catch (NumberFormatException e) {
                System.out.println("ERROR: Failed to parse wardID - " + e.getMessage());
                request.setAttribute("error", "Invalid Ward ID");
                request.getRequestDispatcher("/Admin_JSP/admin-add-user.jsp").forward(request, response);
                return;
            }

            // Xử lý upload ảnh
            Part filePart = request.getPart("profileImage");
            String profileImagePath = null;
            
            if (filePart != null && filePart.getSize() > 0) {
                System.out.println("Processing profile image upload...");
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadDir = getServletContext().getRealPath("/") + UPLOAD_DIR;
                
                // Tạo thư mục nếu chưa tồn tại
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    System.out.println("Creating upload directory...");
                    uploadDirFile.mkdir();
                }
                
                String filePath = uploadDir + File.separator + fileName;
                System.out.println("Saving file to: " + filePath);
                
                try {
                    filePart.write(filePath);
                    profileImagePath = UPLOAD_DIR + "/" + fileName;
                    System.out.println("File saved successfully. Database path: " + profileImagePath);
                } catch (Exception e) {
                    System.out.println("ERROR: Failed to save file - " + e.getMessage());
                    e.printStackTrace();
                }
            } else {
                System.out.println("No profile image uploaded, using default");
                profileImagePath = "UserProfilesImages/default-avatar.jpg";
            }

            // Set ảnh cho user object
            

            // Create user object
            System.out.println("=== CREATING USER OBJECT ===");
            Users user = new Users();
            user.setFirstName(firstName);
            user.setMiddleName(middleName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);
            user.setDateOfBirth(dateOfBirth);
            user.setGender(gender);
            user.setCitizenIdentification(citizenIdentification);
            user.setProfileImage(profileImagePath);

            // Create authentication
            System.out.println("=== CREATING USER AUTHENTICATION ===");
            UserAuthentication userAuth = new UserAuthentication();
            userAuth.setUsername(username);
            String salt = generateSalt();
            System.out.println("Generated salt: " + salt);
            userAuth.setSalt(salt);
            String hashedPassword = hashPassword(password, salt);
            System.out.println("Password hashed successfully");
            userAuth.setPasswordHash(hashedPassword);
            userAuth.setLastLogin(new Timestamp(System.currentTimeMillis()));
            user.setUser(userAuth);
            
            UserAddresses address = new UserAddresses();
            address.setStreetAddress(streetAddress);
            address.setWardID(wardID);
            user.setAddress(address);

            // Add user to database
            System.out.println("=== ADDING USER TO DATABASE ===");
            UserDAO userDAO = new UserDAO();
            int userID = userDAO.addUser(user);
            System.out.println("User added with ID: " + userID);

            if (userID != -1) {
                RolesDAO rolesDAO = new RolesDAO();
                int roleID = rolesDAO.getRoleIDByName(role);
                System.out.println("Role ID for " + role + ": " + roleID);
                
                if (roleID != -1) {
                    userDAO.addUserRole(userID, roleID);
                    
                    System.out.println("=== USER CREATION COMPLETED SUCCESSFULLY ===");
                    response.sendRedirect(request.getContextPath() + "/admin/adminuserslist");
                } else {
                    System.out.println("ERROR: Invalid role ID");
                    request.setAttribute("error", "Failed to add user because of Role");
                    request.getRequestDispatcher("/Admin_JSP/admin-add-user.jsp").forward(request, response);
                }
            } else {
                System.out.println("ERROR: Failed to add user to database");
                request.setAttribute("error", "Failed to add user");
                request.getRequestDispatcher("/Admin_JSP/admin-add-user.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            System.out.println("CRITICAL ERROR: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "System error: " + e.getMessage());
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