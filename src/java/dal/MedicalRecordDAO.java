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
    }
}
}
