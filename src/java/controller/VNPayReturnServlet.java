package controller;

import dal.DBContext;
import dal.PaymentDAO;
import dal.ReservationDAO;
import dal.OrderDAO;
import dal.OrderItemDAO;
import model.Payment;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import java.util.Map;
import model.OrderItem;
import model.Reservation;
import java.sql.Connection;
import java.sql.SQLException;

public class VNPayReturnServlet extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("=== VNPayReturnServlet service() START ===");
        System.out.println("Full URL: " + request.getRequestURL());
        System.out.println("Query String: " + request.getQueryString());
        System.out.println("Server Name: " + request.getServerName());
        System.out.println("Server Port: " + request.getServerPort());
        System.out.println("Context Path: " + request.getContextPath());
        System.out.println("Servlet Path: " + request.getServletPath());
        System.out.println("Path Info: " + request.getPathInfo());
        
        super.service(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            System.out.println("=== VNPayReturnServlet START ===");
            
            String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
            String vnp_TxnRef = request.getParameter("vnp_TxnRef");
            System.out.println("Response Code: " + vnp_ResponseCode);
            System.out.println("Transaction Ref: " + vnp_TxnRef);
            
            PaymentDAO paymentDAO = new PaymentDAO();
            Payment payment = paymentDAO.getPaymentByTransactionNo(vnp_TxnRef);
            
            if (payment != null) {
                if ("00".equals(vnp_ResponseCode)) {
                    System.out.println("Payment successful, processing...");
                    
                    HttpSession session = request.getSession();
                    Map<String, Object> reservationInfo = 
                        (Map<String, Object>) session.getAttribute("reservationInfo");
                    
                    if (reservationInfo != null) {
                        System.out.println("Creating reservation from info: " + reservationInfo);
                        try {
                            Connection conn = null;
                            try {
                                conn = new DBContext().connection;
                                conn.setAutoCommit(false);
                                
                                // 1. Tạo Order
                                Order order = new Order();
                                order.setCustomerID(4); // Lấy customerID từ session
                                order.setQuantity(1);
                                order.setTotalPrice(payment.getAmount());
                                order.setIsCheckOut(true);
                                
                                OrderDAO orderDAO = new OrderDAO();
                                order = orderDAO.addOrder(order);
                                
                                System.out.println("Created Order with ID: " + order.getOrderID());
                                
                                if (order.getOrderID() > 0) {
                                    // 2. Cập nhật Payment với OrderID
                                    payment.setOrderId(order.getOrderID());
                                    
                                    // 3. Tạo OrderItem
                                    OrderItem orderItem = new OrderItem();
                                    orderItem.setOrderID(order.getOrderID());
                                    orderItem.setChildID((Integer)reservationInfo.get("childID"));
                                    orderItem.setServiceID((Integer)reservationInfo.get("serviceID"));
                                    
                                    OrderItemDAO orderItemDAO = new OrderItemDAO();
                                    orderItem = orderItemDAO.addOrderItem(orderItem);
                                    
                                    System.out.println("Created OrderItem with ID: " + orderItem.getOrderItemID());
                                    
                                    if (orderItem != null && orderItem.getOrderItemID() > 0) {
                                        // 4. Tạo Reservation
                                        Reservation reservation = new Reservation();
                                        reservation.setOrderItemID(orderItem.getOrderItemID());
                                        reservation.setReservationDate((String)reservationInfo.get("reservationDate"));
                                        reservation.setStartTime((String)reservationInfo.get("startTime"));
                                        reservation.setStaffID((Integer)reservationInfo.get("staffID"));
                                        reservation.setIsExam(false);
                                        reservation.setHasRecord(false);
                                        
                                        ReservationDAO reservationDAO = new ReservationDAO();
                                        if (reservationDAO.addReservation(reservation)) {
                                            int newReservationID = reservation.getReservationID();
                                            System.out.println("Created Reservation with ID: " + newReservationID);
                                            
                                            if (newReservationID > 0) {
                                                // Cập nhật payment
                                                payment.setPaymentStatus("SUCCESS");
                                                payment.setOrderId(order.getOrderID());
                                                payment.setReservationId(newReservationID);
                                                
                                                System.out.println("Updating payment:");
                                                System.out.println("PaymentID: " + payment.getPaymentId());
                                                System.out.println("OrderID: " + payment.getOrderId());
                                                System.out.println("ReservationID: " + payment.getReservationId());
                                                
                                                if (paymentDAO.updatePayment(payment)) {
                                                    System.out.println("Payment updated successfully");
                                                    
                                                    // Verify the update
                                                    Payment updatedPayment = paymentDAO.getPaymentByTransactionNo(payment.getTransactionNo());
                                                    System.out.println("Verified payment - ReservationID: " + updatedPayment.getReservationId());
                                                    
                                                    request.setAttribute("paymentSuccess", true);
                                                    session.removeAttribute("reservationInfo");
                                                } else {
                                                    throw new Exception("Failed to update payment");
                                                }
                                            } else {
                                                throw new Exception("Invalid ReservationID generated: " + newReservationID);
                                            }
                                        } else {
                                            throw new Exception("Failed to create reservation");
                                        }
                                    }
                                }
                                
                                conn.commit();
                            } catch (Exception e) {
                                if (conn != null) {
                                    try {
                                        conn.rollback();
                                    } catch (SQLException ex) {
                                        ex.printStackTrace();
                                    }
                                }
                                throw e;
                            } finally {
                                if (conn != null) {
                                    try {
                                        conn.close();
                                    } catch (SQLException ex) {
                                        ex.printStackTrace();
                                    }
                                }
                            }
                        } catch (Exception e) {
                            System.out.println("Error processing payment: " + e.getMessage());
                            e.printStackTrace();
                            payment.setPaymentStatus("FAILED");
                            paymentDAO.updatePayment(payment);
                            request.setAttribute("paymentSuccess", false);
                        }
                    }
                } else {
                    payment.setPaymentStatus("FAILED");
                    paymentDAO.updatePayment(payment);
                    request.setAttribute("paymentSuccess", false);
                }
            }
            
            request.getRequestDispatcher("/payment-result.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.out.println("Error in VNPayReturnServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
