/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.MedicalRecord;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Medicine;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
/**
 *
 * @author User
 */
public class MedicalRecordDAO extends DBContext{
    public void addMedicalRecordAndUpdateReservation(MedicalRecord medicalRecord) throws SQLException {
    String insertSql = "INSERT INTO MedicalRecords (ChildID, StaffID, ReservationID, Diagnosis, Treatment, Notes, RecordDate) VALUES (?, ?, ?, ?, ?, ?, ?)";
    String updateSql = "UPDATE Reservations SET hasRecord = 1 WHERE ReservationID = ?";

    try (Connection connection = this.connection; 
         PreparedStatement insertStatement = connection.prepareStatement(insertSql);
         PreparedStatement updateStatement = connection.prepareStatement(updateSql)) {

        // Bắt đầu transaction
        connection.setAutoCommit(false);

        // Thêm bản ghi vào bảng MedicalRecords
        insertStatement.setInt(1, medicalRecord.getChildID());
        insertStatement.setInt(2, medicalRecord.getStaffID());
        insertStatement.setInt(3, medicalRecord.getReservationID());
        insertStatement.setString(4, medicalRecord.getDiagnosis());
        insertStatement.setString(5, medicalRecord.getTreatment());
        insertStatement.setString(6, medicalRecord.getNotes());
        insertStatement.setDate(7, medicalRecord.getRecordDate());
        insertStatement.executeUpdate();
            ps.executeUpdate();
        }
        catch (SQLException e)
        {
            e.getNextException();
        }
    }

        // Cập nhật cột hasRecord trong bảng Reservations
        updateStatement.setInt(1, medicalRecord.getReservationID());
        updateStatement.executeUpdate();

        // Commit transaction
        connection.commit();
    } catch (SQLException e) {
        // Rollback transaction nếu có lỗi
        if (connection != null) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
    return medicalRecords;
        }
        throw e;
    } finally {
        // Đặt lại chế độ auto-commit
        if (connection != null) {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
 public MedicalRecord getMedicalRecordByID(int recordID) {
        MedicalRecord medicalRecord = null;
        String sql = "SELECT " +
                "mr.recordID, " +
                "mr.childID, " +
                "mr.staffID, " +
                "mr.reservationID, " +
                "mr.diagnosis, " +
                "mr.treatment, " +
                "mr.notes, " +
                "c.childImage, " +
                "c.firstName AS firstNameChild, " +
                "c.middleName AS middleNameChild, " +
                "c.lastName AS lastNameChild, " +
                "r.reservationDate, " +
                "mr.recordDate " +
                "FROM MedicalRecords mr " +
                "JOIN Children c ON mr.childID = c.childID " +
                "JOIN Reservations r ON mr.reservationID = r.reservationID " +
                "WHERE mr.recordID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, recordID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                medicalRecord = new MedicalRecord(
                        rs.getInt("recordID"),
                        rs.getInt("childID"),
                        rs.getInt("staffID"),
                        rs.getInt("reservationID"),
                        rs.getString("diagnosis"),
                        rs.getString("treatment"),
                        rs.getString("notes"),
                        rs.getString("childImage"),
                        rs.getString("firstNameChild"),
                        rs.getString("middleNameChild"),
                        rs.getString("lastNameChild"),
                        rs.getDate("reservationDate"),
                        rs.getDate("recordDate")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý ngoại lệ (có thể ghi log hoặc ném ra)
        }

        return medicalRecord;
    }
 public boolean updateMedicalRecord(MedicalRecord record) {
    String sql = "UPDATE MedicalRecords SET diagnosis = ?, treatment = ?, notes = ? WHERE recordID = ?";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        // Chỉ cập nhật các trường cho phép
        ps.setString(1, record.getDiagnosis());  // Cập nhật chẩn đoán
        ps.setString(2, record.getTreatment());   // Cập nhật phương pháp điều trị
        ps.setString(3, record.getNotes());       // Cập nhật ghi chú
        ps.setInt(4, record.getRecordID());       // Điều kiện WHERE để xác định bản ghi cần cập nhật

        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0; // Trả về true nếu cập nhật thành công
    } catch (SQLException e) {
        e.printStackTrace();
        return false; // Trả về false nếu có lỗi
    }
}

            }



