package controller;

import config.VNPayConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import model.Payment;
import model.Service;
import dal.PaymentDAO;
import model.Order;
import dal.OrderDAO;
import model.Users;
import java.sql.Timestamp;

public class PaymentServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("=== PaymentServlet doGet START ===");
        // Thêm log để kiểm tra user
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        System.out.println("Current user in session: " + (user != null ? user.getUserID() : "null"));
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
                Map<String, Object> reservationInfo = (Map<String, Object>) session.getAttribute("reservationInfo");
                // Thêm đoạn này để lấy user
                Users currentUser = (Users) session.getAttribute("user");
                System.out.println("Current user in session: " + (currentUser != null ? currentUser.getUserID() : "null"));

                // Kiểm tra user trước khi xử lý
                if (currentUser == null) {
                    throw new Exception("No user found in session");
                }

                if (reservationInfo != null) {
                    String txnRef = VNPayConfig.getRandomNumber(8);
                    Service service = (Service) reservationInfo.get("service");
                    double amount = service.getPrice(); // Lấy giá từ service

                    Payment payment = new Payment();
                    payment.setAmount(amount);
                    payment.setTransactionNo(txnRef);
                    payment.setPaymentStatus("PENDING");
                    payment.setPaymentMethod("VNPAY");

                    // Tạo Order với CustomerID từ user hiện tại
                    Order order = new Order();
                    order.setCustomerID(currentUser.getUserID());  // Set CustomerID từ user session
                    order.setQuantity(1);
                    order.setTotalPrice(amount);
                    order.setOrderDate(new Date());
                    order.setCheckOut(true);

                    System.out.println("Creating order for CustomerID: " + currentUser.getUserID());
                    int orderId = orderDAO.insert(order);
                    System.out.println("Created Order with ID: " + orderId);

                    // Lưu OrderID vào session
                    session.setAttribute("pendingOrderId", orderId);

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
