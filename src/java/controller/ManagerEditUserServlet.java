/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ManagerUserDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
import model.UserAddresses;
import model.Users;
import model.Ward;
import org.apache.catalina.User;
import utils.EmailService;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class ManagerEditUserServlet extends HttpServlet {

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
            out.println("<title>Servlet ManagerEditUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerEditUserServlet at " + request.getContextPath() + "</h1>");
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
        int userID = Integer.parseInt(request.getParameter("userID"));
        Users user = userDAO.getDetailUserByUserID(userID);
        List<Provinces> provinces = userDAO.getAllProvinces();
        request.setAttribute("provinces", provinces);
        if (user != null) {

            if (user.getAddress() == null) {
                UserAddresses address = new UserAddresses();
                address.setUserID(user.getUserID());
                address.setWardID(user.getAddress().getWardID());
                user.setAddress(address);
                userDAO.updateUserAddress(address);
            }

            List<District> districts = userDAO.getDistrictsByProvince(user.getAddress().getProvinces().getProvinceID());
            List<Ward> wards = userDAO.getWardsByDistrict(user.getAddress().getDistrict().getId());
            request.setAttribute("userDetails", user);
            request.setAttribute("districts", districts);
            request.setAttribute("wards", wards);
            request.getRequestDispatcher("/manager-edit-user.jsp").forward(request, response);
        }
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
            int userID = Integer.parseInt(request.getParameter("userID"));
            ManagerUserDAO userDAO = new ManagerUserDAO();
            Users user = userDAO.getDetailUserByUserID(userID);

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
            int wardID = Integer.parseInt(request.getParameter("wardID"));

            // Load lại data cho form trong trường hợp validation fail
            List<Provinces> provinces = userDAO.getAllProvinces();
            request.setAttribute("provinces", provinces);
            List<District> districts = userDAO.getDistrictsByProvince(user.getAddress() != null
                    ? user.getAddress().getProvinces().getProvinceID() : 0);
            List<Ward> wards = userDAO.getWardsByDistrict(user.getAddress() != null
                    ? user.getAddress().getDistrict().getId() : 0);
            request.setAttribute("districts", districts);
            request.setAttribute("wards", wards);
            request.setAttribute("userDetails", user);

            // Validate firstName không được để trống
            if (firstName == null || firstName.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Họ không được để trống");
                request.getRequestDispatcher("/manager-edit-user.jsp").forward(request, response);
                return;
            }

            // Validate tuổi phải trên 18
            java.util.Date today = new java.util.Date();
            java.sql.Date birthDate = java.sql.Date.valueOf(dateOfBirth);
            long ageInMillis = today.getTime() - birthDate.getTime();
            long ageInYears = ageInMillis / (1000L * 60 * 60 * 24 * 365);
            if (ageInYears < 18) {
                request.setAttribute("errorMessage", "Tuổi phải trên 18");
                request.getRequestDispatcher("/manager-edit-user.jsp").forward(request, response);
                return;
            }

            // Validate CCCD
            if (citizenIdentification == null || citizenIdentification.length() != 12 || !citizenIdentification.matches("\\d+")) {
                request.setAttribute("errorMessage", "CCCD phải đủ 12 số");
                request.getRequestDispatcher("/manager-edit-user.jsp").forward(request, response);
                return;
            }

            // Kiểm tra CCCD có bị trùng không (trừ CCCD hiện tại của user)
            if (!citizenIdentification.equals(user.getCitizenIdentification())
                    && userDAO.isCitizenIdentificationExists(citizenIdentification)) {
                request.setAttribute("errorMessage", "CCCD đã tồn tại");
                request.getRequestDispatcher("/manager-edit-user.jsp").forward(request, response);
                return;
            }

            // Validate số điện thoại
            if (phoneNumber == null || phoneNumber.length() != 10 || !phoneNumber.matches("\\d+")) {
                request.setAttribute("errorMessage", "Số điện thoại phải đủ 10 số");
                request.getRequestDispatcher("/manager-edit-user.jsp").forward(request, response);
                return;
            }

            // Kiểm tra số điện thoại có bị trùng không (trừ SDT hiện tại của user)
            if (!phoneNumber.equals(user.getPhoneNumber())
                    && userDAO.isPhoneNumberExists(phoneNumber)) {
                request.setAttribute("errorMessage", "Số điện thoại đã tồn tại");
                request.getRequestDispatcher("/manager-edit-user.jsp").forward(request, response);
                return;
            }

            // Xử lý upload ảnh
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
                    request.setAttribute("errorMessage", "Không thể lưu ảnh đại diện. Vui lòng thử lại.");
                    request.getRequestDispatcher("/manager-edit-user.jsp").forward(request, response);
                    return;
                }
            }

            // Cập nhật thông tin user
            user.setFirstName(firstName);
            user.setMiddleName(middleName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);
            user.setDateOfBirth(java.sql.Date.valueOf(dateOfBirth));
            user.setGender(gender);
            user.setCitizenIdentification(citizenIdentification);
            user.setProfileImage(img);
             UserAddresses address;
            if (user.getAddress() == null) {
                address = new UserAddresses();
                address.setUserID(userID); // Gán UserID vào địa chỉ
                address.setWardID(wardID);  // Gán WardID từ form
                address.setStreetAddress(streetAddress); // Gán StreetAddress từ form
                userDAO.addUserAddress(address); // Lưu vào database
                user.setAddress(address); // Gán lại địa chỉ cho user
            } else {
                // Nếu đã có địa chỉ, chỉ cần cập nhật
                address = user.getAddress();
                address.setStreetAddress(streetAddress);
                address.setWardID(wardID); // Cập nhật ID của ward
                user.setAddress(address); // Gán lại cho user
            }

            // Lưu thông tin cập nhật vào database
            userDAO.updateUser(user);
            EmailService.sendEmailForEdit(email, firstName, middleName, lastName);
            // Chuyển hướng về trang danh sách user
            response.sendRedirect(request.getContextPath() + "/manager/manageuser");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi khi cập nhật thông tin: " + e.getMessage());
            request.getRequestDispatcher("/manager-edit-user.jsp").forward(request, response);
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
