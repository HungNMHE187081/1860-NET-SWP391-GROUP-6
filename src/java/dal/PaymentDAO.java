/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Payment;

/**
 *
 * @author HÙNG
 */
public class PaymentDAO extends DBContext {
    
    public boolean createPayment(Payment payment) {
        try {
            String sql = "INSERT INTO Payments (ReservationID, OrderID, Amount, PaymentStatus, TransactionNo, PaymentMethod) "
                      + "VALUES (?, ?, ?, ?, ?, ?)";
                      
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, payment.getReservationId());
            st.setInt(2, payment.getOrderId());
            st.setDouble(3, payment.getAmount());
            st.setString(4, payment.getPaymentStatus());
            st.setString(5, payment.getTransactionNo());
            st.setString(6, payment.getPaymentMethod());
            
            return st.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.out.println("createPayment error: " + e.getMessage());
            return false;
        }
    }
    
    public Payment getPaymentByTransactionNo(String transactionNo) {
        try {
            String sql = "SELECT * FROM Payments WHERE TransactionNo = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, transactionNo);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                Payment payment = new Payment();
                payment.setPaymentId(rs.getInt("PaymentID"));
                payment.setReservationId(rs.getInt("ReservationID"));
                payment.setOrderId(rs.getInt("OrderID"));
                payment.setAmount(rs.getDouble("Amount"));
                payment.setPaymentDate(rs.getTimestamp("PaymentDate"));
                payment.setPaymentStatus(rs.getString("PaymentStatus"));
                payment.setTransactionNo(rs.getString("TransactionNo"));
                payment.setPaymentMethod(rs.getString("PaymentMethod"));
                return payment;
            }
        } catch (SQLException e) {
            System.out.println("getPaymentByTransactionNo error: " + e.getMessage());
        }
        return null;
    }
    
    public boolean updatePaymentStatus(String transactionNo, String status) {
        try {
            String sql = "UPDATE Payments SET PaymentStatus = ? WHERE TransactionNo = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setString(2, transactionNo);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("updatePaymentStatus error: " + e.getMessage());
            return false;
        }
    }
    
    public boolean updatePayment(Payment payment) {
        try {
            String sql = "UPDATE Payments SET "
                      + "ReservationID = ?, "
                      + "PaymentStatus = ? "
                      + "WHERE PaymentID = ?";
                      
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, payment.getReservationId());
            st.setString(2, payment.getPaymentStatus());
            st.setInt(3, payment.getPaymentId());
            
            return st.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.out.println("updatePayment error: " + e.getMessage());
            return false;
        }
    }
    
    public List<Payment> getPaymentsByCustomerId(int customerId) {
        List<Payment> payments = new ArrayList<>();
        String sql = "SELECT p.* FROM Payments p " +
                     "JOIN Orders o ON p.OrderID = o.OrderID " +
                     "WHERE o.CustomerID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customerId);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                Payment payment = new Payment();
                payment.setPaymentId(rs.getInt("PaymentID"));
                payment.setReservationId(rs.getInt("ReservationID"));
                payment.setOrderId(rs.getInt("OrderID"));
                payment.setAmount(rs.getDouble("Amount"));
                payment.setPaymentDate(rs.getTimestamp("PaymentDate"));
                payment.setPaymentStatus(rs.getString("PaymentStatus"));
                payment.setTransactionNo(rs.getString("TransactionNo"));
                payment.setPaymentMethod(rs.getString("PaymentMethod"));
                payments.add(payment);
            }
        } catch (SQLException e) {
            System.out.println("getPaymentsByCustomerId error: " + e.getMessage());
        }
        return payments;
    }
}
