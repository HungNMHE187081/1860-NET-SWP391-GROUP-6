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
        }
        return list;
    }

    public List<Degree> getDegreesByUserId(int userId) {
        List<Degree> degrees = new ArrayList<>();
        String sql = "SELECT * FROM Degrees WHERE UserID = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Degree degree = new Degree();
                    degree.setDegreeID(rs.getInt("DegreeID"));
                    degree.setDegreeName(rs.getString("DegreeName"));
                    degrees.add(degree);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return degrees;
    }
    
    public static void main(String[] args) {
        DegreeDAO dao = new DegreeDAO();
        System.out.println(dao.getAllDegrees().size());
    }
}
