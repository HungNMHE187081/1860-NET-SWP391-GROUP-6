package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.statistics.*;

public class StatisticsDAO extends DBContext {
    
    public List<ServiceStatistics> getServiceStatistics() {
        List<ServiceStatistics> list = new ArrayList<>();
        String sql = "SELECT s.ServiceName, "
                + "COUNT(oi.OrderItemID) as BookingCount, "
                + "AVG(f.Rating) as AverageRating, "
                + "COUNT(DISTINCT oi.ChildID) as UniqueChildren "
                + "FROM Services s "
                + "LEFT JOIN OrderItems oi ON s.ServiceID = oi.ServiceID "
                + "LEFT JOIN Feedback f ON s.ServiceID = f.ServiceID "
                + "GROUP BY s.ServiceID, s.ServiceName";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ServiceStatistics stat = new ServiceStatistics(
                    rs.getString("ServiceName"),
                    rs.getInt("BookingCount"),
                    rs.getDouble("AverageRating"),
                    rs.getInt("UniqueChildren")
                );
                list.add(stat);
            }
        } catch (SQLException e) {
            System.out.println("getServiceStatistics: " + e.getMessage());
        }
        return list;
    }
    
    public List<StaffStatistics> getStaffStatistics() {
        List<StaffStatistics> list = new ArrayList<>();
        String sql = "SELECT "
                + "ISNULL(s.StaffName, 'Unknown') as StaffName, "
                + "COUNT(r.ReservationID) as TotalAppointments, "
                + "COUNT(DISTINCT oi.ServiceID) as UniqueServices, "
                + "ISNULL(AVG(CAST(f.Rating as FLOAT)), 0) as StaffRating "
                + "FROM StaffView s "
                + "LEFT JOIN Reservations r ON s.StaffID = r.StaffID "
                + "LEFT JOIN OrderItems oi ON r.OrderItemID = oi.OrderItemID "
                + "LEFT JOIN Feedback f ON oi.ServiceID = f.ServiceID "
                + "WHERE s.StaffName IS NOT NULL "
                + "GROUP BY s.StaffID, s.StaffName "
                + "HAVING COUNT(r.ReservationID) > 0";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                StaffStatistics stat = new StaffStatistics(
                    rs.getString("StaffName"),
                    rs.getInt("TotalAppointments"),
                    rs.getInt("UniqueServices"),
                    rs.getDouble("StaffRating")
                );
                System.out.println("Staff: " + stat.getStaffName() 
                    + ", Appointments: " + stat.getTotalAppointments()
                    + ", Services: " + stat.getUniqueServices()
                    + ", Rating: " + stat.getStaffRating());
                if (stat.getStaffName() != null && !stat.getStaffName().equals("Unknown")) {
                    list.add(stat);
                }
            }
        } catch (SQLException e) {
            System.out.println("getStaffStatistics error: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
    
    public List<ChildrenAgeStatistics> getChildrenAgeStatistics() {
        List<ChildrenAgeStatistics> list = new ArrayList<>();
        String sql = "SELECT " +
                     "DATEDIFF(YEAR, DateOfBirth, GETDATE()) as Age, " +
                     "COUNT(*) as ChildCount, " +
                     "CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() as DECIMAL(5,1)) as Percentage " +
                     "FROM Children " +
                     "GROUP BY DATEDIFF(YEAR, DateOfBirth, GETDATE()) " +
                     "ORDER BY Age";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                System.out.println("Age: " + rs.getInt("Age") + 
                                     ", Count: " + rs.getInt("ChildCount") + 
                                     ", Percentage: " + rs.getDouble("Percentage"));
                
                ChildrenAgeStatistics stat = new ChildrenAgeStatistics(
                    rs.getInt("Age"),
                    rs.getInt("ChildCount"),
                    rs.getDouble("Percentage")
                );
                list.add(stat);
            }
        } catch (SQLException e) {
            System.out.println("getChildrenAgeStatistics: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
    
    public List<CategoryStatistics> getCategoryStatistics() {
        List<CategoryStatistics> list = new ArrayList<>();
        String sql = "SELECT c.CategoryName, "
                + "COUNT(s.ServiceID) as ServiceCount "
                + "FROM Categories c "
                + "LEFT JOIN Services s ON c.CategoryID = s.CategoryID "
                + "GROUP BY c.CategoryID, c.CategoryName";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CategoryStatistics stat = new CategoryStatistics(
                    rs.getString("CategoryName"),
                    rs.getInt("ServiceCount")
                );
                list.add(stat);
            }
        } catch (SQLException e) {
            System.out.println("getCategoryStatistics: " + e.getMessage());
        }
        return list;
    }
    
    public List<FeedbackStatistics> getFeedbackStatistics() {
        List<FeedbackStatistics> list = new ArrayList<>();
        String sql = "SELECT Rating, COUNT(*) as RatingCount "
                + "FROM Feedback "
                + "GROUP BY Rating "
                + "ORDER BY Rating";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                FeedbackStatistics stat = new FeedbackStatistics(
                    rs.getInt("Rating"),
                    rs.getInt("RatingCount")
                );
                list.add(stat);
            }
        } catch (SQLException e) {
            System.out.println("getFeedbackStatistics: " + e.getMessage());
        }
        return list;
    }
    
    public List<MonthlyOrderStatistics> getMonthlyOrderStatistics() {
        List<MonthlyOrderStatistics> list = new ArrayList<>();
        String sql = "SELECT MONTH(OrderDate) as Month, "
                + "COUNT(*) as TotalOrders, "
                + "SUM(Quantity) as TotalServices "
                + "FROM Orders "
                + "GROUP BY MONTH(OrderDate) "
                + "ORDER BY Month";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                MonthlyOrderStatistics stat = new MonthlyOrderStatistics(
                    rs.getInt("Month"),
                    rs.getInt("TotalOrders"),
                    rs.getInt("TotalServices")
                );
                list.add(stat);
            }
        } catch (SQLException e) {
            System.out.println("getMonthlyOrderStatistics: " + e.getMessage());
        }
        return list;
    }
} 