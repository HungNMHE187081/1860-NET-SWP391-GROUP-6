package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Prescription;

public class PrescriptionDAO extends DBContext {

    public int getUserIDfromChildren(int childrenID) {
        String sql = "SELECT CustomerID FROM Children WHERE ChildrenID = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, childrenID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("CustomerID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Return -1 if not found or an error occurs
    }

    public boolean hasDuplicatePrescription(int recordID, int medicineID, int prescriptionID) {
        String sql = "SELECT COUNT(*) FROM Prescriptions WHERE RecordID = ? AND MedicineID = ? AND PrescriptionID <> ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, recordID);
            pstmt.setInt(2, medicineID);
            pstmt.setInt(3, prescriptionID); // Exclude the current prescription ID
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Returns true if there is a duplicate prescription
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Returns false if an error occurs or if no duplicates are found
    }

    public boolean addPrescription(Prescription prescription) {
        String sql = "INSERT INTO Prescriptions (RecordID, MedicineID, Dosage, Frequency, Duration) VALUES (?, ?, ?, ?, ?)";
        try ( // Kết nối đến cơ sở dữ liệu
                PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, prescription.getRecordID());
            stmt.setInt(2, prescription.getMedicineID());
            stmt.setString(3, prescription.getDosage());
            stmt.setString(4, prescription.getFrequency());
            stmt.setString(5, prescription.getDuration());

            return stmt.executeUpdate() > 0; // Trả về true nếu có bản ghi được thêm vào
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi
        }
    }

    public boolean updatePrescription(int prescriptionID, int medicineID, String dosage, String frequency, String duration) {
        // Retrieve the RecordID associated with the prescription
        int recordID = getRecordIDByPrescriptionID(prescriptionID); // Implement this method to fetch the RecordID

        // Check if there is a duplicate prescription with the same medicine for the same record
        if (hasDuplicatePrescription(recordID, medicineID, prescriptionID)) {
            System.out.println("This medicine is already assigned to another prescription for this record.");
            return false; // Return false if a duplicate exists
        }

        // Update all prescriptions with the same recordID
        String sql = "UPDATE Prescriptions SET MedicineID = ?, Dosage = ?, Frequency = ?, Duration = ? WHERE RecordID = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, medicineID);
            pstmt.setString(2, dosage);
            pstmt.setString(3, frequency);
            pstmt.setString(4, duration);
            pstmt.setInt(5, recordID);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0; // Return true if the update was successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Return false in case of an error
        }
    }

    private int getRecordIDByPrescriptionID(int prescriptionID) {
        String sql = "SELECT RecordID FROM Prescriptions WHERE PrescriptionID = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, prescriptionID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("RecordID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Return -1 if not found or an error occurs
    }

    public boolean deletePrescription(int prescriptionID) {
        String SQL_DELETE = "DELETE FROM Prescriptions WHERE PrescriptionID = ?";
        try (PreparedStatement statement = connection.prepareStatement(SQL_DELETE)) {
            statement.setInt(1, prescriptionID);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Lấy danh sách đơn thuốc theo RecordID
    public List<Prescription> getPrescriptionsByRecordID(int recordID) throws SQLException {
        List<Prescription> prescriptions = new ArrayList<>();
        String sql = "SELECT * FROM Prescriptions WHERE RecordID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, recordID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Prescription prescription = new Prescription(
                            rs.getInt("PrescriptionID"),
                            rs.getInt("RecordID"),
                            rs.getInt("MedicineID"),
                            rs.getString("Dosage"),
                            rs.getString("Frequency"),
                            rs.getString("Duration")
                    );
                    prescriptions.add(prescription);
                }
            }
        }
        return prescriptions;
    }

    public List<Prescription> getAllPrescriptions(String search) {
        List<Prescription> prescriptions = new ArrayList<>();
        String SQL_SELECT_PRESCRIPTIONS
                = "SELECT p.PrescriptionID, mr.RecordID, p.MedicineID, "
                + "c.FirstName AS ChildFirstName, c.MiddleName AS ChildMiddleName, c.LastName AS ChildLastName, "
                + "u.UserID as UserID, u.FirstName AS UserFirstName, u.MiddleName AS UserMiddleName, u.LastName AS UserLastName, "
                + "mr.Diagnosis, m.Name AS MedicineName, s.StaffName, p.Dosage, p.Frequency, p.Duration "
                + "FROM Prescriptions p "
                + "JOIN MedicalRecords mr ON p.RecordID = mr.RecordID "
                + "JOIN Children c ON mr.ChildID = c.ChildID "
                + "JOIN Users u ON c.CustomerID = u.UserID "
                + "JOIN Medicine m ON p.MedicineID = m.MedicineID "
                + "JOIN Staff s ON mr.StaffID = s.StaffID "
                + "WHERE (CONCAT(c.FirstName, ' ', c.MiddleName, ' ', c.LastName) LIKE ? "
                + "OR CONCAT(u.FirstName, ' ', u.MiddleName, ' ', u.LastName) LIKE ?)";

        try (PreparedStatement statement = connection.prepareStatement(SQL_SELECT_PRESCRIPTIONS)) {
            // Kiểm tra và thiết lập giá trị cho tham số tìm kiếm.
            String searchPattern = (search == null || search.trim().isEmpty()) ? "%" : "%" + search.trim() + "%";
            statement.setString(1, searchPattern);
            statement.setString(2, searchPattern);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Prescription detail = new Prescription();
                    detail.setPrescriptionID(resultSet.getInt("PrescriptionID"));
                    detail.setRecordID(resultSet.getInt("RecordID"));
                    detail.setMedicineID(resultSet.getInt("MedicineID"));
                    detail.setUserID(resultSet.getInt("UserID"));
                    detail.setChildFirstName(resultSet.getString("ChildFirstName"));
                    detail.setChildMiddleName(resultSet.getString("ChildMiddleName"));
                    detail.setChildLastName(resultSet.getString("ChildLastName"));
                    detail.setUserFirstName(resultSet.getString("UserFirstName"));
                    detail.setUserMiddleName(resultSet.getString("UserMiddleName"));
                    detail.setUserLastName(resultSet.getString("UserLastName"));
                    detail.setDiagnosis(resultSet.getString("Diagnosis"));
                    detail.setMedicineName(resultSet.getString("MedicineName"));
                    detail.setStaffName(resultSet.getString("StaffName"));
                    detail.setDosage(resultSet.getString("Dosage"));
                    detail.setFrequency(resultSet.getString("Frequency"));
                    detail.setDuration(resultSet.getString("Duration"));

                    prescriptions.add(detail);
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace(); // Hoặc bạn có thể ghi log lỗi ở đây nếu cần
        } catch (Exception e) {
            System.err.println("Unexpected Error: " + e.getMessage());
            e.printStackTrace(); // Xử lý lỗi không mong đợi
        }

        return prescriptions;
    }

    public Prescription getPrescriptionById(int prescriptionId) {
        Prescription prescription = null;
        final String SQL_SELECT_PRESCRIPTION = "SELECT p.PrescriptionID, mr.RecordID, p.MedicineID, "
                + "c.FirstName AS ChildFirstName, c.MiddleName AS ChildMiddleName, c.LastName AS ChildLastName, "
                + "u.FirstName AS UserFirstName, u.MiddleName AS UserMiddleName, "
                + "u.LastName AS UserLastName, mr.Diagnosis, m.Name AS MedicineName, "
                + "s.StaffName, p.Dosage, p.Frequency, p.Duration "
                + "FROM Prescriptions p "
                + "JOIN MedicalRecords mr ON p.RecordID = mr.RecordID "
                + "JOIN Children c ON mr.ChildID = c.ChildID "
                + "JOIN Users u ON mr.StaffID = u.UserID "
                + "JOIN Medicine m ON p.MedicineID = m.MedicineID "
                + "JOIN Staff s ON mr.StaffID = s.StaffID "
                + "WHERE p.PrescriptionID = ?"; // Use parameterized query to prevent SQL injection

        try (PreparedStatement statement = connection.prepareStatement(SQL_SELECT_PRESCRIPTION)) {
            statement.setInt(1, prescriptionId); // Set the prescription ID parameter
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    prescription = new Prescription();
                    prescription.setPrescriptionID(resultSet.getInt("PrescriptionID"));
                    prescription.setRecordID(resultSet.getInt("RecordID"));
                    prescription.setMedicineID(resultSet.getInt("MedicineID"));
                    prescription.setChildFirstName(resultSet.getString("ChildFirstName"));
                    prescription.setChildMiddleName(resultSet.getString("ChildMiddleName"));
                    prescription.setChildLastName(resultSet.getString("ChildLastName"));
                    prescription.setUserFirstName(resultSet.getString("UserFirstName"));
                    prescription.setUserMiddleName(resultSet.getString("UserMiddleName"));
                    prescription.setUserLastName(resultSet.getString("UserLastName"));
                    prescription.setDiagnosis(resultSet.getString("Diagnosis"));
                    prescription.setMedicineName(resultSet.getString("MedicineName"));
                    prescription.setStaffName(resultSet.getString("StaffName"));
                    prescription.setDosage(resultSet.getString("Dosage"));
                    prescription.setFrequency(resultSet.getString("Frequency"));
                    prescription.setDuration(resultSet.getString("Duration"));
                }
            }
        } catch (SQLException e) {
            // Log the exception or handle it as needed
            e.printStackTrace();
        }

        return prescription; // Return null if not found
    }

    public boolean existsPrescription(int recordID, int medicineID) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Prescriptions WHERE recordID = ? AND medicineID = ? ";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, recordID);
            ps.setInt(2, medicineID);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // If count > 0, a prescription already exists
                }
            }
        }
        return false;
    }

}
