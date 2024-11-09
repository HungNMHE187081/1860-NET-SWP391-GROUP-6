/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.text.SimpleDateFormat;
import model.Staff;

/**
 *
 * @author LENOVO
 */
public class StaffDAO extends DBContext {

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public List<Staff> getAllStaffs() {
        List<Staff> list = new ArrayList<>();
        String sql = "SELECT * FROM StaffView ";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int StaffID = rs.getInt("StaffID");
                String StaffName = rs.getString("StaffName");
                int YearsOfExperience = rs.getInt("YearsOfExperience");
                int SpecializationID = rs.getInt("SpecializationID");
                int DegreeID = rs.getInt("DegreeID");
                String HireDate = (rs.getDate("HireDate") != null) ? sdf.format(rs.getDate("HireDate")) : null;
                double Salary = rs.getDouble("Salary");
                list.add(new Staff(StaffID, StaffName, YearsOfExperience, SpecializationID, DegreeID, HireDate, Salary));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Staff getStaffByID(int StaffID) {
        String sql = "SELECT * FROM StaffView WHERE StaffID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, StaffID);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    Staff staff = new Staff();
                    staff.setStaffID(StaffID);
                    staff.setStaffName(rs.getString("StaffName"));
                    staff.setYearsOfExperience(rs.getInt("YearsOfExperience"));
                    staff.setSpecializationID(rs.getInt("SpecializationID"));
                    staff.setDegreeID(rs.getInt("DegreeID"));
                    staff.setHireDate(rs.getDate("HireDate") != null ? sdf.format(rs.getDate("HireDate")) : null);
                    staff.setSalary(rs.getDouble("Salary"));

                    return staff;
                }
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public List<Staff> searchStaffByKeyword(String keyword) {
        List<Staff> listStaff = new ArrayList<>();
        String sql = "SELECT * FROM StaffView WHERE StaffName LIKE ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + keyword + "%");
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    Staff staff = new Staff();
                    staff.setStaffID(rs.getInt("StaffID"));
                    staff.setStaffName(rs.getString("StaffName"));
                    staff.setYearsOfExperience(rs.getInt("YearsOfExperience"));
                    staff.setSpecializationID(rs.getInt("SpecializationID"));
                    staff.setDegreeID(rs.getInt("DegreeID"));
                    staff.setHireDate(rs.getDate("HireDate") != null ? sdf.format(rs.getDate("HireDate")) : null);
                    staff.setSalary(rs.getDouble("Salary"));

                    listStaff.add(staff);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listStaff;
    }

    public List<Staff> searchStaffBySpecializationID(int specializationID) {
        List<Staff> listStaff = new ArrayList<>();
        String sql = "SELECT * FROM StaffView WHERE SpecializationID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, specializationID);
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    Staff staff = new Staff();
                    staff.setStaffID(rs.getInt("StaffID"));
                    staff.setStaffName(rs.getString("StaffName"));
                    staff.setYearsOfExperience(rs.getInt("YearsOfExperience"));
                    staff.setSpecializationID(rs.getInt("SpecializationID"));
                    staff.setDegreeID(rs.getInt("DegreeID"));
                    staff.setHireDate(rs.getDate("HireDate") != null ? sdf.format(rs.getDate("HireDate")) : null);
                    staff.setSalary(rs.getDouble("Salary"));

                    listStaff.add(staff);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listStaff;
    }

    public List<Staff> searchStaffByKeywordAndSpecialization(String keyword, int specializationID) {
        List<Staff> listStaff = new ArrayList<>();
        String sql = "SELECT * FROM StaffView WHERE StaffName LIKE ? AND SpecializationID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + keyword + "%");
            pre.setInt(2, specializationID);
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    Staff staff = new Staff();
                    staff.setStaffID(rs.getInt("StaffID"));
                    staff.setStaffName(rs.getString("StaffName"));
                    staff.setYearsOfExperience(rs.getInt("YearsOfExperience"));
                    staff.setSpecializationID(rs.getInt("SpecializationID"));
                    staff.setDegreeID(rs.getInt("DegreeID"));
                    staff.setHireDate(rs.getDate("HireDate") != null ? sdf.format(rs.getDate("HireDate")) : null);
                    staff.setSalary(rs.getDouble("Salary"));

                    listStaff.add(staff);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listStaff;
    }

    public List<Staff> getStaffByDegreeID(int degreeID) {
        List<Staff> listStaff = new ArrayList<>();
        String sql = "SELECT * FROM StaffView WHERE DegreeID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, degreeID);
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    Staff staff = new Staff();
                    staff.setStaffID(rs.getInt("StaffID"));
                    staff.setStaffName(rs.getString("StaffName"));
                    staff.setYearsOfExperience(rs.getInt("YearsOfExperience"));
                    staff.setSpecializationID(rs.getInt("SpecializationID"));
                    staff.setDegreeID(rs.getInt("DegreeID"));
                    staff.setHireDate(rs.getDate("HireDate") != null ? sdf.format(rs.getDate("HireDate")) : null);
                    staff.setSalary(rs.getDouble("Salary"));

                    listStaff.add(staff);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listStaff;
    }

public void updateStaff(int staffID, int degreeID, int specializationID, int yearsOfExperience,
        String hireDate, double salary) throws SQLException {
    // Check if staff exists
    String checkSql = "SELECT COUNT(*) FROM Staff WHERE StaffID = ?";
    String insertSql = "INSERT INTO Staff (StaffID, DegreeID, SpecializationID, YearsOfExperience, HireDate, Salary) "
            + "VALUES (?, ?, ?, ?, ?, ?)";
    String updateSql = "UPDATE Staff SET "
            + "YearsOfExperience = ?, "
            + "SpecializationID = ?, "
            + "DegreeID = ?, "
            + "HireDate = ?, "
            + "Salary = ? "
            + "WHERE StaffID = ?";

    try {
        // Check if staff exists
        try (PreparedStatement checkStmt = connection.prepareStatement(checkSql)) {
            checkStmt.setInt(1, staffID);
            ResultSet rs = checkStmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);

            if (count == 0) {
                // Insert new staff
                try (PreparedStatement insertStmt = connection.prepareStatement(insertSql)) {
                    insertStmt.setInt(1, staffID);
                    insertStmt.setInt(2, degreeID);
                    insertStmt.setInt(3, specializationID);
                    insertStmt.setInt(4, yearsOfExperience);
                    insertStmt.setString(5, hireDate);
                    insertStmt.setDouble(6, salary);
                    insertStmt.executeUpdate();
                }
            } else {
                // Update existing staff
                try (PreparedStatement updateStmt = connection.prepareStatement(updateSql)) {
                    updateStmt.setInt(1, yearsOfExperience);
                    updateStmt.setInt(2, specializationID);
                    updateStmt.setInt(3, degreeID);
                    updateStmt.setString(4, hireDate);
                    updateStmt.setDouble(5, salary);
                    updateStmt.setInt(6, staffID);
                    updateStmt.executeUpdate();
                }
            }
        }
    } catch (SQLException e) {
        throw new SQLException("Error updating/inserting staff: " + e.getMessage());
    }
}
        public List<Staff> getAllStaff() {
      List<Staff> staffList = new ArrayList<>();
        String sql = "SELECT StaffID, StaffName FROM StaffView";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setStaffID(rs.getInt("StaffID"));
                staff.setStaffName(rs.getString("StaffName"));
                staffList.add(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffList;
    }
    
    public static void main(String[] args) {
        StaffDAO dao = new StaffDAO();
        System.out.println(dao.getStaffByDegreeID(1).size());
    }
}
