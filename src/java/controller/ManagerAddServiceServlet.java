package controller;

import dal.AgeLimitDAO;
import dal.CategoryDAO;
import dal.DegreeDAO;
import dal.ServiceDAO;
import java.io.IOException;
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
public class ManagerAddServiceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String serviceName = request.getParameter("serviceName");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String durationStr = request.getParameter("duration");
        Part filePart = request.getPart("serviceImage");
        String isActive = request.getParameter("isActive");
        String ageLimitIDStr = request.getParameter("ageLimit");
        String categoryIDStr = request.getParameter("category");
        String degreeIDStr = request.getParameter("degree");
        
        List<String> errors = new ArrayList<>();
        double price = Double.parseDouble(priceStr);
        int duration = Integer.parseInt(durationStr);
        int ageLimitID = -1;
        int categoryID = -1;
        int degreeID = -1;

        AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
        List<AgeLimits> ageLimits = ageLimitDAO.getAllAgeLimits();

        for (AgeLimits ageLimit : ageLimits) {
            if (ageLimitIDStr.equals(ageLimit.getAgeLimit())) {
                ageLimitID = ageLimit.getAgeLimitID();
                break;
            }
        }

        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categories = categoryDAO.getAllCategories();

        for (Category category : categories) {
            if (categoryIDStr.equals(category.getCategoryName())) {
                categoryID = category.getCategoryID();
                break;
            }
        }

        DegreeDAO degreeDAO = new DegreeDAO();
        List<Degree> degrees = degreeDAO.getAllDegrees();

        for (Degree degree : degrees) {
            if (degreeIDStr.equals(degree.getDegreeName())) {
                degreeID = degree.getDegreeID();
                break;
            }
        }

        if (serviceName == null || serviceName.trim().isEmpty()
                || description == null || description.trim().isEmpty()
                || priceStr == null || priceStr.trim().isEmpty()
                || durationStr == null || durationStr.trim().isEmpty()
                || filePart == null || filePart.getSubmittedFileName().trim().isEmpty()
                || isActive == null || isActive.trim().isEmpty()
                || ageLimitIDStr == null || ageLimitIDStr.trim().isEmpty()
                || categoryIDStr == null || categoryIDStr.trim().isEmpty()
                || degreeIDStr == null || degreeIDStr.trim().isEmpty()) {
            errors.add("Các thông tin không được để trống hoặc khoảng trắng");
        }

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadDir = getServletContext().getRealPath("/") + "uploads";
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdir();
        }
        String filePath = uploadDir + File.separator + fileName;
        filePart.write(filePath);
        String img = "uploads" + File.separator + fileName;
        if(price < 100000){
            errors.add("Dịch vụ có giá tối thiểu là 100,000VNĐ");
        }
        if(duration < 10){
            errors.add("Thời gian khám tối thiểu là 10 phút");
        }
        if (!errors.isEmpty()) {
            request.setAttribute("errorMessages", errors);
            doGet(request, response);            
            return;
        }
        else{
        Service service = new Service();
        service.setServiceName(serviceName);
        service.setCategoryID(categoryID);
        service.setDegreeID(degreeID);
        service.setDescription(description);
        service.setPrice(price);
        service.setDuration(duration);
        service.setServiceImage(img);
        service.setIsActive(isActive.equals("Hoạt động"));
        service.setAgeLimitID(ageLimitID);

        ServiceDAO serviceDAO = new ServiceDAO();
        serviceDAO.insertService(service);

        response.sendRedirect(request.getContextPath() + "/manager/serviceslist");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
        List<AgeLimits> ageLimits = ageLimitDAO.getAllAgeLimits();
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categories = categoryDAO.getAllCategories();
        DegreeDAO degreeDAO = new DegreeDAO();
        List<Degree> degrees = degreeDAO.getAllDegrees();
        request.setAttribute("categories", categories);
        request.setAttribute("ageLimits", ageLimits);
        request.setAttribute("degrees", degrees);
        request.getRequestDispatcher("/Manager_JSP/manager-add-service.jsp").forward(request, response);
    }
}
