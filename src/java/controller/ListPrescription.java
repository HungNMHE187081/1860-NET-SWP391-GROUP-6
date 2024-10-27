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
        List<Prescription> listPre = dao.getAllPrescriptions();
        request.setAttribute("listPre", listPre);
        request.getRequestDispatcher("prescription-list.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
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
    public static void main(String[] args) {
        PrescriptionDAO dao = new PrescriptionDAO();
        List<Prescription> list = dao.getAllPrescriptions();
        System.out.println(list);
    }
}
