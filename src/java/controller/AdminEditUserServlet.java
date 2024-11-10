package controller;

import dal.UserDAO;
import model.Users;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@MultipartConfig
public class AdminEditUserServlet extends HttpServlet {
    private UserDAO userDAO;
    private static final String UPLOAD_DIR = "UserProfilesImages";

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        if (userIdStr != null && !userIdStr.isEmpty()) {
            try {
                int userId = Integer.parseInt(userIdStr);
                Users user = userDAO.getUserWithAddressById(userId);
                if (user != null) {
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("/Admin_JSP/admin-edit-user.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/adminsearchuser?error=User not found");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/admin/adminsearchuser?error=Invalid user ID");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/adminsearchuser?error=User ID is required");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    List<String> errors = new ArrayList<>();
    
    try {
        System.out.println("=== START PROCESSING EDIT USER REQUEST ===");
        
        // Lấy tất cả parameters
        String userIdStr = request.getParameter("userId");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String middleName = request.getParameter("middleName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String citizenIdentification = request.getParameter("citizenIdentification");
        String dateOfBirthStr = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");

        System.out.println("Received userId: " + userIdStr);
        System.out.println("Date of birth received: " + dateOfBirthStr);

        // Validate required fields
        if (userIdStr == null || userIdStr.isEmpty()) {
            errors.add("User ID là bắt buộc");
        }

        // Validate firstName
        if (firstName == null || !firstName.matches("^[A-Za-zÀ-ỹ\\s]{2,50}$")) {
            errors.add("Họ phải từ 2-50 ký tự và không chứa số hoặc ký tự đặc biệt");
        }

        // Validate lastName
        if (lastName == null || !lastName.matches("^[A-Za-zÀ-ỹ\\s]{2,50}$")) {
            errors.add("Tên phải từ 2-50 ký tự và không chứa số hoặc ký tự đặc biệt");
        }

        // Validate email
        if (email == null || !email.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")) {
            errors.add("Email không hợp lệ");
        }

        // Validate phone number nếu có
        if (phoneNumber != null && !phoneNumber.isEmpty() && 
            !phoneNumber.matches("(84|0[3|5|7|8|9])+([0-9]{8})\\b")) {
            errors.add("Số điện thoại không hợp lệ");
        }

        // Validate CCCD/CMND nếu có
        if (citizenIdentification != null && !citizenIdentification.isEmpty() && 
            !citizenIdentification.matches("^[0-9]{9}$|^[0-9]{12}$")) {
            errors.add("CCCD/CMND phải có 9 hoặc 12 số");
        }

        // Validate và parse ngày sinh
        java.sql.Date sqlDate = null;
        if (dateOfBirthStr != null && !dateOfBirthStr.isEmpty()) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date dob = sdf.parse(dateOfBirthStr);
                Calendar today = Calendar.getInstance();
                Calendar birthDate = Calendar.getInstance();
                birthDate.setTime(dob);
                
                int age = today.get(Calendar.YEAR) - birthDate.get(Calendar.YEAR);
                if (today.get(Calendar.MONTH) < birthDate.get(Calendar.MONTH) || 
                    (today.get(Calendar.MONTH) == birthDate.get(Calendar.MONTH) && 
                     today.get(Calendar.DAY_OF_MONTH) < birthDate.get(Calendar.DAY_OF_MONTH))) {
                    age--;
                }
                
                System.out.println("Calculated age: " + age);
                if (age < 18) {
                    errors.add("Người dùng phải từ 18 tuổi trở lên");
                }
                sqlDate = new java.sql.Date(dob.getTime());
            } catch (ParseException e) {
                errors.add("Ngày sinh không hợp lệ");
            }
        }

        // Validate gender
        if (gender == null || gender.isEmpty() || 
            (!gender.equals("Nam") && !gender.equals("Nữ") && !gender.equals("Khác"))) {
            errors.add("Giới tính không hợp lệ");
        }

        // Nếu có lỗi, giữ lại dữ liệu và hiển thị lỗi
        if (!errors.isEmpty()) {
            System.out.println("Validation errors: " + errors);
            request.setAttribute("errors", errors);
            
            // Giữ lại dữ liệu đã nhập
            Users tempUser = new Users();
            if (userIdStr != null && !userIdStr.isEmpty()) {
                tempUser.setUserID(Integer.parseInt(userIdStr));
            }
            tempUser.setFirstName(firstName);
            tempUser.setMiddleName(middleName);
            tempUser.setLastName(lastName);
            tempUser.setEmail(email);
            tempUser.setPhoneNumber(phoneNumber);
            tempUser.setCitizenIdentification(citizenIdentification);
            tempUser.setGender(gender);
            tempUser.setDateOfBirth(sqlDate);
            
            request.setAttribute("user", tempUser);
            request.getRequestDispatcher("/Admin_JSP/admin-edit-user.jsp").forward(request, response);
            return;
        }

        // Xử lý cập nhật nếu không có lỗi
        int userId = Integer.parseInt(userIdStr);
        Users userToUpdate = userDAO.getUserWithAddressById(userId);
        
        if (userToUpdate == null) {
            errors.add("Không tìm thấy user với ID: " + userId);
            forwardWithError(request, response, errors);
            return;
        }

        // Cập nhật thông tin user
        userToUpdate.setFirstName(firstName);
        userToUpdate.setMiddleName(middleName);
        userToUpdate.setLastName(lastName);
        userToUpdate.setEmail(email);
        userToUpdate.setPhoneNumber(phoneNumber);
        userToUpdate.setDateOfBirth(sqlDate);
        userToUpdate.setGender(gender);
        userToUpdate.setCitizenIdentification(citizenIdentification);

        // Xử lý upload ảnh nếu có
        Part filePart = request.getPart("profileImage");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadDir = getServletContext().getRealPath("/") + UPLOAD_DIR;
            File uploadDirFile = new File(uploadDir);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdir();
            }
            String filePath = uploadDir + File.separator + fileName;
            filePart.write(filePath);
            userToUpdate.setProfileImage(UPLOAD_DIR + "/" + fileName);
        }

