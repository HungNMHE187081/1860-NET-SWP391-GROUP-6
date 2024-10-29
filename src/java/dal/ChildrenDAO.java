/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Children;

/**
 *
 * @author LENOVO
 */
public class ChildrenDAO extends DBContext{
    
    public List<Children> getAllChildren(){
        List<Children> list = new ArrayList<>();
        String sql = "select * from Children";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ChildID = rs.getInt("ChildID");
                int CustomerID = rs.getInt("CustomerID");
                String FirstName = rs.getString("FirstName");
                String MiddleName = rs.getString("MiddleName");
                String LastName = rs.getString("LastName");
                Date DateOfBirth = rs.getDate("DateOfBirth");
                String Gender = rs.getString("Gender");
                String ChildImage = rs.getString("ChildImage");
                list.add(new Children(ChildID, CustomerID, FirstName, MiddleName, LastName, DateOfBirth, Gender, ChildImage));
            }
        } catch(SQLException e){
            
        }
        return list;
    }
    
    public Children getChildrenByID(int childID){
        String sql = "select * from Children where ChildID = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, childID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Children children = new Children();
                children.setChildID(childID);
                children.setCustomerID(rs.getInt("CustomerID"));
                children.setFirstName(rs.getString("FirstName"));
                children.setMiddleName(rs.getString("MiddleName"));
                children.setLastName(rs.getString("LastName"));
                children.setDateOfBirth(rs.getDate("DateOfBirth"));
                children.setGender(rs.getString("Gender"));
                children.setChildImage(rs.getString("ChildImage"));
                return children;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Children> getChildrenByCustomerID(int CustomerID){
        List<Children> list = new ArrayList<>();
        String sql = "select * from Children where CustomerID = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, CustomerID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ChildID = rs.getInt("ChildID");
                String FirstName = rs.getString("FirstName");
                String MiddleName = rs.getString("MiddleName");
                String LastName = rs.getString("LastName");
                Date DateOfBirth = rs.getDate("DateOfBirth");
                String Gender = rs.getString("Gender");
                String ChildImage = rs.getString("ChildImage");
                list.add(new Children(ChildID, CustomerID, FirstName, MiddleName, LastName, DateOfBirth, Gender, ChildImage));
            }
        } catch(SQLException e){
            
        }
        return list;
    }
    
    public static void main(String[] args) {
        Children c = new Children();
        int id = 1;
        ChildrenDAO dao = new ChildrenDAO();
        System.out.println(dao.getAllChildren().size());
    }
}
