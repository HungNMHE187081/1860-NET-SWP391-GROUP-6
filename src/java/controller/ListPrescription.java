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
import java.util.ArrayList;
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

        // Create an instance of MedicalRecordDAO to fetch MedicalRecord data
        MedicalRecordDAO mDAO = new MedicalRecordDAO();

        // Tạo danh sách lưu trữ thông tin ngày khám tương ứng với từng đơn thuốc
        List<String> reservationDates = new ArrayList<>();

        // Loop through each prescription and get the corresponding medical record
        for (Prescription pres : listPre) {
            // Fetch MedicalRecord by recordID from each prescription
            MedicalRecord medicalRecord = mDAO.getMedicalRecordByID(pres.getRecordID());
            
            // Lưu reservationDate vào danh sách
            if (medicalRecord != null) {
                reservationDates.add(medicalRecord.getReservationDate().toString()); // Giả sử reservationDate là kiểu Date
            } else {
                reservationDates.add("N/A");  // Nếu không tìm thấy MedicalRecord
            }
        }

        // Đưa danh sách ngày khám vào request
        request.setAttribute("listPre", listPre);
        request.setAttribute("reservationDates", reservationDates);

        // Forward tới JSP
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
    public static void main(String[] args) {
         PrescriptionDAO dao = new PrescriptionDAO();
        List<Prescription> listPre = dao.getAllPrescriptions("");
        System.out.println(listPre);
    }
}