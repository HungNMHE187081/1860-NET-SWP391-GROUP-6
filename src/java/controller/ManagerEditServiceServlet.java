package controller;

import dal.AgeLimitDAO;
import dal.CategoryDAO;
import dal.DegreeDAO;
import dal.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
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
        
        int serviceID = Integer.parseInt(request.getParameter("serviceID"));
        ServiceDAO serviceDAO = new ServiceDAO();
        Service service = serviceDAO.getServiceByID(serviceID);
        request.setAttribute("service", service);


        request.getRequestDispatcher("/Manager_JSP/manager-edit-service.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int serviceID = Integer.parseInt(request.getParameter("serviceID"));
        String serviceName = request.getParameter("serviceName");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        boolean isActive = request.getParameter("isActive").equals("Hoạt động");
        int ageLimitID = Integer.parseInt(request.getParameter("ageLimit"));
        int categoryID = Integer.parseInt(request.getParameter("category"));
        int degreeID = Integer.parseInt(request.getParameter("degree"));

        Part filePart = request.getPart("serviceImage");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String serviceImage = null;

        if (fileName != null && !fileName.isEmpty()) {
            String uploadDir = getServletContext().getRealPath("/") + "uploads";
            File uploadDirFile = new File(uploadDir);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdir();
            }
            String filePath = uploadDir + File.separator + fileName;
            filePart.write(filePath);
            serviceImage = "uploads" + File.separator + fileName;
        } else {
            // Nếu không có ảnh mới, giữ nguyên ảnh cũ
            ServiceDAO serviceDAO = new ServiceDAO();
            Service service = serviceDAO.getServiceByID(serviceID);
            serviceImage = service.getServiceImage();
        }

        ServiceDAO serviceDAO = new ServiceDAO();
        serviceDAO.editService(serviceID, categoryID, degreeID, serviceName, description, price, duration, serviceImage, isActive, ageLimitID);

        response.sendRedirect(request.getContextPath() + "/manager/serviceslist");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
