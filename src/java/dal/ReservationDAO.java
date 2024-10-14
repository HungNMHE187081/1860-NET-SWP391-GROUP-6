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
        String sql = "SELECT * FROM Reservations";
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
                list.add(new Reservation(ReservationID, OrderItemID, ReservationDate, StartTime, StaffID, isExam));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Reservation> getReservationByIsExam(boolean isExam) {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM Reservations WHERE IsExam = ?";
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
                    list.add(new Reservation(ReservationID, OrderItemID, ReservationDate, StartTime, StaffID, isExam));
                }
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Reservation getReservationByID(int ReservationID) {
        String sql = "SELECT * FROM Reservations WHERE ReservationID = ?";
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
                    return reservation;
                }
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Reservation> searchReservationByKeyword(String keyword, boolean isExam) {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT r.* FROM Reservations r "
                + "JOIN OrderItems oi ON r.OrderItemID = oi.OrderItemID "
                + "JOIN Orders o ON oi.OrderID = o.OrderID "
                + "JOIN Users u ON o.CustomerID = u.UserID "
                + "JOIN Children c ON oi.ChildID = c.ChildID "
                + "WHERE (u.FirstName LIKE ? OR u.MiddleName LIKE ? OR u.LastName LIKE ? OR c.FirstName LIKE ? OR c.MiddleName LIKE ? OR c.LastName LIKE ?) "
                + "AND r.IsExam = ?";
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
                    boolean isExamResult = rs.getBoolean("IsExam");
                    list.add(new Reservation(ReservationID, OrderItemID, ReservationDate, StartTime, StaffID, isExamResult));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Reservation> searchReservationsByTimeOfDay(String timeOfDay, boolean isExam) {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM Reservations WHERE StartTime BETWEEN ? AND ? AND isExam = ?";
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
                    list.add(new Reservation(ReservationID, OrderItemID, ReservationDate, StartTime, StaffID, isExam));
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
                + "AND r.IsExam = ?";
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
                    boolean isExamResult = rs.getBoolean("IsExam");
                    list.add(new Reservation(ReservationID, OrderItemID, ReservationDate, StartTime, StaffID, isExamResult));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        ReservationDAO dao = new ReservationDAO();
        System.out.println(dao.getReservationByIsExam(false).size());
    }
}
