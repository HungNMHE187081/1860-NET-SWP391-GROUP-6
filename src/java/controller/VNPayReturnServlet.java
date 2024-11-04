package controller;

import dal.PaymentDAO;
import dal.ReservationDAO;
import dal.OrderDAO;
import model.Payment;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;

public class VNPayReturnServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
        
        PaymentDAO paymentDAO = new PaymentDAO();
        Payment payment = paymentDAO.getPaymentByTransactionNo(vnp_TxnRef);
        
        if (payment != null) {
            if ("00".equals(vnp_ResponseCode)) {
                // Thanh toán thành công
                paymentDAO.updatePaymentStatus(vnp_TxnRef, "SUCCESS");
                
                // Cập nhật trạng thái reservation và order
                ReservationDAO reservationDAO = new ReservationDAO();
                OrderDAO orderDAO = new OrderDAO();
                
                // Cập nhật status của reservation thành CONFIRMED
                reservationDAO.updateStatus(payment.getReservationId(), "CONFIRMED");
                
                // Cập nhật isCheckOut của order thành true
                Order order = orderDAO.getOrdersByOrderID(payment.getOrderId());
                order.setIsCheckOut(true);
                orderDAO.updateOrder(order);
                
                request.setAttribute("paymentSuccess", true);
                request.getRequestDispatcher("/payment-result.jsp").forward(request, response);
            } else {
                // Thanh toán thất bại
                paymentDAO.updatePaymentStatus(vnp_TxnRef, "FAILED");
                request.setAttribute("paymentSuccess", false);
                request.getRequestDispatcher("/payment-result.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
