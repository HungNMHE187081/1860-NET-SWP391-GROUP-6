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
                int CustomerID = rs.getInt("CustomerID");
                int ChildID = rs.getInt("ChildID");
                int ServiceID = rs.getInt("ServiceID");
                String ReservationDate = rs.getString("ReservationDate");
                String StartTime = rs.getString("StartTime");
                boolean Status = rs.getBoolean("Status");
                boolean isExam = rs.getBoolean("isExam");
                list.add(new Reservation(ReservationID, CustomerID, ChildID, ServiceID, ReservationDate, StartTime, Status, isExam));
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
                if (rs.next()) {
                    int ReservationID = rs.getInt("ReservationID");
                    int CustomerID = rs.getInt("CustomerID");
                    int ChildID = rs.getInt("ChildID");
                    int ServiceID = rs.getInt("ServiceID");
                    String ReservationDate = rs.getString("ReservationDate");
                    String StartTime = rs.getString("StartTime");
                    boolean Status = rs.getBoolean("Status");
                    list.add(new Reservation(ReservationID, CustomerID, ChildID, ServiceID, ReservationDate, StartTime, Status, isExam));
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
