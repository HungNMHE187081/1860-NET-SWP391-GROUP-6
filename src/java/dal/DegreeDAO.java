/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Degree;

/**
 *
 * @author LENOVO
 */
public class DegreeDAO extends DBContext{
    public List<Degree> getAllDegrees(){
        List<Degree> list = new ArrayList<>();
        String sql = "SELECT * FROM Degrees";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                int DegreeID = rs.getInt("DegreeID");
                String DegreeName = rs.getString("DegreeName");
                list.add(new Degree(DegreeID, DegreeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Degree getDegreeByStaffId(int staffId) {
        String sql = "SELECT d.* FROM Degrees d " +
                    "INNER JOIN Staff s ON d.DegreeID = s.DegreeID " +
                    "WHERE s.StaffID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, staffId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Degree(
                    rs.getInt("DegreeID"),
                    rs.getString("DegreeName")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateStaffDegree(int staffId, int degreeId) {
        String sql = "UPDATE Staff SET DegreeID = ? WHERE StaffID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, degreeId);
            stmt.setInt(2, staffId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addStaffDegree(int staffId, int degreeId) {
        String checkSql = "SELECT COUNT(*) FROM Staff WHERE StaffID = ?";
        try (PreparedStatement checkStmt = connection.prepareStatement(checkSql)) {
            checkStmt.setInt(1, staffId);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) {
                String insertSql = "INSERT INTO Staff (StaffID, DegreeID) VALUES (?, ?)";
                try (PreparedStatement insertStmt = connection.prepareStatement(insertSql)) {
                    insertStmt.setInt(1, staffId);
                    insertStmt.setInt(2, degreeId);
                    return insertStmt.executeUpdate() > 0;
                }
            } else {
                return updateStaffDegree(staffId, degreeId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        DegreeDAO dao = new DegreeDAO();
        System.out.println(dao.getAllDegrees().size());
    }
}
