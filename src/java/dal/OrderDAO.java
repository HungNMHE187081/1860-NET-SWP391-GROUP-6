/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
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
                Date OrderDate = rs.getDate("OrderDate");
                boolean isCheckOut = rs.getBoolean("isCheckOut");
                list.add(new Order(OrderID, CustomerID, Quantity, TotalPrice, OrderDate, isCheckOut));
            }
        } catch (SQLException e) {
            System.out.println("getAllOrders error: " + e.getMessage());
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
                Date OrderDate = rs.getDate("OrderDate");
                boolean isCheckOut = rs.getBoolean("isCheckOut");
                list.add(new Order(OrderID, CustomerID, Quantity, TotalPrice, OrderDate, isCheckOut));
            }
        } catch (SQLException e) {
            System.out.println("getAllOrderInCarts error: " + e.getMessage());
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
                Date OrderDate = rs.getDate("OrderDate");
                boolean isCheckOut = rs.getBoolean("isCheckOut");
                list.add(new Order(OrderID, CustomerID, Quantity, TotalPrice, OrderDate, isCheckOut));
            }
        } catch (SQLException e) {
            System.out.println("getAllCheckOutOrders error: " + e.getMessage());
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
                    order.setOrderDate(rs.getDate("OrderDate"));
                    order.setCheckOut(rs.getBoolean("isCheckOut"));
                }
            }
        } catch (SQLException e) {
            System.out.println("getOrdersByOrderID error: " + e.getMessage());
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
                Date OrderDate = rs.getDate("OrderDate");
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
                Date OrderDate = rs.getDate("OrderDate");
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
                WHERE o.CustomerID = ? 
                AND (o.isCheckOut = 0 OR o.isCheckOut = 1)
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
                    Date OrderDate = rs.getDate("OrderDate");
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
    
    public int insert(Order order) {
        String sql = "INSERT INTO Orders (CustomerID, Quantity, TotalPrice, OrderDate, isCheckOut) " +
                    "VALUES (?, ?, ?, ?, ?); " +
                    "SELECT CAST(SCOPE_IDENTITY() AS INT) AS OrderID;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            // Log các giá trị trước khi insert
            System.out.println("Inserting Order with values:");
            System.out.println("CustomerID: " + order.getCustomerID());
            System.out.println("Quantity: " + order.getQuantity());
            System.out.println("TotalPrice: " + order.getTotalPrice());
            System.out.println("OrderDate: " + order.getOrderDate());
            System.out.println("isCheckOut: " + order.isCheckOut());
            
            pre.setInt(1, order.getCustomerID());
            pre.setInt(2, order.getQuantity());
            pre.setDouble(3, order.getTotalPrice());
            pre.setTimestamp(4, new Timestamp(order.getOrderDate().getTime()));
            pre.setBoolean(5, order.isCheckOut());
            
            pre.executeUpdate();
            
            try (ResultSet rs = pre.getGeneratedKeys()) {
                if (rs.next()) {
                    int generatedId = rs.getInt(1);
                    System.out.println("Generated OrderID: " + generatedId + 
                                     " for CustomerID: " + order.getCustomerID());
                    return generatedId;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error in insert Order: " + e.getMessage());
            e.printStackTrace();
        }
        return -1;
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
            st.setBoolean(1, order.isCheckOut());
            st.setInt(2, order.getOrderID());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("updateOrder error: " + e.getMessage());
            return false;
        }
    }

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
            System.out.println("Error getting order item by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public Order getOrderById(int orderId) {
        String sql = "SELECT * FROM Orders WHERE OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                Order order = new Order();
                order.setOrderID(rs.getInt("OrderID"));
                order.setCustomerID(rs.getInt("CustomerID"));
                order.setQuantity(rs.getInt("Quantity"));
                order.setTotalPrice(rs.getDouble("TotalPrice"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setCheckOut(rs.getBoolean("isCheckOut"));
                return order;
            }
        } catch (SQLException e) {
            System.out.println("Error getting order by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        System.out.println(dao.getAllOrders().size());
        System.out.println(dao.getAllCheckOutOrders().size());
        System.out.println(dao.getAllOrderItems().size());
        System.out.println(dao.getCheckOutOrdersByCustomerID(4).size());
    }
}

