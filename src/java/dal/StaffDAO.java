/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import model.Staff;

/**
 *
 * @author LENOVO
 */
public class StaffDAO extends DBContext {

    public List<Staff> getAllStaffs() {
        List<Staff> list = new ArrayList<>();
        String sql = "SELECT s.StaffID, u.FirstName + ' ' + u.MiddleName + ' ' + u.LastName AS StaffName, " +
                     "s.YearsOfExperience, SpecializationID, DegreeID, s.HireDate, s.Salary " +
                     "FROM Staff s " +
                     "JOIN Users u ON s.StaffID = u.UserID ";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int StaffID = rs.getInt("StaffID");
                String StaffName = rs.getString("StaffName");
                int YearsOfExperience = rs.getInt("YearsOfExperience");
                int SpecializationID = rs.getInt("SpecializationID");
                int DegreeID = rs.getInt("DegreeID");
                String HireDate = rs.getString("HireDate");
                double Salary = rs.getDouble("Salary");
                list.add(new Staff(StaffID, StaffName, YearsOfExperience, SpecializationID, DegreeID, HireDate, Salary));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void addStaff(Staff staff) {

    }

    public static void main(String[] args) {
        StaffDAO dao = new StaffDAO();
        System.out.println(dao.getAllStaffs().size());
    }
}
