/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */

import dal.DBContext;
import model.MedicalRecord;
import model.MedicalRecord;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;

public class MedicalRecordDAO extends DBContext {

    // Thêm medical record và cập nhật reservation
    public void addMedicalRecordAndUpdateReservation(MedicalRecord medicalRecord) throws SQLException {
        String insertSql = "INSERT INTO MedicalRecords (ChildID, StaffID, ReservationID, Diagnosis, Treatment, Notes, RecordDate) VALUES (?, ?, ?, ?, ?, ?, ?)";
        String updateSql = "UPDATE Reservations SET hasRecord = 1 WHERE ReservationID = ?";

        try (Connection connection = this.connection; 
             PreparedStatement insertStatement = connection.prepareStatement(insertSql);
             PreparedStatement updateStatement = connection.prepareStatement(updateSql)) {

            // Bắt đầu transaction
            connection.setAutoCommit(false);

            // Thêm medical record
            insertStatement.setInt(1, medicalRecord.getChildID());
            insertStatement.setInt(2, medicalRecord.getStaffID());
            insertStatement.setInt(3, medicalRecord.getReservationID());
            insertStatement.setString(4, medicalRecord.getDiagnosis());
            insertStatement.setString(5, medicalRecord.getTreatment());
            insertStatement.setString(6, medicalRecord.getNotes());
            insertStatement.setDate(7, medicalRecord.getRecordDate());
            insertStatement.executeUpdate();

            // Cập nhật reservation
            updateStatement.setInt(1, medicalRecord.getReservationID());
            updateStatement.executeUpdate();

            // Commit transaction
            connection.commit();

        } catch (SQLException e) {
            // Rollback nếu có lỗi
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            throw e; // Ném ngoại lệ ra ngoài
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

    // Cập nhật medical record
    public boolean updateMedicalRecord(MedicalRecord record) {
        String sql = "UPDATE MedicalRecords SET diagnosis = ?, treatment = ?, notes = ? WHERE recordID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, record.getDiagnosis());  
            ps.setString(2, record.getTreatment());  
            ps.setString(3, record.getNotes());      
            ps.setInt(4, record.getRecordID());      

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; 
        } catch (SQLException e) {
            e.printStackTrace();
            return false; 
        }
    }
      public List<MedicalRecord> getAllMedicalRecords(String childName, String month, boolean sortByDateAdded) {
    List<MedicalRecord> medicalRecords = new ArrayList<>();
    StringBuilder sql = new StringBuilder("""
            SELECT 
                mr.recordID, 
                mr.childID, 
                mr.staffID, 
                mr.reservationID, 
                mr.diagnosis, 
                mr.treatment, 
                mr.notes, 
                mr.recordDate, 
                r.reservationDate, 
                c.firstName AS firstNameChild, 
                c.middleName AS middleNameChild, 
                c.lastName AS lastNameChild, 
                c.childImage
            FROM 
                MedicalRecords mr
            JOIN 
                Children c ON mr.childID = c.childID
            LEFT JOIN 
                Reservations r ON mr.reservationID = r.reservationID
            WHERE 1=1
            """);

    if (childName != null && !childName.isEmpty()) {
        sql.append("AND (c.firstName LIKE ? OR c.middleName LIKE ? OR c.lastName LIKE ?) ");
    }

    if (month != null && !month.isEmpty()) {
        sql.append("AND MONTH(r.reservationDate) = ? "); // Giả định rằng bạn có trường reservationDate
    }

    // Thêm phần sắp xếp vào truy vấn
    if (sortByDateAdded) {
        sql.append("ORDER BY mr.recordID DESC "); // Sắp xếp theo ID giảm dần
    }

    try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
        int paramIndex = 1;

        if (childName != null && !childName.isEmpty()) {
            ps.setString(paramIndex++, "%" + childName + "%");
            ps.setString(paramIndex++, "%" + childName + "%");
            ps.setString(paramIndex++, "%" + childName + "%");
        }

        if (month != null && !month.isEmpty()) {
            ps.setInt(paramIndex++, Integer.parseInt(month));
        }

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                MedicalRecord record = new MedicalRecord(
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
                    rs.getDate("recordDate")
                );
                record.setReservationDate(rs.getDate("reservationDate"));
                medicalRecords.add(record);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
            }
    return medicalRecords;
        }

}
