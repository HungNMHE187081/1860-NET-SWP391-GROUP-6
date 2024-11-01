/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Specialization;

/**
 *
 * @author LENOVO
 */
public class SpecializationDAO extends DBContext{
    public List<Specialization> getAllSpecializations(){
        List<Specialization> list = new ArrayList<>();
        String sql = "SELECT * FROM Specializations";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                int SpecializationID = rs.getInt("SpecializationID");
                String SpecializationName = rs.getString("SpecializationName");
                list.add(new Specialization(SpecializationID, SpecializationName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Specialization getSpecializationByStaffId(int staffId) {
        String sql = "SELECT s.* FROM Specializations s " +
                    "INNER JOIN Staff st ON s.SpecializationID = st.SpecializationID " +
                    "WHERE st.StaffID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, staffId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Specialization(
                    rs.getInt("SpecializationID"),
                    rs.getString("SpecializationName")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateStaffSpecialization(int staffId, int specializationId) {
        String sql = "UPDATE Staff SET SpecializationID = ? WHERE StaffID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, specializationId);
            stmt.setInt(2, staffId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addStaffSpecialization(int staffId, int specializationId) {
        // Kiểm tra xem staff đã tồn tại trong bảng Staff chưa
        String checkSql = "SELECT COUNT(*) FROM Staff WHERE StaffID = ?";
        try (PreparedStatement checkStmt = connection.prepareStatement(checkSql)) {
            checkStmt.setInt(1, staffId);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) {
                // Nếu chưa tồn tại, thêm mới
                String insertSql = "INSERT INTO Staff (StaffID, SpecializationID) VALUES (?, ?)";
                try (PreparedStatement insertStmt = connection.prepareStatement(insertSql)) {
                    insertStmt.setInt(1, staffId);
                    insertStmt.setInt(2, specializationId);
                    return insertStmt.executeUpdate() > 0;
                }
            } else {
                // Nếu đã tồn tại, cập nhật
                return updateStaffSpecialization(staffId, specializationId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        SpecializationDAO dao = new SpecializationDAO();
        System.out.println(dao.getAllSpecializations().size());
    }
}
