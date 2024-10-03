/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
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
    
    public static void main(String[] args) {
        SpecializationDAO dao = new SpecializationDAO();
        System.out.println(dao.getAllSpecializations().size());
    }
}
