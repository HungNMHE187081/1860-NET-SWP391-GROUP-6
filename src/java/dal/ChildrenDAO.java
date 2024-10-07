/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Children;

/**
 *
 * @author LENOVO
 */
public class ChildrenDAO extends DBContext{
    public Children getChildrenByID(int customerID){
        String sql = "select * from Children where CustomerID = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Children children = new Children();
                children.setChildID(rs.getInt("ChildID"));
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
    public static void main(String[] args) {
        Children c = new Children();
        int id = 1;
        ChildrenDAO dao = new ChildrenDAO();
        System.out.println(dao.getChildrenByID(id));
    }
}
