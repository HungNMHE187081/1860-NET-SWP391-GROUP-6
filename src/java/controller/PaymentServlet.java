package controller;

import config.VNPayConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;
import model.Payment;
import model.Service;
import dal.PaymentDAO;

public class PaymentServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("=== PaymentServlet doGet START ===");
        request.getRequestDispatcher("/Common_JSP/payment.jsp").forward(request, response);
        System.out.println("=== PaymentServlet doGet END ===");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            System.out.println("=== PaymentServlet doPost START ===");
            String action = request.getParameter("action");
            System.out.println("Action: " + action);
            
            if ("process".equals(action)) {
                HttpSession session = request.getSession();
                Map<String, Object> reservationInfo = 
                    (Map<String, Object>) session.getAttribute("reservationInfo");
                
                System.out.println("ReservationInfo: " + reservationInfo);
                
                if (reservationInfo != null) {
                    String txnRef = VNPayConfig.getRandomNumber(8);
                    double amount = 300000;
                    
                    Payment payment = new Payment();
                    payment.setAmount(amount);
                    payment.setTransactionNo(txnRef);
                    payment.setPaymentStatus("PENDING");
                    payment.setPaymentMethod("VNPAY");
                    
                    Service service = (Service) reservationInfo.get("service");
                    int childId = (int) reservationInfo.get("childID");
                    String startTime = (String) reservationInfo.get("startTime");
                    String reservationDate = (String) reservationInfo.get("reservationDate");
                    int staffId = (int) reservationInfo.get("staffID");
                    
                    System.out.println("Creating payment for transaction: " + txnRef);
                    System.out.println("Amount: " + amount);
                    System.out.println("Service ID: " + service.getServiceID());
                    
                    PaymentDAO paymentDAO = new PaymentDAO();
                    if (paymentDAO.createPayment(payment)) {
                        System.out.println("Payment created successfully");
                        
                        String orderInfo = "Thanh toan dich vu y te";
                        String vnpayUrl = VNPayConfig.createPaymentUrl(txnRef, amount, orderInfo, request);
                        System.out.println("Redirecting to VNPay URL: " + vnpayUrl);
                        
                        response.sendRedirect(vnpayUrl);
                    } else {
                        throw new Exception("Could not create payment record");
                    }
                } else {
                    throw new Exception("No reservation info found in session");
                }
            }
            
        } catch (Exception e) {
            System.out.println("Error in PaymentServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
