/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
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
    
    public List<Order> getAllOrderInCarts() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders where isCheckOut = 0";
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
        String sql = "SELECT o.OrderID, o.CustomerID, o.Quantity, o.TotalPrice, o.OrderDate, o.isCheckOut, " +
                     "oi.OrderItemID, oi.ServiceID, oi.ChildID, " +
                     "c.FirstName, c.MiddleName, c.LastName, c.DateOfBirth, c.Gender, c.ChildImage " +
                     "FROM Orders o " +
                     "JOIN OrderItems oi ON o.OrderID = oi.OrderID " +
                     "JOIN Children c ON oi.ChildID = c.ChildID ";
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
        String sql = "SELECT * FROM Orders WHERE OrderID = ?";
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
                }
            }
        } catch (SQLException e) {
        }
        return order;
    }

    public List<OrderItem> getOrderItemsByOrderID(int OrderID) {
        List<OrderItem> list = new ArrayList<>();
        String sql = "SELECT o.OrderID, o.CustomerID, o.Quantity, o.TotalPrice, o.OrderDate, o.isCheckOut, " +
                     "oi.OrderItemID, oi.ServiceID, oi.ChildID, " +
                     "c.FirstName, c.MiddleName, c.LastName, c.DateOfBirth, c.Gender, c.ChildImage " +
                     "FROM Orders o " +
                     "JOIN OrderItems oi ON o.OrderID = oi.OrderID " +
                     "JOIN Children c ON oi.ChildID = c.ChildID " +
                     "WHERE o.OrderID = ?";
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

    public List<OrderItem> getCheckOutOrderItemsByCustomerID(int CustomerID) {
        List<OrderItem> list = new ArrayList<>();
        String sql = "SELECT o.OrderID, o.CustomerID, o.Quantity, o.TotalPrice, o.OrderDate, o.isCheckOut, " +
                     "oi.OrderItemID, oi.ServiceID, oi.ChildID, " +
                     "c.FirstName, c.MiddleName, c.LastName, c.DateOfBirth, c.Gender, c.ChildImage " +
                     "FROM Orders o " +
                     "JOIN OrderItems oi ON o.OrderID = oi.OrderID " +
                     "JOIN Children c ON oi.ChildID = c.ChildID " +
                     "WHERE o.CustomerID = ? AND isCheckOut = 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, CustomerID);
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    int OrderID = rs.getInt("OrderID");
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
        String sql = "SELECT o.OrderID, o.CustomerID, o.Quantity, o.TotalPrice, o.OrderDate, o.isCheckOut, " +
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
        String sql = "SELECT * FROM Orders WHERE CustomerID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, CustomerID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int OrderID = rs.getInt("OrderID");
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
    
    public List<Order> getOrdersInCartByCustomerID(int CustomerID) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE isCheckOut = 0 and CustomerID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, CustomerID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int OrderID = rs.getInt("OrderID");
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
    
    public List<Order> getCheckOutOrdersByCustomerID(int CustomerID) {
        List<Order> list = new ArrayList<>();
        String sql = """
            SELECT DISTINCT o.OrderID, o.CustomerID, o.Quantity, o.TotalPrice, o.OrderDate, o.isCheckOut
            FROM Orders o
            JOIN OrderItems oi ON o.OrderID = oi.OrderID
            JOIN Reservations r ON r.OrderItemID = oi.OrderItemID
            LEFT JOIN Payments p ON r.ReservationID = p.ReservationID
            WHERE o.CustomerID = ? 
            AND (o.isCheckOut = 1 OR p.PaymentMethod = 'OFFLINE')
            AND r.isExam = 0 
            AND r.hasRecord = 0
            ORDER BY o.OrderDate DESC
        """;
        
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, CustomerID);
            ResultSet rs = pre.executeQuery();
            
            while (rs.next()) {
                int OrderID = rs.getInt("OrderID");
                int Quantity = rs.getInt("Quantity");
                double TotalPrice = rs.getDouble("TotalPrice");
                String OrderDate = rs.getString("OrderDate");
                boolean isCheckOut = rs.getBoolean("isCheckOut");
                
                Order order = new Order(OrderID, CustomerID, Quantity, TotalPrice, OrderDate, isCheckOut);
                list.add(order);
                
                // Debug log
                System.out.println("Found order: ID=" + OrderID + ", CustomerID=" + CustomerID + 
                                 ", isCheckOut=" + isCheckOut + ", Date=" + OrderDate);
            }
        } catch (SQLException e) {
            System.out.println("getCheckOutOrdersByCustomerID error: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
    
    public Order addOrder(Order order) {
        String sql = "INSERT INTO Orders (CustomerID, Quantity, TotalPrice, OrderDate, isCheckOut) " +
                    "VALUES (?, ?, ?, GETDATE(), ?); " +
                    "SELECT CAST(SCOPE_IDENTITY() AS INT) AS OrderID;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setInt(1, order.getCustomerID());
            pre.setInt(2, order.getQuantity());
            pre.setDouble(3, order.getTotalPrice());
            pre.setBoolean(4, order.isIsCheckOut());
            
            pre.executeUpdate();
            
            // Get the generated ID
            try (ResultSet rs = pre.getGeneratedKeys()) {
                if (rs.next()) {
                    int generatedOrderID = rs.getInt(1);
                    order.setOrderID(generatedOrderID);
                    System.out.println("Generated OrderID: " + generatedOrderID); // Debug log
                } else {
                    throw new SQLException("Creating order failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error in addOrder: " + e.getMessage());
            e.printStackTrace();
        }
        return order;
    }

    public OrderItem addOrderItem(OrderItem orderItem) {
        String sql = "INSERT INTO OrderItems (OrderID, ServiceID, ChildID) " +
                    "VALUES (?, ?, ?); " +
                    "SELECT CAST(SCOPE_IDENTITY() AS INT) AS OrderItemID;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setInt(1, orderItem.getOrderID());
            pre.setInt(2, orderItem.getServiceID());
            pre.setInt(3, orderItem.getChildID());
            
            pre.executeUpdate();
            
            // Get the generated ID
            try (ResultSet rs = pre.getGeneratedKeys()) {
                if (rs.next()) {
                    int generatedOrderItemID = rs.getInt(1);
                    orderItem.setOrderItemID(generatedOrderItemID);
                    System.out.println("Generated OrderItemID: " + generatedOrderItemID); // Debug log
                } else {
                    throw new SQLException("Creating order item failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error in addOrderItem: " + e.getMessage());
            e.printStackTrace();
        }
        return orderItem;
    }

    public boolean updateOrder(Order order) {
        String sql = "UPDATE Orders SET isCheckOut = ? WHERE OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, order.isIsCheckOut());
            st.setInt(2, order.getOrderID());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("updateOrder error: " + e.getMessage());
            return false;
        }
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        System.out.println(dao.getAllOrders().size());
        System.out.println(dao.getAllCheckOutOrders().size());
        System.out.println(dao.getAllOrderItems().size());
        System.out.println(dao.getCheckOutOrdersByCustomerID(4).size());
    }
}

