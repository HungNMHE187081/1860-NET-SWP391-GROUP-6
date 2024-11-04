/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import model.OrderItem;

public class OrderItemDAO extends DBContext {
    
    public OrderItem getOrderItemById(int orderItemId) {
        String sql = "SELECT * FROM OrderItems WHERE OrderItemID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderItemId);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderItemID(rs.getInt("OrderItemID"));
                orderItem.setOrderID(rs.getInt("OrderID"));
                orderItem.setServiceID(rs.getInt("ServiceID"));
                orderItem.setChildID(rs.getInt("ChildID"));
                return orderItem;
            }
        } catch (SQLException e) {
            System.out.println("getOrderItemById error: " + e.getMessage());
        }
        return null;
    }
    
    public OrderItem getOrderItemByReservation(int reservationId) {
        String sql = "SELECT oi.* FROM OrderItems oi "
                  + "JOIN Reservations r ON oi.OrderItemID = r.OrderItemID "
                  + "WHERE r.ReservationID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, reservationId);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderItemID(rs.getInt("OrderItemID"));
                orderItem.setOrderID(rs.getInt("OrderID"));
                orderItem.setServiceID(rs.getInt("ServiceID"));
                orderItem.setChildID(rs.getInt("ChildID"));
                return orderItem;
            }
        } catch (SQLException e) {
            System.out.println("getOrderItemByReservation error: " + e.getMessage());
        }
        return null;
    }
    
    public boolean updateOrderItem(OrderItem orderItem) {
        String sql = "UPDATE OrderItems SET OrderID = ?, ServiceID = ?, ChildID = ? "
                  + "WHERE OrderItemID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderItem.getOrderID());
            st.setInt(2, orderItem.getServiceID());
            st.setInt(3, orderItem.getChildID());
            st.setInt(4, orderItem.getOrderItemID());
            
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("updateOrderItem error: " + e.getMessage());
            return false;
        }
    }
    
    public boolean deleteOrderItem(int orderItemId) {
        String sql = "DELETE FROM OrderItems WHERE OrderItemID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderItemId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("deleteOrderItem error: " + e.getMessage());
            return false;
        }
    }
}
