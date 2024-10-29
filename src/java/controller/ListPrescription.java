package controller;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MedicalRecord;
import model.Staff;
import model.Medicine;
import dal.MedicineDAO;
import dal.StaffDAO;
import model.MedicalRecordDAO;
import dal.ChildrenDAO;
import dal.UserDAO;
import dal.PrescriptionDAO;
import model.Children;
import model.Users;
import model.Prescription;

public class ListPrescription extends HttpServlet {
    private static final Logger logger = Logger.getLogger(ListPrescription.class.getName());

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        PrescriptionDAO dao = new PrescriptionDAO();

        // Retrieve the search parameter from the request
        String search = request.getParameter("search");
        if (search == null) search = "";  // Default to empty if no search query is provided

        // Retrieve the list of prescriptions based on the search input
        List<Prescription> listPre = dao.getAllPrescriptions(search);

        // Set the list as a request attribute and forward to the JSP
        request.setAttribute("listPre", listPre);
        request.getRequestDispatcher("/Staff_JSP/prescription-list.jsp").forward(request, response);
    } catch (Exception e) {
        e.printStackTrace();
    }
}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Use GET method for listing prescriptions
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for listing prescriptions";
    }

}
