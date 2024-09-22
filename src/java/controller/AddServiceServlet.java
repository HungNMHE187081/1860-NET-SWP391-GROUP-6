package controller;

import dal.AgeLimitDAO;
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
import java.util.List;
import model.AgeLimits;
import model.Service;

@MultipartConfig
public class AddServiceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String serviceName = request.getParameter("serviceName");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String durationStr = request.getParameter("duration");
        Part filePart = request.getPart("serviceImage");
        String isActive = request.getParameter("isActive");
        String ageLimitIDStr = request.getParameter("ageLimit");

        double price = Double.parseDouble(priceStr);
        int duration = Integer.parseInt(durationStr);
        int ageLimitID = -1;

        AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
        List<AgeLimits> ageLimits = ageLimitDAO.getAllAgeLimits();

        for (AgeLimits ageLimit : ageLimits) {
            if (ageLimitIDStr.equals(ageLimit.getAgeLimit())) {
                ageLimitID = ageLimit.getAgeLimitID();
                break;
            }
        }
        
        if (serviceName == null || serviceName.trim().isEmpty() ||
            description == null || description.trim().isEmpty() ||
            priceStr == null || priceStr.trim().isEmpty() ||
            durationStr == null || durationStr.trim().isEmpty() ||
            filePart == null || filePart.getSubmittedFileName().trim().isEmpty() ||
            isActive == null || isActive.trim().isEmpty() ||
            ageLimitIDStr == null || ageLimitIDStr.trim().isEmpty()) {
            response.sendRedirect("manager-add-service.jsp");
            return;
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

        Service service = new Service();
        service.setServiceName(serviceName);
        service.setDescription(description);
        service.setPrice(price);
        service.setDuration(duration);
        service.setServiceImage(img);
        service.setIsActive(isActive.equals("Hoạt động"));
        service.setAgeLimitID(ageLimitID);

        ServiceDAO serviceDAO = new ServiceDAO();
        serviceDAO.insertService(service);

        response.sendRedirect("serviceslist");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AgeLimitDAO ageLimitDAO = new AgeLimitDAO();
        List<AgeLimits> ageLimits = ageLimitDAO.getAllAgeLimits();
        request.setAttribute("ageLimits", ageLimits);
        request.getRequestDispatcher("manager-add-service.jsp").forward(request, response);
    }
}