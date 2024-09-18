/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Service;

/**
 *
 * @author LENOVO
 */
public class ServiceDAO extends DBContext {

    public List<Service> getAllServices() {
        List<Service> listServices = new ArrayList<>();
        String sql = "SELECT * FROM Services";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int ServiceID = rs.getInt("ServiceID");
                String ServiceName = rs.getString("ServiceName"),
                        Description = rs.getString("Description");
                double Price = rs.getDouble("Price");
                int Duration = rs.getInt("Duration");
                String ServiceImage = rs.getString("ServiceImage");
                boolean IsActive = rs.getBoolean("IsActive");
                listServices.add(new Service(ServiceID, ServiceName, Description, Price, Duration, ServiceImage, IsActive));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listServices;
    }
    
    public static void main(String[] args) {
        ServiceDAO dao = new ServiceDAO();
        System.out.println(dao.getAllServices().size());
    }
}
