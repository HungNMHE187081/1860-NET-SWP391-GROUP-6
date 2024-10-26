/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.ReservationHome;
/**
 *
 * @author User
 */
public class ReservationHomeDAO extends DBContext{
     public List<ReservationHome> getReservationsByStaffID(int staffID) {
    List<ReservationHome> reservations = new ArrayList<>();
    String query = "SELECT " +
            "u.FirstName AS CustomerFirstName, " +
            "u.MiddleName AS CustomerMiddleName, " +
            "u.LastName AS CustomerLastName, " +
            "c.FirstName AS ChildFirstName, " +
            "c.MiddleName AS ChildMiddleName, " +
            "c.LastName AS ChildLastName, " +
            "r.ReservationDate AS AppointmentDate, " +
            "s.ServiceName AS ServiceName, " +
            "r.StartTime AS AppointmentStartTime, " +
            "st.StaffName AS StaffName " +
            "FROM Reservations r " +
            "JOIN OrderItems oi ON r.OrderItemID = oi.OrderItemID " +
            "JOIN Orders o ON oi.OrderID = o.OrderID " +
            "JOIN Users u ON o.CustomerID = u.UserID " +
            "JOIN Children c ON oi.ChildID = c.ChildID " +
            "JOIN Services s ON oi.ServiceID = s.ServiceID " +
            "JOIN Staff st ON r.StaffID = st.StaffID " +
            "WHERE r.StaffID = ? AND DATE(r.ReservationDate) = CURDATE()";

    try (PreparedStatement statement = connection.prepareStatement(query)) {
        statement.setInt(1, staffID);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            ReservationHome reservation = new ReservationHome();
            reservation.setCustomerFirstName(resultSet.getString("CustomerFirstName"));
            reservation.setCustomerMiddleName(resultSet.getString("CustomerMiddleName"));
            reservation.setCustomerLastName(resultSet.getString("CustomerLastName"));
            reservation.setChildFirstName(resultSet.getString("ChildFirstName"));
            reservation.setChildMiddleName(resultSet.getString("ChildMiddleName"));
            reservation.setChildLastName(resultSet.getString("ChildLastName"));
            reservation.setAppointmentDate(resultSet.getDate("AppointmentDate"));
            reservation.setServiceName(resultSet.getString("ServiceName"));
            reservation.setAppointmentStartTime(resultSet.getString("AppointmentStartTime"));
            reservation.setStaffName(resultSet.getString("StaffName"));

            reservations.add(reservation);
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Handle exception appropriately
    }
    
    return reservations;
}

}
