package controller;

import dal.ManagerUserDAO;
import dal.UserDAO;
import model.Users;
import model.UserAddresses;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import model.District;
import model.Provinces;
import model.Ward;

@MultipartConfig
public class AdminEditProfileServlet extends HttpServlet {

    private UserDAO userDAO;
    private static final String UPLOAD_DIR = "UserProfilesImages";

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ManagerUserDAO userDAO = new ManagerUserDAO();

        // Lấy tất cả tỉnh thành để luôn hiển thị
        List<Provinces> provinces = userDAO.getAllProvinces();
        request.setAttribute("provinces", provinces);

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null) {

            if (user.getAddress() == null) {
                UserAddresses address = new UserAddresses();
                address.setUserID(user.getUserID());
                user.setAddress(address);
                userDAO.addUserAddress(address);
            }

            // Lấy danh sách Quận/Huyện và Phường/Xã dựa trên địa chỉ hiện tại của người dùng
            List<District> districts = userDAO.getDistrictsByProvince(user.getAddress().getProvinces().getProvinceID());
            List<Ward> wards = userDAO.getWardsByDistrict(user.getAddress().getDistrict().getId());

            request.setAttribute("districts", districts);
            request.setAttribute("wards", wards);
            request.setAttribute("userDetails", user);
            request.getRequestDispatcher("/Admin_JSP/admin-edit-profile.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            // Lấy thông tin từ form
            String firstName = request.getParameter("firstName");
            String middleName = request.getParameter("middleName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String gender = request.getParameter("gender");
            String citizenIdentification = request.getParameter("citizenIdentification");
            String streetAddress = request.getParameter("streetAddress");
            String wardIDStr = request.getParameter("wardID");

            if (firstName == null || middleName == null || lastName == null || email == null ||
                phoneNumber == null || dateOfBirth == null || gender == null || citizenIdentification == null ||
                streetAddress == null || wardIDStr == null) {
                request.setAttribute("error", "Vui lòng điền đầy đủ thông tin.");
                request.getRequestDispatcher("/Admin_JSP/admin-edit-profile.jsp").forward(request, response);
                return;
            }

            int wardID;
            try {
                wardID = Integer.parseInt(wardIDStr);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Ward ID không hợp lệ.");
                request.getRequestDispatcher("/Admin_JSP/admin-edit-profile.jsp").forward(request, response);
                return;
            }

            Part filePart = request.getPart("profileImage");
            String img = user.getProfileImage(); // Giữ lại ảnh cũ nếu không có ảnh mới

            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadDir = getServletContext().getRealPath("/") + UPLOAD_DIR;
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdir();
                }
                String filePath = uploadDir + File.separator + fileName;
                try {
                    filePart.write(filePath);
                    img = UPLOAD_DIR + File.separator + fileName;
                } catch (IOException e) {
                    request.setAttribute("error", "Không thể lưu ảnh đại diện. Vui lòng thử lại.");
                    request.getRequestDispatcher("/Admin_JSP/admin-edit-profile.jsp").forward(request, response);
                    return;
                }
            }

            // Cập nhật thông tin người dùng
            user.setFirstName(firstName);
            user.setMiddleName(middleName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);
            user.setDateOfBirth(java.sql.Date.valueOf(dateOfBirth));
            user.setGender(gender);
            user.setCitizenIdentification(citizenIdentification);
            user.setProfileImage(img);
            
            user.getAddress().setStreetAddress(streetAddress);
            user.getAddress().setWardID(wardID);

            // Lưu thông tin cập nhật vào cơ sở dữ liệu
            userDAO.updateUserWithAddress(user);

            // Cập nhật thông tin trong session
            session.setAttribute("user", user);

            // Chuyển hướng về trang hồ sơ
            response.sendRedirect(request.getContextPath() + "/admin/viewprofile");
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
