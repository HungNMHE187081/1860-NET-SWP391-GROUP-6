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
                user.setAddress(address);
                userDAO.addUserAddress(address);
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
        int userID = Integer.parseInt(request.getParameter("userID"));
        ManagerUserDAO userDAO = new ManagerUserDAO();
        Users user = userDAO.getDetailUserByUserID(userID);
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
                request.getRequestDispatcher("/manager-edit-user.jsp").forward(request, response);
                return;
            }
        }
        user.setFirstName(firstName);
        user.setMiddleName(middleName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setDateOfBirth(java.sql.Date.valueOf(dateOfBirth));
        user.setGender(gender);
        user.setCitizenIdentification(citizenIdentification);
        user.setProfileImage(img);
        user.getAddress().setWardID(wardID);
        
        UserAddresses address = new UserAddresses();
        address.setUserID(userID);
        address.setStreetAddress(streetAddress);
        address.setWardID(wardID);
        user.setAddress(address);
        // Lưu thông tin cập nhật vào cơ sở dữ liệu
        userDAO.updateUser(user);

        // Chuyển hướng về trang hồ sơ
        response.sendRedirect(request.getContextPath() + "/manager/manageuser");
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
