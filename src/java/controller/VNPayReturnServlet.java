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
import java.util.Date;
import model.Users;
import model.Service;

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
        System.out.println("=== VNPayReturnServlet START ===");
        
        try {
            // Lấy session một lần duy nhất
            HttpSession session = request.getSession();
            Users currentUser = (Users) session.getAttribute("user");
            System.out.println("Current user in session: " + 
                (currentUser != null ? currentUser.getUserID() : "null"));

            // Lấy thông tin từ VNPay
            String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
            String vnp_TxnRef = request.getParameter("vnp_TxnRef");
            System.out.println("Response Code: " + vnp_ResponseCode);
            System.out.println("Transaction Ref: " + vnp_TxnRef);

            if ("00".equals(vnp_ResponseCode)) {
                System.out.println("Payment successful, processing...");
                
                // Lấy thông tin từ session
                Map<String, Object> reservationInfo = 
                    (Map<String, Object>) session.getAttribute("reservationInfo");
                System.out.println("Creating reservation from info: " + reservationInfo);

                if (reservationInfo != null && currentUser != null) {
                    // Tạo Order mới
                    OrderDAO orderDAO = new OrderDAO();
                    Service service = (Service) reservationInfo.get("service");
                    
                    Order order = new Order();
                    order.setCustomerID(currentUser.getUserID());
                    order.setQuantity(1);
                    order.setTotalPrice(service.getPrice());
                    order.setOrderDate(new Date());
                    order.setCheckOut(true);

                    System.out.println("Creating order with CustomerID: " + currentUser.getUserID());
                    int orderId = orderDAO.insert(order);
                    
                    if (orderId > 0) {
                        order.setOrderID(orderId);
                        System.out.println("Created Order with ID: " + orderId);

                        // Tạo OrderItem
                        OrderItem orderItem = new OrderItem();
                        orderItem.setOrderID(orderId);
                        orderItem.setServiceID((Integer) reservationInfo.get("serviceID"));
                        orderItem.setChildID((Integer) reservationInfo.get("childID"));
                        
                        orderItem = orderDAO.addOrderItem(orderItem);
                        System.out.println("Created OrderItem with ID: " + orderItem.getOrderItemID());

                        // Tạo Reservation
                        Reservation reservation = new Reservation();
                        reservation.setOrderItemID(orderItem.getOrderItemID());
                        reservation.setStaffID((Integer) reservationInfo.get("staffID"));
                        reservation.setReservationDate((String) reservationInfo.get("reservationDate"));
                        reservation.setStartTime((String) reservationInfo.get("startTime"));
                        reservation.setIsExam(false);
                        reservation.setHasRecord(false);

                        ReservationDAO resDAO = new ReservationDAO();
                        int reservationId = resDAO.addReservation(reservation);

                        if (reservationId > 0) {
                            System.out.println("Created Reservation with ID: " + reservationId);

                            // Cập nhật Payment
                            updatePayment(vnp_TxnRef, "SUCCESS", orderId, reservationId);
                            
                            // Chuyển hướng đến trang success
                            response.sendRedirect(request.getContextPath() + 
                                "/customer/reservationdetail?id=" + reservationId);
                            return;
                        } else {
                            throw new Exception("Failed to create reservation");
                        }
                    }
                }
            }
            
            // Nếu có lỗi, cập nhật payment status thành FAILED
            updatePayment(vnp_TxnRef, "FAILED", 0, 0);
            response.sendRedirect(request.getContextPath() + "/error.jsp");
            
        } catch (Exception e) {
            System.out.println("Error processing payment: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void updatePayment(String txnRef, String status, int orderId, int reservationId) {
        try {
            System.out.println("=== Updating payment ===");
            System.out.println("TransactionNo: " + txnRef);
            System.out.println("Status: " + status);
            System.out.println("OrderID: " + orderId);
            System.out.println("ReservationID: " + reservationId);

            PaymentDAO paymentDAO = new PaymentDAO();
            boolean updated = paymentDAO.updatePaymentStatus(txnRef, status, orderId, reservationId);
            
            if (updated) {
                System.out.println("Payment updated successfully");
            } else {
                System.out.println("Failed to update payment");
                // Có thể throw exception ở đây nếu cần
                throw new Exception("Payment update failed");
            }
            
        } catch (Exception e) {
            System.out.println("Error in updatePayment: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
