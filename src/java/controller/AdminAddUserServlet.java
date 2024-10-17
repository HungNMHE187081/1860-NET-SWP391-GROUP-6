package controller;

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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminAddUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

        // Kiểm tra các trường dữ liệu đầu vào
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

        UserAuthentication userAuth = new UserAuthentication();
        userAuth.setUsername(username);
        String salt = generateSalt();
        userAuth.setSalt(salt);
        userAuth.setPasswordHash(hashPassword(password, salt));
        userAuth.setLastLogin(new Timestamp(System.currentTimeMillis()));
        user.setUser(userAuth);

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
