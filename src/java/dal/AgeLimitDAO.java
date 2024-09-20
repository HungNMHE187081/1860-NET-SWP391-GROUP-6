/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.AgeLimits;
import java.sql.*;

/**
 *
 * @author LENOVO
 */
public class AgeLimitDAO extends DBContext{
    public List<AgeLimits> getAllAgeLimits(){
        List<AgeLimits> list = new ArrayList<>();
        String sql = "SELECT * FROM AgeLimits";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                int ID = rs.getInt("ID");
                String AgeLimit = rs.getString("AgeLimit");
                list.add(new AgeLimits(ID, AgeLimit));
            }
        } catch (SQLException e) {
        }
        return list;
    }
}
