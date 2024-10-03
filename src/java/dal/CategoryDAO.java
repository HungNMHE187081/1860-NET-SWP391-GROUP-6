/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import model.Category;

/**
 *
 * @author LENOVO
 */
public class CategoryDAO extends DBContext{
    public List<Category> getAllCategories(){
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Categories";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                int CategoryID = rs.getInt("CategoryID");
                String CategoryName = rs.getString("CategoryName");
                list.add(new Category(CategoryID, CategoryName));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        System.out.println(dao.getAllCategories().size());
    }
}
