package controller;

import dal.MedicineDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Medicine;
import model.MedicineCategory;

public class HomeViewMedicineServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pageIndex = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        String categoryID = request.getParameter("category");
        String manufactureName = request.getParameter("manufacturer");
        String searchQuery = request.getParameter("search");
        String sort = request.getParameter("sort");

        MedicineDAO medicineDAO = new MedicineDAO();

        List<Medicine> medicineList = medicineDAO.getMedicines(pageIndex, 5, categoryID, manufactureName, searchQuery, sort);

        int totalMedicines = medicineDAO.getTotalMedicines(categoryID, manufactureName, searchQuery);

        int totalPages = (int) Math.ceil((double) totalMedicines / 5);

        HttpSession session = request.getSession();
        List<MedicineCategory> categories = medicineDAO.getAllCategories();
        session.setAttribute("categories", categories);

        request.setAttribute("medicineList", medicineList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("search", searchQuery);
        request.setAttribute("category", categoryID);
        request.setAttribute("manufacturer", manufactureName);
        request.setAttribute("sort", sort);

        // Forward the request to home-view-medicine.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Common_JSP/home-view-medicine.jsp");
        dispatcher.forward(request, response);
    }
}