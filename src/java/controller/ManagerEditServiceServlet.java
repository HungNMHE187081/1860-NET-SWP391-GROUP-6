package controller;

import dal.AgeLimitDAO;
import dal.CategoryDAO;
import dal.DegreeDAO;
import dal.ServiceDAO;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
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
import model.AgeLimits;
import model.Category;
import model.Degree;
import model.Service;

@MultipartConfig
public class ManagerEditServiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
        List<AgeLimits> ageLimits = ageLimitDAO.getAllAgeLimits();
        request.setAttribute("ageLimits", ageLimits);
        
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categories = categoryDAO.getAllCategories();
        request.setAttribute("categories", categories);
        
        DegreeDAO degreeDAO = new DegreeDAO();
        List<Degree> degrees = degreeDAO.getAllDegrees();
        request.setAttribute("degrees", degrees);
        
        ServiceDAO serviceDAO = new ServiceDAO();
        String serviceIDStr = request.getParameter("serviceID");
        if(serviceIDStr != null){
            try {
                int serviceID = Integer.parseInt(serviceIDStr);
                Service service = serviceDAO.getServiceByID(serviceID);
                request.setAttribute("service", service);
            } catch (NumberFormatException e) {
                List<String> errors = new ArrayList<>();
                errors.add("Dịch vụ có ID không hợp lệ.");
                request.setAttribute("errorMessages", errors);
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/Manager_JSP/manager-edit-service.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<String> errors = new ArrayList<>();

        String serviceIDStr = request.getParameter("serviceID");
        String serviceName = request.getParameter("serviceName");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String durationStr = request.getParameter("duration");
        Part filePart = request.getPart("serviceImage");
        String isActive = request.getParameter("isActive");
        String ageLimitIDStr = request.getParameter("ageLimit");
        String categoryIDStr = request.getParameter("category");
        String degreeIDStr = request.getParameter("degree");

        int serviceID = 0;
        try {
            serviceID = Integer.parseInt(serviceIDStr);
        } catch (NumberFormatException e) {
            errors.add("Invalid service ID.");
        }

        if (serviceName == null || serviceName.trim().isEmpty()
                || description == null || description.trim().isEmpty()
                || priceStr == null || priceStr.trim().isEmpty()
                || durationStr == null || durationStr.trim().isEmpty()
                || isActive == null || isActive.trim().isEmpty()
                || ageLimitIDStr == null || ageLimitIDStr.trim().isEmpty()
                || categoryIDStr == null || categoryIDStr.trim().isEmpty()
                || degreeIDStr == null || degreeIDStr.trim().isEmpty()) {
            errors.add("Các thông tin không được để trống hoặc khoảng trắng");
        }

        double price = 0;
        try {
            price = Double.parseDouble(priceStr);
            if(price < 100000){
                errors.add("Dịch vụ có giá tối thiểu là 100,000VNĐ");
            }
        } catch (NumberFormatException e) {
            errors.add("Sai format giá tiền");
        }

        int duration = 0;
        try {
            duration = Integer.parseInt(durationStr);
            if(duration < 10){
                errors.add("Thời gian khám tối thiểu là 10 phút");
            }
        } catch (NumberFormatException e) {
            errors.add("Sai format");
        }

        String serviceImage = null;
        ServiceDAO serviceDAO = new ServiceDAO();
        Service existingService = null;
        if(serviceID != 0){
            existingService = serviceDAO.getServiceByID(serviceID);
        }

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            filePart.write(uploadPath + File.separator + fileName);
            serviceImage = "uploads/" + fileName;
        } else {
            if(existingService != null){
                serviceImage = existingService.getServiceImage();
            }
        }

        if (!errors.isEmpty()) {
            request.setAttribute("errorMessages", errors);
            doGet(request, response);            
            return;
        }

        // Update the service using DAO's editService method
        serviceDAO.editService(
                serviceID,
                Integer.parseInt(categoryIDStr),
                Integer.parseInt(degreeIDStr),
                serviceName,
                description,
                price,
                duration,
                serviceImage,
                isActive.equalsIgnoreCase("Đang hoạt động"),
                Integer.parseInt(ageLimitIDStr)
        );

        response.sendRedirect(request.getContextPath() + "/manager/serviceslist");
    }
}