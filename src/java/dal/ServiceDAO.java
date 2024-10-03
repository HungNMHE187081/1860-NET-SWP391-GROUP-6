package dal;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Service;

public class ServiceDAO extends DBContext {

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public List<Service> getAllServices() {
        List<Service> listServices = new ArrayList<>();
        String sql = "SELECT * FROM Services";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Service service = new Service();
                service.setServiceID(rs.getInt("ServiceID"));
                service.setServiceName(rs.getString("ServiceName"));
                service.setCategoryID(rs.getInt("CategoryID"));
                service.setDegreeID(rs.getInt("DegreeID"));
                service.setDescription(rs.getString("Description"));
                service.setPrice(rs.getDouble("Price"));
                service.setDuration(rs.getInt("Duration"));
                service.setServiceImage(rs.getString("ServiceImage"));
                service.setIsActive(rs.getBoolean("IsActive"));
                service.setAgeLimitID(rs.getInt("AgeLimitID"));
                service.setCreatedAt(rs.getDate("CreatedAt") != null ? sdf.format(rs.getDate("CreatedAt")) : null);
                service.setUpdatedAt(rs.getDate("UpdatedAt") != null ? sdf.format(rs.getDate("UpdatedAt")) : null);

                listServices.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listServices;
    }

    public List<Service> searchServicesByKeyword(String keyword) {
        List<Service> listServices = new ArrayList<>();
        String sql = "SELECT * FROM Services WHERE serviceName LIKE ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + keyword + "%");
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    Service service = new Service();
                    service.setServiceID(rs.getInt("serviceID"));
                    service.setServiceName(rs.getString("serviceName"));
                    service.setCategoryID(rs.getInt("CategoryID"));
                    service.setDegreeID(rs.getInt("DegreeID"));
                    service.setDescription(rs.getString("description"));
                    service.setPrice(rs.getDouble("price"));
                    service.setDuration(rs.getInt("duration"));
                    service.setServiceImage(rs.getString("serviceImage"));
                    service.setIsActive(rs.getBoolean("isActive"));
                    service.setAgeLimitID(rs.getInt("ageLimitID"));
                    service.setCreatedAt(rs.getDate("CreatedAt") != null ? sdf.format(rs.getDate("CreatedAt")) : null);
                    service.setUpdatedAt(rs.getDate("UpdatedAt") != null ? sdf.format(rs.getDate("UpdatedAt")) : null);

                    listServices.add(service);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listServices;
    }

    public List<Service> searchServicesByAgeLimitID(int ageLimitID) {
        List<Service> listServices = new ArrayList<>();
        String sql = "SELECT * FROM Services WHERE ageLimitID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, ageLimitID);
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    Service service = new Service();
                    service.setServiceID(rs.getInt("serviceID"));
                    service.setServiceName(rs.getString("serviceName"));
                    service.setCategoryID(rs.getInt("CategoryID"));
                    service.setDegreeID(rs.getInt("DegreeID"));
                    service.setDescription(rs.getString("description"));
                    service.setPrice(rs.getDouble("price"));
                    service.setDuration(rs.getInt("duration"));
                    service.setServiceImage(rs.getString("serviceImage"));
                    service.setIsActive(rs.getBoolean("isActive"));
                    service.setAgeLimitID(rs.getInt("ageLimitID"));
                    service.setCreatedAt(rs.getDate("CreatedAt") != null ? sdf.format(rs.getDate("CreatedAt")) : null);
                    service.setUpdatedAt(rs.getDate("UpdatedAt") != null ? sdf.format(rs.getDate("UpdatedAt")) : null);

                    listServices.add(service);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listServices;
    }

    public List<Service> searchServicesByKeywordAndAgeLimit(String keyword, int ageLimitID) {
        List<Service> services = new ArrayList<>();
        String sql = "SELECT * FROM Services WHERE serviceName LIKE ? AND ageLimitID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + keyword + "%");
            pre.setInt(2, ageLimitID);
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    Service service = new Service();
                    service.setServiceID(rs.getInt("serviceID"));
                    service.setServiceName(rs.getString("serviceName"));
                    service.setCategoryID(rs.getInt("CategoryID"));
                    service.setDegreeID(rs.getInt("DegreeID"));
                    service.setDescription(rs.getString("description"));
                    service.setPrice(rs.getDouble("price"));
                    service.setDuration(rs.getInt("duration"));
                    service.setServiceImage(rs.getString("serviceImage"));
                    service.setIsActive(rs.getBoolean("isActive"));
                    service.setAgeLimitID(rs.getInt("ageLimitID"));
                    service.setCreatedAt(rs.getDate("CreatedAt") != null ? sdf.format(rs.getDate("CreatedAt")) : null);
                    service.setUpdatedAt(rs.getDate("UpdatedAt") != null ? sdf.format(rs.getDate("UpdatedAt")) : null);

                    services.add(service);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return services;
    }

