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
        
        // Thay vì lấy một Prescription, lấy danh sách Prescription
        PrescriptionDAO pDAO = new PrescriptionDAO();
        List<Prescription> prescriptions = pDAO.getPrescriptionsByRecordID2(recordID);
        
        request.setAttribute("prescriptions", prescriptions); // Đặt danh sách đơn thuốc vào request
        request.setAttribute("children", children);
        request.setAttribute("medicineList", medicineList);
        request.setAttribute("record", record);
        request.setAttribute("staff", staff);
        request.getRequestDispatcher("/Staff_JSP/add-prescription.jsp").forward(request, response);
    } catch (Exception e) {
        log("Error retrieving medical record: " + e.getMessage());
        request.setAttribute("errorMessage", "Lỗi truy vấn dữ liệu.");
        request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
    }
}

private boolean isEmptyOrSpaces(String input) {
    return input == null || input.trim().isEmpty();
}


    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        // Lấy thông tin từ form
        int recordID = Integer.parseInt(request.getParameter("recordID"));
        String[] medicineIds = request.getParameterValues("medicineIds"); // Nhiều giá trị
        String dosage = request.getParameter("dosage");
        String frequency = request.getParameter("frequency");
        String duration = request.getParameter("duration");

        // Kiểm tra các trường không được để trống hoặc chỉ chứa dấu cách
        if (isEmptyOrSpaces(dosage) || isEmptyOrSpaces(frequency) || isEmptyOrSpaces(duration)) {
            // Chuyển hướng đến trang lỗi nếu phát hiện trường chỉ chứa dấu cách
            request.setAttribute("errorMessage", "Các trường nhập liệu không được để trống hoặc chỉ chứa khoảng trắng.");
            request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
            return;
        }

        // Kiểm tra xem Prescription đã tồn tại hay chưa
        PrescriptionDAO prescriptionDAO = new PrescriptionDAO();

        if (medicineIds != null) {
            boolean isMedicineSelected = false;

            // Duyệt qua các thuốc người dùng chọn
            for (String medicineID_raw : medicineIds) {
                int medicineID = Integer.parseInt(medicineID_raw);

                // Kiểm tra xem thuốc này đã có trong Prescription cho bệnh nhân này chưa
                if (prescriptionDAO.existsPrescription(recordID, medicineID)) {
                    continue; // Bỏ qua thuốc đã tồn tại trong Prescription
                }

                // Nếu có thuốc mới được chọn, thêm vào Prescription
                isMedicineSelected = true;
                Prescription prescription = new Prescription(recordID, medicineID, dosage, frequency, duration);
                prescriptionDAO.addPrescription(prescription);
            }

            // Nếu không có thuốc mới được chọn, báo lỗi
            if (!isMedicineSelected) {
                request.setAttribute("errorMessage", "Không có thuốc mới nào được chọn để thêm.");
                request.getRequestDispatcher("/Staff_JSP/error.jsp").forward(request, response);
                return;
            }
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
    public static void main(String[] args) {
        MedicineDAO medicineDAO = new MedicineDAO();
        List<Medicine> list = medicineDAO.getAllMedicines();
        for(Medicine m : list)
        {
            System.out.println(m);
        }
    }
}