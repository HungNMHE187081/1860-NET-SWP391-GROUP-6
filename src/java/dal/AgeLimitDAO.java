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
                int AgeLimitID = rs.getInt("AgeLimitID");
                String AgeLimit = rs.getString("AgeLimit");
                list.add(new AgeLimits(AgeLimitID, AgeLimit));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public AgeLimits getAgeLimitByID(int AgeLimitID){
        String sql = "SELECT * FROM AgeLimits WHERE AgeLimitID = ?";
        try{
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, AgeLimitID);
            try (ResultSet rs = pre.executeQuery()){
                if (rs.next()){
                    AgeLimits ageLimits = new AgeLimits();
                    ageLimits.setAgeLimit(rs.getString("AgeLimit"));
                    return ageLimits;
                }
            }
        }
        catch (SQLException e){
            
        }
        return null;
    }
    
    public static void main(String[] args) {
        AgeLimitDAO dao = new AgeLimitDAO();
        System.out.println(dao.getAgeLimitByID(1).getAgeLimit());
    }
}
