package controller;

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

public class VNPayReturnServlet extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("=== VNPayReturnServlet service() called ===");
        System.out.println("Request Method: " + request.getMethod());
        super.service(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            System.out.println("=== VNPayReturnServlet doGet START ===");
            System.out.println("Request URI: " + request.getRequestURI());
            System.out.println("Context Path: " + request.getContextPath());
            System.out.println("Servlet Path: " + request.getServletPath());
            
            // Log all request parameters
            Map<String, String[]> params = request.getParameterMap();
            for (String key : params.keySet()) {
                System.out.println(key + ": " + String.join(", ", params.get(key)));
            }
            
            String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
            String vnp_TxnRef = request.getParameter("vnp_TxnRef");
            System.out.println("Response Code: " + vnp_ResponseCode);
            System.out.println("Transaction Ref: " + vnp_TxnRef);
            
            PaymentDAO paymentDAO = new PaymentDAO();
            Payment payment = paymentDAO.getPaymentByTransactionNo(vnp_TxnRef);
            
            if (payment != null) {
                if ("00".equals(vnp_ResponseCode)) {
                    System.out.println("Payment successful, processing...");
                    // Thanh toán thành công
                    payment.setPaymentStatus("SUCCESS");
                    paymentDAO.updatePayment(payment);
                    
                    HttpSession session = request.getSession();
                    Map<String, Object> reservationInfo = 
                        (Map<String, Object>) session.getAttribute("reservationInfo");
                    
                    if (reservationInfo != null) {
                        System.out.println("Creating reservation from info: " + reservationInfo);
                        // Tạo reservation và cập nhật payment
                        try {
                            Reservation reservation = new Reservation();
                            reservation.setOrderItemID(payment.getOrderId());
                            reservation.setReservationDate((String)reservationInfo.get("reservationDate"));
                            reservation.setStartTime((String)reservationInfo.get("startTime"));
                            reservation.setStaffID((Integer)reservationInfo.get("staffID"));
                            reservation.setIsExam(false);
                            reservation.setHasRecord(false);
                            
                            ReservationDAO reservationDAO = new ReservationDAO();
                            if (reservationDAO.addReservation(reservation)) {
                                System.out.println("Reservation created successfully: " + reservation.getReservationID());
                                payment.setReservationId(reservation.getReservationID());
                                paymentDAO.updatePayment(payment);
                                
                                // Cập nhật trạng thái order
                                OrderDAO orderDAO = new OrderDAO();
                                Order order = orderDAO.getOrdersByOrderID(payment.getOrderId());
                                order.setIsCheckOut(true);
                                orderDAO.updateOrder(order);
                                
                                session.removeAttribute("reservationInfo");
                                request.setAttribute("paymentSuccess", true);
                                System.out.println("Payment process completed successfully");
                            }
                        } catch (Exception e) {
                            System.out.println("Error creating reservation: " + e.getMessage());
                            e.printStackTrace();
                            throw e;
                        }
                    } else {
                        System.out.println("No reservation info found in session");
                    }
                } else {
                    System.out.println("Payment failed with response code: " + vnp_ResponseCode);
                    payment.setPaymentStatus("FAILED");
                    paymentDAO.updatePayment(payment);
                    request.setAttribute("paymentSuccess", false);
                }
            } else {
                System.out.println("No payment found for transaction: " + vnp_TxnRef);
                request.setAttribute("paymentSuccess", false);
            }
            
            // Đảm bảo đường dẫn JSP chính xác
            String jspPath = "/Common_JSP/payment-result.jsp";
            System.out.println("Forwarding to: " + jspPath);
            request.getRequestDispatcher(jspPath).forward(request, response);
            
            System.out.println("=== VNPayReturnServlet END ===");
                    
        } catch (Exception e) {
            System.out.println("CRITICAL ERROR in VNPayReturnServlet: " + e.getMessage());
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
