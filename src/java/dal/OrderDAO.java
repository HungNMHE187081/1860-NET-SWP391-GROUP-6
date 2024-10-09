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
                list.add(new Order(OrderID, CustomerID, Quantity, TotalPrice, OrderDate));
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

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        System.out.println(dao.getAllOrders().size());
        System.out.println(dao.getAllOrderItems().size());
    }
}
