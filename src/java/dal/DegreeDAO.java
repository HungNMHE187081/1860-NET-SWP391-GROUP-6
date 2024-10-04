/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
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
    
    public static void main(String[] args) {
        DegreeDAO dao = new DegreeDAO();
        System.out.println(dao.getAllDegrees().size());
    }
}