        // Lưu vào database
        userDAO.updateUser(userToUpdate);
        System.out.println("User updated successfully");
        response.sendRedirect(request.getContextPath() + "/admin/adminuserslist?success=User updated successfully");

    } catch (Exception e) {
        System.out.println("CRITICAL ERROR: " + e.getMessage());
        e.printStackTrace();
        errors.add("Lỗi hệ thống: " + e.getMessage());
        request.setAttribute("errors", errors);
        request.getRequestDispatcher("/Admin_JSP/admin-edit-user.jsp").forward(request, response);
    }
}

// Helper method để tính tuổi
private int getAge(java.util.Date dob) {
    Calendar today = Calendar.getInstance();
    Calendar birthDate = Calendar.getInstance();
    birthDate.setTime(dob);
    int age = today.get(Calendar.YEAR) - birthDate.get(Calendar.YEAR);
    if (today.get(Calendar.DAY_OF_YEAR) < birthDate.get(Calendar.DAY_OF_YEAR)) {
        age--;
    }
    return age;
}

// Helper method để forward với errors
private void forwardWithError(HttpServletRequest request, HttpServletResponse response, List<String> errors) 
        throws ServletException, IOException {
    request.setAttribute("errors", errors);
    // Lấy lại thông tin user để hiển thị trên form
    String userIdStr = request.getParameter("userId");
    if (userIdStr != null) {
        try {
            int userId = Integer.parseInt(userIdStr);
            Users user = userDAO.getUserWithAddressById(userId);
            request.setAttribute("user", user);
        } catch (NumberFormatException e) {
            errors.add("User ID không hợp lệ");
        }
    }
    request.getRequestDispatcher("/Admin_JSP/admin-edit-user.jsp").forward(request, response);
}
}