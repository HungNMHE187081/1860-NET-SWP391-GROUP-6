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
                String ServiceName = rs.getString("ServiceName");
                String Description = rs.getString("Description");
                double Price = rs.getDouble("Price");
                int Duration = rs.getInt("Duration");
                String ServiceImage = rs.getString("ServiceImage");
                boolean IsActive = rs.getBoolean("IsActive");
                int AgeLimitID = rs.getInt("AgeLimitID");
                listServices.add(new Service(ServiceID, ServiceName, Description, Price, Duration, ServiceImage, IsActive, AgeLimitID));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listServices;
    }

    public void insertService(Service service) {
        String sql = "INSERT INTO Services ([ServiceName]\n"
                + "           ,[Description]\n"
                + "           ,[Price]\n"
                + "           ,[Duration]\n"
                + "           ,[ServiceImage]\n"
                + "           ,[IsActive],"
                + "            ,[AgeLimitID] ) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, service.getServiceName());
            pre.setString(2, service.getDescription());
            pre.setDouble(3, service.getPrice());
            pre.setInt(4, service.getDuration());
            pre.setString(5, service.getServiceImage());
            pre.setBoolean(6, service.isIsActive());
            pre.setInt(7, service.getAgeLimitID());
            pre.executeUpdate();
            ResultSet rs = pre.getGeneratedKeys();
            if (rs.next()) {
                service.setServiceID(rs.getInt(1));
            }
        } catch (SQLException e) {
        }
    }

    public void deleteService(int ServiceID) {
        String sql = "DELETE FROM [Services]\n"
                + "WHERE ServiceID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        ServiceDAO dao = new ServiceDAO();
//        dao.insertService(new Service(0, "Tư vấn về chăm sóc trẻ sơ sinh", "Nhân viên thực hiện: Bác sĩ\nTiêm các loại vắc xin theo lịch tiêm chủng, theo dõi phản ứng sau tiêm", 200000, 60, "", false, 1));
        System.out.println(dao.getAllServices().size());
    }
}
