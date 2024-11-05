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
import model.Service;

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
            
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            System.out.println("Action received: " + action);
            
            System.out.println("Session ID: " + session.getId());
            Map<String, Object> reservationInfo = (Map<String, Object>) session.getAttribute("reservationInfo");
            System.out.println("ReservationInfo in session: " + reservationInfo);
            
            if (reservationInfo == null) {
                System.out.println("ERROR: ReservationInfo is null in session");
                response.sendRedirect(request.getContextPath() + "/error.jsp");
                return;
            }
            
            if ("process".equals(action)) {
                try {
                    Service service = (Service) reservationInfo.get("service");
                    double amount = service.getPrice();
                    
                    String txnRef = VNPayConfig.getRandomNumber(8);
                    
                    String orderInfo = "Thanh toan dich vu y te";
                    
                    String vnpayUrl = VNPayConfig.createPaymentUrl(txnRef, amount, orderInfo);
                    System.out.println("Generated VNPAY URL: " + vnpayUrl);
                    
                    session.setAttribute("paymentInfo", Map.of(
                        "txnRef", txnRef,
                        "amount", amount,
                        "orderInfo", orderInfo
                    ));
                    
                    response.sendRedirect(vnpayUrl);
                    
                } catch (Exception e) {
                    System.out.println("Error processing payment: " + e.getMessage());
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/error.jsp");
                }
            } else {
                System.out.println("Showing payment confirmation page");
                request.getRequestDispatcher("/Common_JSP/payment.jsp").forward(request, response);
            }
            
            System.out.println("=== PaymentServlet doPost END ===");
            
        } catch (Exception e) {
            System.out.println("CRITICAL ERROR in PaymentServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
