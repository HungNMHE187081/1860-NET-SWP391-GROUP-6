/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import model.Order;
import model.OrderItem;

/**
 *
 * @author LENOVO
 */
public class OrderDAO extends DBContext {

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int OrderID = rs.getInt("OrderID");
                int CustomerID = rs.getInt("CustomerID");
                int Quantity = rs.getInt("Quantity");
                double TotalPrice = rs.getDouble("TotalPrice");
                String OrderDate = rs.getString("OrderDate");
                boolean isCheckOut = rs.getBoolean("isCheckOut");
                list.add(new Order(OrderID, CustomerID, Quantity, TotalPrice, OrderDate, isCheckOut));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Order> getAllCheckOutOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE isCheckOut = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int OrderID = rs.getInt("OrderID");
                int CustomerID = rs.getInt("CustomerID");
                int Quantity = rs.getInt("Quantity");
                double TotalPrice = rs.getDouble("TotalPrice");
                String OrderDate = rs.getString("OrderDate");
                boolean isCheckOut = rs.getBoolean("isCheckOut");
                list.add(new Order(OrderID, CustomerID, Quantity, TotalPrice, OrderDate, isCheckOut));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<OrderItem> getAllOrderItems() {
        List<OrderItem> list = new ArrayList<>();
        String sql = "SELECT * FROM OrderItems";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int OrderItemID = rs.getInt("OrderItemID");
                int OrderID = rs.getInt("OrderID");
                int ServiceID = rs.getInt("ServiceID");
                int ChildID = rs.getInt("ChildID");
                list.add(new OrderItem(OrderItemID, OrderID, ServiceID, ChildID));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
        public List<OrderItem> getOrderItemsByOrderID(int OrderID) {
        List<OrderItem> list = new ArrayList<>();
        String sql = "SELECT * FROM OrderItems WHERE OrderID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, OrderID);
            try(ResultSet rs = pre.executeQuery()){
            while (rs.next()) {
                int OrderItemID = rs.getInt("OrderItemID");
                int ServiceID = rs.getInt("ServiceID");
                int ChildID = rs.getInt("ChildID");
                list.add(new OrderItem(OrderItemID, OrderID, ServiceID, ChildID));
            }
            }
        } catch (SQLException e) {
        }
        return list;
    }
        
        public void addOrderItem(OrderItem orderItem){
            String sql = "";
        }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        System.out.println(dao.getAllOrders().size());
        System.out.println(dao.getAllCheckOutOrders().size());
        System.out.println(dao.getAllOrderItems().size());
        System.out.println(dao.getOrderItemsByOrderID(1).size());
    }
}
