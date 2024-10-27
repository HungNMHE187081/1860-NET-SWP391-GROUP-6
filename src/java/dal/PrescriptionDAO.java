package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Prescription;

public class PrescriptionDAO extends DBContext {

    // Thêm mới đơn thuốc
    public void addPrescription(Prescription prescription) throws SQLException {
        String sql = "INSERT INTO Prescriptions (RecordID, MedicineID, Dosage, Frequency, Duration) " +
                     "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, prescription.getRecordID());
            ps.setInt(2, prescription.getMedicineID());
            ps.setString(3, prescription.getDosage());
            ps.setString(4, prescription.getFrequency());
            ps.setString(5, prescription.getDuration());
            ps.executeUpdate();
        } 
    }

    // Cập nhật đơn thuốc
    public void updatePrescription(Prescription prescription) throws SQLException {
        String sql = "UPDATE Prescriptions SET MedicineID = ?, Dosage = ?, Frequency = ?, Duration = ? " +
                     "WHERE PrescriptionID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, prescription.getMedicineID());
            ps.setString(2, prescription.getDosage());
            ps.setString(3, prescription.getFrequency());
            ps.setString(4, prescription.getDuration());
            ps.setInt(5, prescription.getPrescriptionID());
            ps.executeUpdate();
        }
    }

    // Xóa đơn thuốc
    public void deletePrescription(int prescriptionID) throws SQLException {
        String sql = "DELETE FROM Prescriptions WHERE PrescriptionID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, prescriptionID);
            ps.executeUpdate();
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
}
