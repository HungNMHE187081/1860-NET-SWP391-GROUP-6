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
        String sql = "SELECT * FROM Orders where isOrder = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int OrderID = rs.getInt("OrderID");
                int CustomerID = rs.getInt("CustomerID");
                int Quantity = rs.getInt("Quantity");
                double TotalPrice = rs.getDouble("TotalPrice");
                String OrderDate = rs.getString("OrderDate");
                boolean isOrder = rs.getBoolean("isOrder");
                boolean isCheckOut = rs.getBoolean("isCheckOut");
                list.add(new Order(OrderID, CustomerID, Quantity, TotalPrice, OrderDate, isOrder, isCheckOut));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Order> getAllOrderInCarts() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders where isOrder = 0";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int OrderID = rs.getInt("OrderID");
                int CustomerID = rs.getInt("CustomerID");
                int Quantity = rs.getInt("Quantity");
                double TotalPrice = rs.getDouble("TotalPrice");
                String OrderDate = rs.getString("OrderDate");
                boolean isOrder = rs.getBoolean("isOrder");
                boolean isCheckOut = rs.getBoolean("isCheckOut");
                list.add(new Order(OrderID, CustomerID, Quantity, TotalPrice, OrderDate, isOrder, isCheckOut));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Order> getAllCheckOutOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE isOrder = 1 and isCheckOut = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int OrderID = rs.getInt("OrderID");
                int CustomerID = rs.getInt("CustomerID");
                int Quantity = rs.getInt("Quantity");
                double TotalPrice = rs.getDouble("TotalPrice");
                String OrderDate = rs.getString("OrderDate");
                boolean isOrder = rs.getBoolean("isOrder");
                boolean isCheckOut = rs.getBoolean("isCheckOut");
                list.add(new Order(OrderID, CustomerID, Quantity, TotalPrice, OrderDate, isOrder, isCheckOut));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<OrderItem> getAllOrderItems() {
        List<OrderItem> list = new ArrayList<>();
        String sql = "SELECT o.OrderID, o.CustomerID, o.Quantity, o.TotalPrice, o.OrderDate, o.isOrder, o.isCheckOut, " +
                     "oi.OrderItemID, oi.ServiceID, oi.ChildID, " +
                     "c.FirstName, c.MiddleName, c.LastName, c.DateOfBirth, c.Gender, c.ChildImage " +
                     "FROM Orders o " +
                     "JOIN OrderItems oi ON o.OrderID = oi.OrderID " +
                     "JOIN Children c ON oi.ChildID = c.ChildID " +
                     "WHERE o.isOrder = 1";
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

    public Order getOrdersByOrderID(int OrderID) {
        Order order = new Order();
        String sql = "SELECT * FROM Orders WHERE OrderID = ? and isOrder = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, OrderID);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    order.setOrderID(OrderID);
                    order.setCustomerID(rs.getInt("CustomerID"));
                    order.setQuantity(rs.getInt("Quantity"));
                    order.setTotalPrice(rs.getDouble("TotalPrice"));
                    order.setOrderDate(rs.getString("OrderDate"));
                    order.setIsCheckOut(rs.getBoolean("isCheckOut"));
                    order.setIsOrder(rs.getBoolean("isOrder"));
                }
            }
        } catch (SQLException e) {
        }
        return order;
    }

    public List<OrderItem> getOrderItemsByOrderID(int OrderID) {
        List<OrderItem> list = new ArrayList<>();
        String sql = "SELECT o.OrderID, o.CustomerID, o.Quantity, o.TotalPrice, o.OrderDate, o.isOrder, o.isCheckOut, " +
                     "oi.OrderItemID, oi.ServiceID, oi.ChildID, " +
                     "c.FirstName, c.MiddleName, c.LastName, c.DateOfBirth, c.Gender, c.ChildImage " +
                     "FROM Orders o " +
                     "JOIN OrderItems oi ON o.OrderID = oi.OrderID " +
                     "JOIN Children c ON oi.ChildID = c.ChildID " +
                     "WHERE o.OrderID = ? AND o.isOrder = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, OrderID);
            try (ResultSet rs = pre.executeQuery()) {
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

    public OrderItem getOrderItemsByOrderItemID(int orderItemID) {
        OrderItem orderItem = new OrderItem();
        String sql = "SELECT o.OrderID, o.CustomerID, o.Quantity, o.TotalPrice, o.OrderDate, o.isOrder, o.isCheckOut, " +
                     "oi.OrderItemID, oi.ServiceID, oi.ChildID, " +
                     "c.FirstName, c.MiddleName, c.LastName, c.DateOfBirth, c.Gender, c.ChildImage " +
                     "FROM Orders o " +
                     "JOIN OrderItems oi ON o.OrderID = oi.OrderID " +
                     "JOIN Children c ON oi.ChildID = c.ChildID " +
                     "WHERE oi.OrderItemID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, orderItemID);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    orderItem.setOrderItemID(rs.getInt("OrderItemID"));
                    orderItem.setOrderID(rs.getInt("OrderID"));
                    orderItem.setServiceID(rs.getInt("ServiceID"));
                    orderItem.setChildID(rs.getInt("ChildID"));
                }
            }
        } catch (SQLException e) {
        }
        return orderItem;
    }

    public List<Order> getOrdersByCustomerID(int CustomerID) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE CustomerID = ? and isOrder = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, CustomerID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int OrderID = rs.getInt("OrderID");
                int Quantity = rs.getInt("Quantity");
                double TotalPrice = rs.getDouble("TotalPrice");
                String OrderDate = rs.getString("OrderDate");
                boolean isOrder = rs.getBoolean("isOrder");
                boolean isCheckOut = rs.getBoolean("isCheckOut");
                list.add(new Order(OrderID, CustomerID, Quantity, TotalPrice, OrderDate, isOrder, isCheckOut));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public List<Order> getOrdersInCartByCustomerID(int CustomerID) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE CustomerID = ? and isOrder = 0";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, CustomerID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int OrderID = rs.getInt("OrderID");
                int Quantity = rs.getInt("Quantity");
                double TotalPrice = rs.getDouble("TotalPrice");
                String OrderDate = rs.getString("OrderDate");
                boolean isOrder = rs.getBoolean("isOrder");
                boolean isCheckOut = rs.getBoolean("isCheckOut");
                list.add(new Order(OrderID, CustomerID, Quantity, TotalPrice, OrderDate, isOrder, isCheckOut));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        System.out.println(dao.getAllOrders().size());
        System.out.println(dao.getAllCheckOutOrders().size());
        System.out.println(dao.getAllOrderItems().size());
        System.out.println(dao.getOrderItemsByOrderID(1).size());
    }
}
