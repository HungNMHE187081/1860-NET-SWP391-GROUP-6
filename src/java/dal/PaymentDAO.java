/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Payment;

/**
 *
 * @author HÙNG
 */
public class PaymentDAO extends DBContext {
    
    public boolean createPayment(Payment payment) {
        String sql = "INSERT INTO Payments (TransactionNo, Amount, PaymentStatus, PaymentMethod, PaymentDate) "
                   + "VALUES (?, ?, ?, ?, GETDATE())";
        
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            ps.setString(1, payment.getTransactionNo());
            ps.setDouble(2, payment.getAmount());
            ps.setString(3, "PENDING");
            ps.setString(4, "VNPAY");
            
            System.out.println("Executing SQL: " + sql);
            System.out.println("TransactionNo: " + payment.getTransactionNo());
            System.out.println("Amount: " + payment.getAmount());
            
            int result = ps.executeUpdate();
            
            if (result > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        payment.setPaymentId(rs.getInt(1));
                        System.out.println("Created payment with ID: " + payment.getPaymentId());
                    }
                }
            }
            
            return result > 0;
            
        } catch (SQLException e) {
            System.out.println("Error creating payment: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
    }
    
    public Payment getPaymentByTransactionNo(String transactionNo) {
        String sql = "SELECT * FROM Payments WHERE TransactionNo = ?";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().connection; // Tạo kết nối mới
            ps = conn.prepareStatement(sql);
            ps.setString(1, transactionNo);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                Payment payment = new Payment();
                payment.setPaymentId(rs.getInt("PaymentID"));
                payment.setTransactionNo(rs.getString("TransactionNo"));
                payment.setAmount(rs.getDouble("Amount"));
                payment.setPaymentStatus(rs.getString("PaymentStatus"));
                payment.setPaymentMethod(rs.getString("PaymentMethod"));
                payment.setPaymentDate(rs.getTimestamp("PaymentDate"));
                
                // Kiểm tra NULL trước khi set
                int reservationId = rs.getInt("ReservationID");
                if (!rs.wasNull()) {
                    payment.setReservationId(reservationId);
                }
                
                int orderId = rs.getInt("OrderID");
                if (!rs.wasNull()) {
                    payment.setOrderId(orderId);
                }
                
                return payment;
            }
        } catch (SQLException e) {
            System.out.println("Error getting payment: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
        return null;
    }
    
    public boolean updatePaymentStatus(String transactionNo, String status, int orderId, int reservationId) {
        // Kiểm tra giá trị trước khi update
        if (reservationId <= 0) {
            System.out.println("Invalid ReservationID: " + reservationId);
            return false;
        }

        String sql = "UPDATE Payments SET " +
                     "PaymentStatus = ?, " +
                     "OrderID = ?, " +
                     "ReservationID = ? " +
                     "WHERE TransactionNo = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, orderId);
            st.setInt(3, reservationId);
            st.setString(4, transactionNo);
            
            System.out.println("Executing payment update with values:");
            System.out.println("Status: " + status);
            System.out.println("OrderID: " + orderId);
            System.out.println("ReservationID: " + reservationId);
            System.out.println("TransactionNo: " + transactionNo);
            
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error updating payment status: " + e.getMessage());
            e.printStackTrace();
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
    
    public boolean updatePayment(Payment payment) {
        String sql = "UPDATE Payments SET PaymentStatus = ?, OrderID = ?, ReservationID = ? "
                   + "WHERE TransactionNo = ?";
               
        try (Connection conn = connection;
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, payment.getPaymentStatus());
            
            if (payment.getOrderId() > 0) {
                ps.setInt(2, payment.getOrderId());
            } else {
                ps.setNull(2, java.sql.Types.INTEGER);
            }
            
            if (payment.getReservationId() > 0) {
                ps.setInt(3, payment.getReservationId());
            } else {
                ps.setNull(3, java.sql.Types.INTEGER);
            }
            
            ps.setString(4, payment.getTransactionNo());
            
            System.out.println("Updating payment:");
            System.out.println("TransactionNo: " + payment.getTransactionNo());
            System.out.println("Status: " + payment.getPaymentStatus());
            System.out.println("OrderID: " + payment.getOrderId());
            System.out.println("ReservationID: " + payment.getReservationId());
            
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error updating payment: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    public Payment getPaymentByReservationId(int reservationId) {
        String sql = "SELECT * FROM Payments WHERE ReservationID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, reservationId);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                Payment payment = new Payment();
                payment.setPaymentId(rs.getInt("PaymentID"));
                payment.setTransactionNo(rs.getString("TransactionNo"));
                payment.setAmount(rs.getDouble("Amount"));
                payment.setPaymentStatus(rs.getString("PaymentStatus"));
                payment.setPaymentMethod(rs.getString("PaymentMethod"));
                payment.setPaymentDate(rs.getTimestamp("PaymentDate"));
                payment.setOrderId(rs.getInt("OrderID"));
                payment.setReservationId(rs.getInt("ReservationID"));
                return payment;
            }
        } catch (SQLException e) {
            System.out.println("Error getting payment by reservation ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}