    public void insertService(Service service) {
        String sql = "INSERT INTO [dbo].[Services]\n"
                + "           ([ServiceName]\n"
                + "           ,[CategoryID]\n"
                + "           ,[DegreeID]\n"
                + "           ,[Description]\n"
                + "           ,[Price]\n"
                + "           ,[Duration]\n"
                + "           ,[ServiceImage]\n"
                + "           ,[IsActive]\n"
                + "           ,[AgeLimitID]\n"
                + "           ,[CreatedAt]\n"
                + "           ,[UpdatedAt])\n"
                + "     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, GETDATE(), GETDATE())";
        try {
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, service.getServiceName());
            pre.setInt(2, service.getCategoryID());
            pre.setInt(3, service.getDegreeID());
            pre.setString(4, service.getDescription());
            pre.setDouble(5, service.getPrice());
            pre.setInt(6, service.getDuration());
            pre.setString(7, service.getServiceImage());
            pre.setBoolean(8, service.isIsActive());
            pre.setInt(9, service.getAgeLimitID());
            pre.executeUpdate();

            ResultSet rs = pre.getGeneratedKeys();
            if (rs.next()) {
                service.setServiceID(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error inserting service: " + e.getMessage());
        }
    }

    public Service getServiceByID(int serviceID) {
        String sql = "SELECT * FROM Services WHERE serviceID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, serviceID);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    Service service = new Service();
                    service.setServiceID(rs.getInt("serviceID"));
                    service.setServiceName(rs.getString("serviceName"));
                    service.setCategoryID(rs.getInt("CategoryID"));
                    service.setDegreeID(rs.getInt("DegreeID"));
                    service.setDescription(rs.getString("description"));
                    service.setPrice(rs.getDouble("price"));
                    service.setDuration(rs.getInt("duration"));
                    service.setServiceImage(rs.getString("serviceImage"));
                    service.setIsActive(rs.getBoolean("isActive"));
                    service.setAgeLimitID(rs.getInt("ageLimitID"));
                    service.setCreatedAt(rs.getDate("CreatedAt") != null ? sdf.format(rs.getDate("CreatedAt")) : null);
                    service.setUpdatedAt(rs.getDate("UpdatedAt") != null ? sdf.format(rs.getDate("UpdatedAt")) : null);

                    return service;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void editService(int serviceID, int categoryID, int degreeID,
            String serviceName, String description, double price,
            int duration, String serviceImage, boolean isActive,
            int ageLimitID, String createdAt, String updatedAt) {
        String sql = "UPDATE [dbo].[Services]\n"
                + "   SET [ServiceName] = ?\n"
                + "      ,[CategoryID] = ?\n"
                + "      ,[DegreeID] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Duration] = ?\n"
                + "      ,[ServiceImage] = ?\n"
                + "      ,[IsActive] = ?\n"
                + "      ,[AgeLimitID] = ?\n"
                + "      ,[CreatedAt] = ?\n"
                + "      ,[UpdatedAt] = ?\n"
                + " WHERE serviceID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, serviceName);
            pre.setInt(2, categoryID);
            pre.setInt(3, degreeID);
            pre.setString(4, description);
            pre.setDouble(5, price);
            pre.setInt(6, duration);
            pre.setString(7, serviceImage);
            pre.setBoolean(8, isActive);
            pre.setInt(9, ageLimitID);
            pre.setDate(10, createdAt != null ? Date.valueOf(createdAt) : null);
            pre.setDate(11, updatedAt != null ? Date.valueOf(updatedAt) : null);
            pre.setInt(12, serviceID);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteService(int ServiceID) {
        String sql = "DELETE FROM [Services]\n"
                + "WHERE ServiceID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, ServiceID);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ServiceDAO dao = new ServiceDAO();
        System.out.println(dao.getAllServices().size());
    }
}