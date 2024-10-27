package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Prescription;

public class PrescriptionDAO extends DBContext {

  public void addPrescription(Prescription prescription) {
  
    PreparedStatement insertStmt = null;
    PreparedStatement updateStmt = null;

    try {

        // Tắt auto-commit để dùng transaction
        connection.setAutoCommit(false);

        // Câu lệnh thêm đơn thuốc
        String insertSql = "INSERT INTO Prescriptions (RecordID, MedicineID, Dosage, Frequency, Duration) "
                         + "VALUES (?, ?, ?, ?, ?)";
        insertStmt = connection.prepareStatement(insertSql);
        insertStmt.setInt(1, prescription.getRecordID());
        insertStmt.setInt(2, prescription.getMedicineID());
        insertStmt.setString(3, prescription.getDosage());
        insertStmt.setString(4, prescription.getFrequency());
        insertStmt.setString(5, prescription.getDuration());

        // Thực thi thêm đơn thuốc
        insertStmt.executeUpdate();

        // Câu lệnh cập nhật hasPres = 1 trong MedicalRecords
        String updateSql = "UPDATE MedicalRecords SET hasPres = 1 WHERE RecordID = ?";
        updateStmt = connection.prepareStatement(updateSql);
        updateStmt.setInt(1, prescription.getRecordID());

        // Thực thi cập nhật
        updateStmt.executeUpdate();

        // Commit transaction nếu tất cả thành công
        connection.commit();
    } catch (SQLException e) {
        try {
            if (connection != null) {
                // Rollback nếu có lỗi
                connection.rollback();
            }
        } catch (SQLException rollbackEx) {
            System.err.println("Lỗi khi rollback: " + rollbackEx.getMessage());
        }
        System.err.println("Lỗi khi thêm đơn thuốc: " + e.getMessage());
    } finally {
        // Đóng các tài nguyên
        try {
            if (insertStmt != null) insertStmt.close();
            if (updateStmt != null) updateStmt.close();
            if (connection != null) connection.close();
        } catch (SQLException closeEx) {
            System.err.println("Lỗi khi đóng tài nguyên: " + closeEx.getMessage());
        }
    }
}



    // Cập nhật đơn thuốc
    public void updatePrescription(Prescription prescription) throws SQLException {
        String sql = "UPDATE Prescriptions SET MedicineID = ?, Dosage = ?, Frequency = ?, Duration = ? "
                + "WHERE PrescriptionID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, prescription.getMedicineID());
            ps.setString(2, prescription.getDosage());
            ps.setString(3, prescription.getFrequency());
            ps.setString(4, prescription.getDuration());
            ps.setInt(5, prescription.getPrescriptionID());
            ps.executeUpdate();
        }
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

    public List<Prescription> getAllPrescriptions() {
        List<Prescription> prescriptions = new ArrayList<>();
        final String SQL_SELECT_PRESCRIPTIONS = "SELECT p.PrescriptionID, mr.RecordID, p.MedicineID, "
                + "c.FirstName AS ChildFirstName, c.MiddleName AS ChildMiddleName, c.LastName AS ChildLastName, "
                + "u.FirstName AS UserFirstName, u.MiddleName AS UserMiddleName, "
                + "u.LastName AS UserLastName, mr.Diagnosis, m.Name AS MedicineName, "
                + "s.StaffName, p.Dosage, p.Frequency, p.Duration "
                + "FROM Prescriptions p "
                + "JOIN MedicalRecords mr ON p.RecordID = mr.RecordID "
                + "JOIN Children c ON mr.ChildID = c.ChildID "
                + "JOIN Users u ON mr.StaffID = u.UserID "
                + "JOIN Medicine m ON p.MedicineID = m.MedicineID "
                + "JOIN Staff s ON mr.StaffID = s.StaffID";

        try (PreparedStatement statement = connection.prepareStatement(SQL_SELECT_PRESCRIPTIONS); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Prescription detail = new Prescription();
                detail.setPrescriptionID(resultSet.getInt("PrescriptionID"));
                detail.setRecordID(resultSet.getInt("RecordID")); // New field
                detail.setMedicineID(resultSet.getInt("MedicineID")); // New field
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
        } catch (SQLException e) {
            // Log the exception or handle it as needed
            e.printStackTrace();
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

   public boolean existsPrescription(int recordID, int medicineID, String dosage, String frequency, String duration) throws SQLException {
    String query = "SELECT COUNT(*) FROM Prescriptions WHERE recordID = ? AND medicineID = ? AND dosage = ? AND frequency = ? AND duration = ?";
    try (PreparedStatement statement = connection.prepareStatement(query)) {
        statement.setInt(1, recordID);
        statement.setInt(2, medicineID);
        statement.setString(3, dosage);
        statement.setString(4, frequency);
        statement.setString(5, duration);

        try (ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt(1) > 0; // Return true if there's at least one record
            }
        }
    }
    return false; // No duplicate found
}
   


}
