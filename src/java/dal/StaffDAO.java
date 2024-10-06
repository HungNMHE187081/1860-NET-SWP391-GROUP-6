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
            e.printStackTrace(); // In ra lỗi nếu có
        }
        return list;
    }

    public Staff getStaffByID(int StaffID){
        String sql = "SELECT * FROM Staff WHERE StaffID = ?";
        try{
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, StaffID);
            try (ResultSet rs = pre.executeQuery()){
             if (rs.next()){
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
        }
        catch(SQLException e){
            
        }
        return null;
    }
    
    public static void main(String[] args) {
        StaffDAO dao = new StaffDAO();
        System.out.println(dao.getAllStaffs().size());
    }
}
