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
                boolean isExam = rs.getBoolean("isExam");
                list.add(new Reservation(ReservationID, OrderItemID, ReservationDate, StartTime, isExam));
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
                    String StartTime = rs.getString("StartTime");
                    list.add(new Reservation(ReservationID, OrderItemID, ReservationDate, StartTime, isExam));
                }
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static void main(String[] args) {
        ReservationDAO dao = new ReservationDAO();
        System.out.println(dao.getReservationByIsExam(false).size());
    }
}
