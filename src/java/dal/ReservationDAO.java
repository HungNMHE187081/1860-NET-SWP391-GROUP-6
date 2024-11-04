/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import model.Reservation;

/**
 *
 * @author LENOVO
 */
public class ReservationDAO extends DBContext {

    public List<Reservation> getAllReservations() {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT o.OrderID, o.CustomerID, o.isCheckOut, "
                + "oi.OrderItemID, oi.ServiceID, oi.ChildID, "
                + "r.ReservationID, r.ReservationDate, r.StartTime, r.StaffID, r.isExam, r.hasRecord "
                + "FROM Orders o "
                + "JOIN OrderItems oi ON o.OrderID = oi.OrderID "
                + "JOIN Reservations r ON oi.OrderItemID = r.OrderItemID AND isCheckOut = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int ReservationID = rs.getInt("ReservationID");
                int OrderItemID = rs.getInt("OrderItemID");
                String ReservationDate = rs.getString("ReservationDate");
                String StartTime = rs.getString("StartTime");
                int StaffID = rs.getInt("StaffID");
                boolean isExam = rs.getBoolean("isExam");
                boolean hasRecord = rs.getBoolean("hasRecord");
                list.add(new Reservation(ReservationID, OrderItemID, ReservationDate, StartTime, StaffID, isExam, hasRecord));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Reservation> getReservationByIsExam(boolean isExam) {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT o.OrderID, o.CustomerID, o.isCheckOut, "
                + "oi.OrderItemID, oi.ServiceID, oi.ChildID, "
                + "r.ReservationID, r.ReservationDate, r.StartTime, r.StaffID, r.isExam, r.hasRecord "
                + "FROM Orders o "
                + "JOIN OrderItems oi ON o.OrderID = oi.OrderID "
                + "JOIN Reservations r ON oi.OrderItemID = r.OrderItemID "
                + "WHERE r.IsExam = ? AND isCheckOut = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, isExam);
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    int ReservationID = rs.getInt("ReservationID");
                    int OrderItemID = rs.getInt("OrderItemID");
                    String ReservationDate = rs.getString("ReservationDate");
                    int StaffID = rs.getInt("StaffID");
                    String StartTime = rs.getString("StartTime");
                    boolean hasRecord = rs.getBoolean("hasRecord");
                    list.add(new Reservation(ReservationID, OrderItemID, ReservationDate, StartTime, StaffID, isExam, hasRecord));
                }
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Reservation getReservationByID(int ReservationID) {
        String sql = "SELECT o.OrderID, o.CustomerID, o.isCheckOut, "
                + "oi.OrderItemID, oi.ServiceID, oi.ChildID, "
                + "r.ReservationID, r.ReservationDate, r.StartTime, r.StaffID, r.isExam, r.hasRecord "
                + "FROM Orders o "
                + "JOIN OrderItems oi ON o.OrderID = oi.OrderID "
                + "JOIN Reservations r ON oi.OrderItemID = r.OrderItemID "
                + "WHERE ReservationID = ? AND isCheckOut = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, ReservationID);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    Reservation reservation = new Reservation();
                    reservation.setReservationID(ReservationID);
                    reservation.setOrderItemID(rs.getInt("OrderItemID"));
                    reservation.setReservationDate(rs.getString("ReservationDate"));
                    reservation.setStartTime(rs.getString("StartTime"));
                    reservation.setStaffID(rs.getInt("StaffID"));
                    reservation.setIsExam(rs.getBoolean("IsExam"));
                    reservation.setHasRecord(rs.getBoolean("hasRecord"));
                    return reservation;
                }
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Reservation getReservationByID(int ServiceID, int ChildID) {
        String sql = "SELECT o.OrderID, o.CustomerID, o.isCheckOut, "
                + "oi.OrderItemID, oi.ServiceID, oi.ChildID, "
                + "r.ReservationID, r.ReservationDate, r.StartTime, r.StaffID, r.isExam, r.hasRecord "
                + "FROM Orders o "
                + "JOIN OrderItems oi ON o.OrderID = oi.OrderID "
                + "JOIN Reservations r ON oi.OrderItemID = r.OrderItemID "
                + "WHERE ServiceID = ? and ChildID = ? AND isCheckOut = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, ServiceID);
            pre.setInt(1, ChildID);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    Reservation reservation = new Reservation();
                    reservation.setReservationID(rs.getInt("ReservationID"));
                    reservation.setOrderItemID(rs.getInt("OrderItemID"));
                    reservation.setReservationDate(rs.getString("ReservationDate"));
                    reservation.setStartTime(rs.getString("StartTime"));
                    reservation.setStaffID(rs.getInt("StaffID"));
                    reservation.setIsExam(rs.getBoolean("IsExam"));
                    reservation.setHasRecord(rs.getBoolean("hasRecord"));
                    return reservation;
                }
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Reservation> getReservationByCustomerID(int CustomerID) {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT r.* FROM Reservations r "
                + "JOIN OrderItems oi ON r.OrderItemID = oi.OrderItemID "
                + "JOIN Orders o ON oi.OrderID = o.OrderID "
                + "JOIN Users u ON o.CustomerID = u.UserID "
                + "JOIN Children c ON oi.ChildID = c.ChildID "
                + "WHERE u.UserID = ? AND r.IsExam = 0 AND hasRecord = 0 AND isCheckOut = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, CustomerID);
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    int ReservationID = rs.getInt("ReservationID");
                    int OrderItemID = rs.getInt("OrderItemID");
                    String ReservationDate = rs.getString("ReservationDate");
                    String StartTime = rs.getString("StartTime");
                    int StaffID = rs.getInt("StaffID");
                    boolean isExam = rs.getBoolean("isExam");
                    boolean hasRecord = rs.getBoolean("hasRecord");
                    list.add(new Reservation(ReservationID, OrderItemID, ReservationDate, StartTime, StaffID, isExam, hasRecord));
                }
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Reservation> searchReservationByKeyword(String keyword, boolean isExam) {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT r.* FROM Reservations r "
                + "JOIN OrderItems oi ON r.OrderItemID = oi.OrderItemID "
                + "JOIN Orders o ON oi.OrderID = o.OrderID "
                + "JOIN Users u ON o.CustomerID = u.UserID "
                + "JOIN Children c ON oi.ChildID = c.ChildID "
                + "WHERE (u.FirstName LIKE ? OR u.MiddleName LIKE ? OR u.LastName LIKE ? OR c.FirstName LIKE ? OR c.MiddleName LIKE ? OR c.LastName LIKE ?) "
                + "AND r.IsExam = ? AND isCheckOut = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + keyword + "%");
            pre.setString(2, "%" + keyword + "%");
            pre.setString(3, "%" + keyword + "%");
            pre.setString(4, "%" + keyword + "%");
            pre.setString(5, "%" + keyword + "%");
            pre.setString(6, "%" + keyword + "%");
            pre.setBoolean(7, isExam);
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    int ReservationID = rs.getInt("ReservationID");
                    int OrderItemID = rs.getInt("OrderItemID");
                    String ReservationDate = rs.getString("ReservationDate");
                    String StartTime = rs.getString("StartTime");
                    int StaffID = rs.getInt("StaffID");
                    boolean hasRecord = rs.getBoolean("hasRecord");
                    list.add(new Reservation(ReservationID, OrderItemID, ReservationDate, StartTime, StaffID, isExam, hasRecord));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Reservation> searchReservationsByTimeOfDay(String timeOfDay, boolean isExam) {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT o.OrderID, o.CustomerID, o.isCheckOut, "
                + "oi.OrderItemID, oi.ServiceID, oi.ChildID, "
                + "r.ReservationID, r.ReservationDate, r.StartTime, r.StaffID, r.isExam, r.hasRecord "
                + "FROM Orders o "
                + "JOIN OrderItems oi ON o.OrderID = oi.OrderID "
                + "JOIN Reservations r ON oi.OrderItemID = r.OrderItemID "
                + "WHERE r.StartTime BETWEEN ? AND ? AND r.isExam = ? AND isCheckOut = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            if ("morning".equalsIgnoreCase(timeOfDay)) {
                pre.setString(1, "00:00:00");
                pre.setString(2, "11:59:59");
            } else if ("afternoon".equalsIgnoreCase(timeOfDay)) {
                pre.setString(1, "12:00:00");
                pre.setString(2, "23:59:59");
            } else {
                throw new IllegalArgumentException("Invalid time of day: " + timeOfDay);
            }
            pre.setBoolean(3, isExam);
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    int ReservationID = rs.getInt("ReservationID");
                    int OrderItemID = rs.getInt("OrderItemID");
                    String ReservationDate = rs.getString("ReservationDate");
                    String StartTime = rs.getString("StartTime");
                    int StaffID = rs.getInt("StaffID");
                    boolean hasRecord = rs.getBoolean("hasRecord");
                    list.add(new Reservation(ReservationID, OrderItemID, ReservationDate, StartTime, StaffID, isExam, hasRecord));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Reservation> searchReservationsByKeywordAndTimeOfDay(String keyword, String timeOfDay, boolean isExam) {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT r.* FROM Reservations r "
                + "JOIN OrderItems oi ON r.OrderItemID = oi.OrderItemID "
                + "JOIN Orders o ON oi.OrderID = o.OrderID "
                + "JOIN Users u ON o.CustomerID = u.UserID "
                + "JOIN Children c ON oi.ChildID = c.ChildID "
                + "WHERE (u.FirstName LIKE ? OR u.MiddleName LIKE ? OR u.LastName LIKE ? OR c.FirstName LIKE ? OR c.MiddleName LIKE ? OR c.LastName LIKE ?) "
                + "AND r.StartTime BETWEEN ? AND ? "
                + "AND r.IsExam = ? AND isCheckOut = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + keyword + "%");
            pre.setString(2, "%" + keyword + "%");
            pre.setString(3, "%" + keyword + "%");
            pre.setString(4, "%" + keyword + "%");
            pre.setString(5, "%" + keyword + "%");
            pre.setString(6, "%" + keyword + "%");
            if ("morning".equalsIgnoreCase(timeOfDay)) {
                pre.setString(7, "00:00:00");
                pre.setString(8, "11:59:59");
            } else if ("afternoon".equalsIgnoreCase(timeOfDay)) {
                pre.setString(7, "12:00:00");
                pre.setString(8, "23:59:59");
            } else {
                throw new IllegalArgumentException("Invalid time of day: " + timeOfDay);
            }
            pre.setBoolean(9, isExam);
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    int ReservationID = rs.getInt("ReservationID");
                    int OrderItemID = rs.getInt("OrderItemID");
                    String ReservationDate = rs.getString("ReservationDate");
                    String StartTime = rs.getString("StartTime");
                    int StaffID = rs.getInt("StaffID");
                    boolean hasRecord = rs.getBoolean("hasRecord");
                    list.add(new Reservation(ReservationID, OrderItemID, ReservationDate, StartTime, StaffID, isExam, hasRecord));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addReservation(Reservation reservation) {
        String sql = "INSERT INTO Reservations (OrderItemID, ReservationDate, StartTime, StaffID, isExam, hasRecord) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, reservation.getOrderItemID());
            ps.setString(2, reservation.getReservationDate());
            ps.setString(3, reservation.getStartTime());
            ps.setInt(4, reservation.getStaffID());
            ps.setBoolean(5, reservation.isIsExam());
            ps.setBoolean(6, reservation.isHasRecord());
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error in addReservation: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public void updateHasRecord(int ReservationID) {
        String sql = "UPDATE [dbo].[Reservations]\n"
                + "   SET [hasRecord] = 1\n"
                + " WHERE ReservationID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, ReservationID);
            pre.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void updateIsExamReservation(int ReservationID){
        String sql = "UPDATE [dbo].[Reservations]\n"
                + "   SET [isExam] = 1\n"
                + " WHERE ReservationID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, ReservationID);
            pre.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean hasTimeConflict(String reservationDate, String startTime, int staffID, int serviceDuration) {
        String sql = "SELECT COUNT(*) FROM Reservations r "
                + "JOIN OrderItems oi ON r.OrderItemID = oi.OrderItemID "
                + "JOIN Services s ON oi.ServiceID = s.ServiceID "
                + "WHERE r.ReservationDate = ? "  // Same date
                + "AND r.StaffID = ? "           // Same staff
                + "AND ("
                + "    (CAST(r.StartTime AS time) <= CAST(? AS time) "
                + "     AND DATEADD(MINUTE, s.Duration, CAST(r.StartTime AS time)) > CAST(? AS time))"
                + "    OR "
                + "    (CAST(r.StartTime AS time) < DATEADD(MINUTE, ?, CAST(? AS time)) "
                + "     AND CAST(r.StartTime AS time) >= DATEADD(MINUTE, -s.Duration, CAST(? AS time)))"
                + ")";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, reservationDate);
            ps.setInt(2, staffID);
            ps.setString(3, startTime);
            ps.setString(4, startTime);
            ps.setInt(5, serviceDuration);
            ps.setString(6, startTime);
            ps.setString(7, startTime);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Add a new method to check if staff is available
    public boolean isStaffAvailable(String reservationDate, String startTime, int staffID) {
        String sql = "SELECT COUNT(*) FROM Reservations "
                + "WHERE ReservationDate = ? "
                + "AND StaffID = ? "
                + "AND StartTime = ?";
                
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, reservationDate);
            ps.setInt(2, staffID);
            ps.setString(3, startTime);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) == 0; // Return true if no reservations found
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean hasChildTimeConflict(String reservationDate, String startTime, int childID, int serviceDuration) {
        String sql = "SELECT COUNT(*) FROM Reservations r "
                + "JOIN OrderItems oi ON r.OrderItemID = oi.OrderItemID "
                + "JOIN Services s ON oi.ServiceID = s.ServiceID "
                + "WHERE r.ReservationDate = ? "  // Same date
                + "AND oi.ChildID = ? "           // Same child
                + "AND ("
                // Case 1: New appointment starts during an existing appointment
                + "    (CAST(? AS time) >= CAST(r.StartTime AS time) "
                + "     AND CAST(? AS time) < DATEADD(MINUTE, s.Duration, CAST(r.StartTime AS time)))"
                // Case 2: New appointment ends during an existing appointment
                + "    OR "
                + "    (DATEADD(MINUTE, ?, CAST(? AS time)) > CAST(r.StartTime AS time) "
                + "     AND DATEADD(MINUTE, ?, CAST(? AS time)) <= DATEADD(MINUTE, s.Duration, CAST(r.StartTime AS time)))"
                // Case 3: New appointment completely contains an existing appointment
                + "    OR "
                + "    (CAST(? AS time) <= CAST(r.StartTime AS time) "
                + "     AND DATEADD(MINUTE, ?, CAST(? AS time)) >= DATEADD(MINUTE, s.Duration, CAST(r.StartTime AS time)))"
                + ")";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, reservationDate);
            ps.setInt(2, childID);
            // Case 1
            ps.setString(3, startTime);
            ps.setString(4, startTime);
            // Case 2
            ps.setInt(5, serviceDuration);
            ps.setString(6, startTime);
            ps.setInt(7, serviceDuration);
            ps.setString(8, startTime);
            // Case 3
            ps.setString(9, startTime);
            ps.setInt(10, serviceDuration);
            ps.setString(11, startTime);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        ReservationDAO dao = new ReservationDAO();
        System.out.println(dao.getReservationByCustomerID(4).size());
    }
}