/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
        String sql = "SELECT r.*, oi.ServiceID, oi.ChildID, c.FirstName, c.MiddleName, c.LastName "
                + "FROM Reservations r "
                + "JOIN OrderItems oi ON r.OrderItemID = oi.OrderItemID "
                + "JOIN Orders o ON oi.OrderID = o.OrderID "
                + "JOIN Users u ON o.CustomerID = u.UserID "
                + "JOIN Children c ON oi.ChildID = c.ChildID "
                + "WHERE u.UserID = ? AND o.isCheckOut = 1 "
                + "ORDER BY r.ReservationDate ASC, r.StartTime ASC";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, CustomerID);
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    Reservation reservation = new Reservation();
                    reservation.setReservationID(rs.getInt("ReservationID"));
                    reservation.setOrderItemID(rs.getInt("OrderItemID"));
                    reservation.setReservationDate(rs.getString("ReservationDate"));
                    reservation.setStartTime(rs.getString("StartTime"));
                    reservation.setStaffID(rs.getInt("StaffID"));
                    reservation.setIsExam(rs.getBoolean("isExam"));
                    reservation.setHasRecord(rs.getBoolean("hasRecord"));
                    
                    // Thêm thông tin tên trẻ
                    String childName = rs.getString("FirstName");
                    if (rs.getString("MiddleName") != null) {
                        childName += " " + rs.getString("MiddleName");
                    }
                    childName += " " + rs.getString("LastName");
                    
                    System.out.println("Found reservation: ID=" + reservation.getReservationID() 
                        + ", Child=" + childName 
                        + ", Date=" + reservation.getReservationDate());
                    
                    list.add(reservation);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error in getReservationByCustomerID: " + e.getMessage());
            e.printStackTrace();
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

    public int addReservation(Reservation reservation) {
        String sql = "INSERT INTO Reservations (OrderItemID, ReservationDate, StartTime, StaffID, isExam, HasRecord) "
                    + "VALUES (?, ?, ?, ?, ?, ?); "
                    + "SELECT CAST(SCOPE_IDENTITY() AS INT) AS ReservationID;";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, reservation.getOrderItemID());
            st.setString(2, reservation.getReservationDate());
            st.setString(3, reservation.getStartTime());
            st.setInt(4, reservation.getStaffID());
            st.setBoolean(5, reservation.isIsExam());
            st.setBoolean(6, reservation.isHasRecord());

            System.out.println("Executing insert with values:");
            System.out.println("OrderItemID: " + reservation.getOrderItemID());
            System.out.println("Date: " + reservation.getReservationDate());
            System.out.println("Time: " + reservation.getStartTime());
            System.out.println("StaffID: " + reservation.getStaffID());
            System.out.println("isExam: " + reservation.isIsExam());

            st.executeUpdate();
            
            // Lấy ID vừa tạo
            try (ResultSet rs = st.getGeneratedKeys()) {
                if (rs.next()) {
                    int newId = rs.getInt(1);
                    System.out.println("Created reservation with ID: " + newId);
                    return newId;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error adding reservation: " + e.getMessage());
            e.printStackTrace();
        }
        return -1;
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

    public void updateIsExamReservation(int ReservationID) {
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
                + "WHERE r.ReservationDate = ? " // Same date
                + "AND r.StaffID = ? " // Same staff
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
                + "WHERE r.ReservationDate = ? " // Same date
                + "AND oi.ChildID = ? " // Same child
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

    public boolean updateStatus(int reservationId, String status) {
        String sql = "UPDATE Reservations SET Status = ? WHERE ReservationID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, reservationId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("updateStatus error: " + e.getMessage());
            return false;
        }
    }

    public static void main(String[] args) {
        ReservationDAO dao = new ReservationDAO();
        System.out.println(dao.getReservationByCustomerID(4).size());
    }

    public List<Map<String, Object>> getReservationsByCustomerID(int customerID) {
        List<Map<String, Object>> reservations = new ArrayList<>();
        String sql = "SELECT DISTINCT r.ReservationID, r.ReservationDate, r.StartTime, " +
                     "c.FirstName, c.MiddleName, c.LastName, " +
                     "s.Price as TotalPrice, " +
                     "o.CustomerID, " +
                     "CASE " +
                     "    WHEN p.PaymentStatus = 'SUCCESS' THEN 1 " +
                     "    ELSE 0 " +
                     "END as isCheckOut " +
                     "FROM Users u " +
                     "JOIN UserRoles ur ON u.UserID = ur.UserID " +
                     "JOIN Orders o ON u.UserID = o.CustomerID " +
                     "JOIN OrderItems oi ON o.OrderID = oi.OrderID " +
                     "JOIN Reservations r ON oi.OrderItemID = r.OrderItemID " +
                     "JOIN Children c ON oi.ChildID = c.ChildID " +
                     "JOIN Services s ON oi.ServiceID = s.ServiceID " +
                     "LEFT JOIN Payments p ON o.OrderID = p.OrderID " +
                     "WHERE u.UserID = ? " +
                     "AND r.ReservationDate >= GETDATE() " +
                     "AND (p.PaymentStatus = 'SUCCESS' OR o.isCheckOut = 1) " +
                     "ORDER BY r.ReservationDate ASC, r.StartTime ASC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customerID);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                Map<String, Object> reservation = new HashMap<>();
                reservation.put("reservationID", rs.getInt("ReservationID"));
                reservation.put("reservationDate", rs.getString("ReservationDate"));
                reservation.put("startTime", rs.getString("StartTime"));
                reservation.put("childName", rs.getString("FirstName") + " " + 
                              rs.getString("MiddleName") + " " + rs.getString("LastName"));
                reservation.put("totalPrice", rs.getDouble("TotalPrice"));
                reservation.put("isCheckOut", rs.getBoolean("isCheckOut"));
                reservations.add(reservation);
            }
        } catch (SQLException e) {
            System.out.println("Error in getReservationsByCustomerID: " + e.getMessage());
            e.printStackTrace();
        }
        return reservations;
    }

    public List<Reservation> getAllReservationsByCustomerID(int customerID) {
        List<Reservation> list = new ArrayList<>();
        String sql = """
            SELECT r.*, o.OrderID, o.CustomerID, o.TotalPrice, o.OrderDate, o.isCheckOut,
                   oi.ServiceID, oi.ChildID
            FROM Reservations r
            JOIN OrderItems oi ON r.OrderItemID = oi.OrderItemID
            JOIN Orders o ON oi.OrderID = o.OrderID
            WHERE o.CustomerID = ?
            AND (o.isCheckOut = 0 OR o.isCheckOut = 1)
            AND r.isExam = 0
            AND r.hasRecord = 0
            ORDER BY r.ReservationDate ASC, r.StartTime ASC
        """;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customerID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setReservationID(rs.getInt("ReservationID"));
                r.setOrderItemID(rs.getInt("OrderItemID"));

                // Chuyển đổi Date sang String
                Date reservationDate = rs.getDate("ReservationDate");
                Time startTime = rs.getTime("StartTime");

                // Format date và time thành String
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

                r.setReservationDate(dateFormat.format(reservationDate));
                r.setStartTime(timeFormat.format(startTime));

                r.setStaffID(rs.getInt("StaffID"));
                r.setIsExam(rs.getBoolean("isExam"));
                r.setHasRecord(rs.getBoolean("hasRecord"));
                list.add(r);

                // Debug log
                System.out.println("Found reservation: ID=" + r.getReservationID()
                        + ", Date=" + r.getReservationDate()
                        + ", Time=" + r.getStartTime());
            }
        } catch (SQLException e) {
            System.out.println("getAllReservationsByCustomerID error: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public Map<String, Object> getReservationDetailsByID(int reservationID) {
        System.out.println("=== getReservationDetailsByID START ===");
        Map<String, Object> details = new HashMap<>();

        String sql = """
            SELECT r.ReservationID, r.ReservationDate, r.StartTime, r.isExam,
                   o.OrderID, o.TotalPrice, o.isCheckOut,
                   c.FirstName as ChildFirstName, c.MiddleName as ChildMiddleName, c.LastName as ChildLastName,
                   s.ServiceName, s.Description, s.Price,
                   u.FirstName as StaffFirstName, u.LastName as StaffLastName,
                   u.Email as StaffEmail, u.PhoneNumber as StaffPhone
            FROM Reservations r
            JOIN OrderItems oi ON r.OrderItemID = oi.OrderItemID
            JOIN Orders o ON oi.OrderID = o.OrderID
            JOIN Children c ON oi.ChildID = c.ChildID
            JOIN Services s ON oi.ServiceID = s.ServiceID
            LEFT JOIN Staff st ON r.StaffID = st.StaffID
            LEFT JOIN Users u ON st.StaffID = u.UserID
            WHERE r.ReservationID = ?
        """;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, reservationID);
            System.out.println("Executing query for ID: " + reservationID);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                // Thông tin cơ bản
                details.put("reservationID", rs.getInt("ReservationID"));

                // Format date and time
                java.sql.Date reservationDate = rs.getDate("ReservationDate");
                java.sql.Time startTime = rs.getTime("StartTime");
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

                details.put("reservationDate", dateFormat.format(reservationDate));
                details.put("startTime", timeFormat.format(startTime));

                // Child info
                String childName = rs.getString("ChildFirstName");
                if (rs.getString("ChildMiddleName") != null) {
                    childName += " " + rs.getString("ChildMiddleName");
                }
                childName += " " + rs.getString("ChildLastName");
                details.put("childName", childName);

                // Service info
                details.put("serviceName", rs.getString("ServiceName"));
                details.put("serviceDescription", rs.getString("Description"));
                details.put("totalPrice", rs.getDouble("TotalPrice"));

                // Staff info
                String staffName = "";
                if (rs.getString("StaffFirstName") != null) {
                    staffName = rs.getString("StaffFirstName") + " " + rs.getString("StaffLastName");
                }
                details.put("staffName", staffName);
                details.put("staffEmail", rs.getString("StaffEmail"));
                details.put("staffPhone", rs.getString("StaffPhone"));

                details.put("isCheckOut", rs.getBoolean("isCheckOut"));
                details.put("isExam", rs.getBoolean("isExam"));

                System.out.println("Found details: " + details);
            } else {
                System.out.println("No reservation found with ID: " + reservationID);
            }

        } catch (SQLException e) {
            System.out.println("ERROR in getReservationDetailsByID: " + e.getMessage());
            e.printStackTrace();
        }

        System.out.println("=== getReservationDetailsByID END ===");
        return details;
    }

    public int getLastReservationId() {
        String sql = "SELECT TOP 1 ReservationID FROM Reservations ORDER BY ReservationID DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("ReservationID");
            }
        } catch (SQLException e) {
            System.out.println("Error getting last reservation ID: " + e.getMessage());
            e.printStackTrace();
        }
        return -1;
    }

    public Reservation getReservationById(int reservationId) {
        String sql = "SELECT * FROM Reservations WHERE ReservationID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, reservationId);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setReservationID(rs.getInt("ReservationID"));
                reservation.setOrderItemID(rs.getInt("OrderItemID"));
                reservation.setReservationDate(rs.getString("ReservationDate"));
                reservation.setStartTime(rs.getString("StartTime"));
                reservation.setStaffID(rs.getInt("StaffID"));
                reservation.setIsExam(rs.getBoolean("isExam"));
                reservation.setHasRecord(rs.getBoolean("HasRecord"));
                return reservation;
            }
        } catch (SQLException e) {
            System.out.println("Error getting reservation by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}
