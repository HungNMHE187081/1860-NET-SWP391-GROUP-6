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
    
      public void addMedicalRecord(MedicalRecord medicalRecord) throws SQLException {
        String sql = "INSERT INTO MedicalRecords (ChildID, StaffID, ReservationID, Diagnosis, Treatment, Notes, RecordDate) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, medicalRecord.getChildID());
            statement.setInt(2, medicalRecord.getStaffID());
            statement.setInt(3, medicalRecord.getReservationID()); // Set reservationID
            statement.setString(4, medicalRecord.getDiagnosis());
            statement.setString(5, medicalRecord.getTreatment());
            statement.setString(6, medicalRecord.getNotes());
            statement.setDate(7, medicalRecord.getRecordDate());

            statement.executeUpdate();
        }
    }

}
