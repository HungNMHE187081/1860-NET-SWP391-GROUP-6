package controller;

import dal.MedicineDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MedicalRecordDAO;
import model.MedicalRecord;
import dal.StaffDAO;
import model.Medicine;
import model.Staff;
import model.Children;
import dal.ChildrenDAO;
import dal.PrescriptionDAO;
import jakarta.servlet.http.HttpSession;
import model.Prescription;

public class AddPrescriptionServlet extends HttpServlet {
    private PrescriptionDAO prescriptionDAO;
    private MedicalRecordDAO medicalRecordDAO;
    private StaffDAO staffDAO;
    private MedicineDAO medicineDAO;
    private ChildrenDAO childrenDAO;

    @Override
    public void init() throws ServletException {
        prescriptionDAO = new PrescriptionDAO();
        medicalRecordDAO = new MedicalRecordDAO();
        staffDAO = new StaffDAO();
        medicineDAO = new MedicineDAO();
        childrenDAO = new ChildrenDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
        
        try {
            Integer recordID = (Integer) session.getAttribute("recordID"); // Lấy ID từ session
            MedicalRecord record = medicalRecordDAO.getMedicalRecordByID(recordID);
            Staff staff = staffDAO.getStaffByID(record.getStaffID());
            List<Medicine> medicineList = medicineDAO.getAllMedicines();
            Children children = childrenDAO.getChildrenByID(record.getChildID());

            request.setAttribute("children", children);
            request.setAttribute("medicineList", medicineList);
            request.setAttribute("record", record);
            request.setAttribute("staff", staff);
            request.getRequestDispatcher("/Staff_JSP/add-prescription.jsp").forward(request, response);
        } catch (Exception e) {
            log("Error retrieving medical record: " + e.getMessage());
            request.setAttribute("errorMessage", "Unable to retrieve medical record. Please try again.");
            request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
        }
    }
private boolean isEmptyOrSpaces(String input) {
    return input == null || input.trim().isEmpty();
}

     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy thông tin từ form
            int recordID = Integer.parseInt(request.getParameter("recordID"));
            String[] medicineIds = request.getParameterValues("medicineIds"); // Nhiều giá trị
            String dosage = request.getParameter("dosage");
            String frequency = request.getParameter("frequency");
            String duration = request.getParameter("duration");

                  for (String medicineID_raw : medicineIds) {
            int medicineID = Integer.parseInt(medicineID_raw);
            if (isEmptyOrSpaces(dosage) || isEmptyOrSpaces(frequency) || isEmptyOrSpaces(duration)) {
                // Chuyển hướng đến trang lỗi nếu phát hiện trường chỉ chứa dấu cách
                request.setAttribute("errorMessage", "Các trường nhập liệu không được để trống hoặc chỉ chứa khoảng trắng.");
                request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
                return;
            }
            // Check for existing prescription
            if (prescriptionDAO.existsPrescription(recordID, medicineID)) {
                request.setAttribute("errorMessage", "Loại thuốc này đã tồn tại trong lịch sử khám cho bệnh nhân này.");
                request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
                return;
            }

            // Create prescription object and add to the database
             Prescription prescription = new Prescription(recordID, Integer.parseInt(medicineID_raw), dosage, frequency, duration);
                prescriptionDAO.addPrescription(prescription);
        }
          
            // Chuyển hướng về trang danh sách đơn thuốc sau khi thêm thành công
            response.sendRedirect(request.getContextPath() + "/staff/listprescription");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi trong quá trình thêm đơn thuốc.");
            request.getRequestDispatcher("/staff/errorPage.jsp").forward(request, response);
        }
    }


    @Override
    public String getServletInfo() {
        return "Servlet for adding prescriptions";
    }
}