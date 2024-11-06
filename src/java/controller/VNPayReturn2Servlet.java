/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.PaymentDAO;
import dal.ReservationDAO;
import dal.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.Payment;
import model.Reservation;
import java.util.Map;

public class VNPayReturn2Servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            System.out.println("=== VNPayReturn2Servlet START ===");

            System.out.println("Request URI: " + request.getRequestURI());
            System.out.println("Context Path: " + request.getContextPath());
            System.out.println("Servlet Path: " + request.getServletPath());
            System.out.println("Query String: " + request.getQueryString());

            // Log tất cả parameters từ VNPay
            Map<String, String[]> params = request.getParameterMap();
            for (String key : params.keySet()) {
                System.out.println(key + ": " + String.join(", ", params.get(key)));
            }

            // Lấy các tham số quan trọng
            String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
            String vnp_TxnRef = request.getParameter("vnp_TxnRef");
            String vnp_Amount = request.getParameter("vnp_Amount");
            String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
            String vnp_TransactionNo = request.getParameter("vnp_TransactionNo");
            String vnp_BankCode = request.getParameter("vnp_BankCode");
            String vnp_PayDate = request.getParameter("vnp_PayDate");

            // Log các tham số quan trọng
            System.out.println("Response Code: " + vnp_ResponseCode);
            System.out.println("Transaction Ref: " + vnp_TxnRef);
            System.out.println("Amount: " + vnp_Amount);
            System.out.println("Order Info: " + vnp_OrderInfo);

            PaymentDAO paymentDAO = new PaymentDAO();
            Payment payment = paymentDAO.getPaymentByTransactionNo(vnp_TxnRef);

            if (payment != null) {
                // Cập nhật thông tin thanh toán
//                payment.setPaymentAmount(Double.parseDouble(vnp_Amount) / 100); // Chuyển về đơn vị tiền tệ
//                payment.setBankCode(vnp_BankCode);
//                payment.setTransactionNo(vnp_TransactionNo);
//                payment.setPaymentTime(vnp_PayDate);

                if ("00".equals(vnp_ResponseCode)) {
                    // Thanh toán thành công
                    payment.setPaymentStatus("SUCCESS");
                    paymentDAO.updatePayment(payment);

                    HttpSession session = request.getSession();
                    Map<String, Object> reservationInfo
                            = (Map<String, Object>) session.getAttribute("reservationInfo");

                    if (reservationInfo != null) {
                        // Tạo reservation mới
                        Reservation reservation = new Reservation();
                        reservation.setOrderItemID(payment.getOrderId());
                        reservation.setReservationDate((String) reservationInfo.get("reservationDate"));
                        reservation.setStartTime((String) reservationInfo.get("startTime"));
                        reservation.setStaffID((Integer) reservationInfo.get("staffID"));
                        reservation.setIsExam(false);
                        reservation.setHasRecord(false);

                        ReservationDAO reservationDAO = new ReservationDAO();
                        if (reservationDAO.addReservation(reservation)) {
                            payment.setReservationId(reservation.getReservationID());
                            paymentDAO.updatePayment(payment);

                            // Cập nhật trạng thái order
                            OrderDAO orderDAO = new OrderDAO();
                            Order order = orderDAO.getOrdersByOrderID(payment.getOrderId());
                            order.setIsCheckOut(true);
                            orderDAO.updateOrder(order);

                            session.removeAttribute("reservationInfo");
                            request.setAttribute("paymentSuccess", true);
                        }
                    }
                } else {
                    // Thanh toán thất bại
                    payment.setPaymentStatus("FAILED");
                    paymentDAO.updatePayment(payment);
                    request.setAttribute("paymentSuccess", false);
                }
            } else {
                request.setAttribute("paymentSuccess", false);
            }

            // Forward to result page
            request.getRequestDispatcher(request.getContextPath() + "/paymennt-result.jsp").forward(request, response);

            System.out.println("=== VNPayReturn2Servlet END ===");

        } catch (Exception e) {
            System.out.println("Error in VNPayReturn2Servlet: " + e.getMessage());
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
