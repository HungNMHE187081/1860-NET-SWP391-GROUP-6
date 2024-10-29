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
        }
        return list;
    }

    public List<Specialization> getSpecializationsByUserId(int userId) {
        List<Specialization> specializations = new ArrayList<>();
        String sql = "SELECT * FROM Specializations WHERE UserID = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Specialization specialization = new Specialization();
                    specialization.setSpecializationID(rs.getInt("SpecializationID"));
                    specialization.setSpecializationName(rs.getString("SpecializationName"));
                    specializations.add(specialization);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return specializations;
    }
    
    public static void main(String[] args) {
        SpecializationDAO dao = new SpecializationDAO();
        System.out.println(dao.getAllSpecializations().size());
    }
}
