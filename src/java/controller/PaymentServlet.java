/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import config.VNPayConfig;
import dal.PaymentDAO;
import dal.ReservationDAO;
import dal.OrderDAO;
import dal.OrderItemDAO;
import model.Payment;
import model.Reservation;
import model.Order;
import model.OrderItem;

/**
 *
 * @author HÙNG
 */
public class PaymentServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PaymentServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            // Lấy thông tin từ request
            int reservationId = Integer.parseInt(request.getParameter("reservationId"));
            
            // Khởi tạo các DAO
            ReservationDAO reservationDAO = new ReservationDAO();
            OrderItemDAO orderItemDAO = new OrderItemDAO();
            OrderDAO orderDAO = new OrderDAO();
            
            // Lấy thông tin theo chuỗi: Reservation -> OrderItem -> Order
            Reservation reservation = reservationDAO.getReservationByID(reservationId);
            if (reservation == null) {
                throw new Exception("Không tìm thấy reservation");
            }
            
            OrderItem orderItem = orderItemDAO.getOrderItemById(reservation.getOrderItemID());
            if (orderItem == null) {
                throw new Exception("Không tìm thấy order item");
            }
            
            Order order = orderDAO.getOrdersByOrderID(orderItem.getOrderID());
            if (order == null) {
                throw new Exception("Không tìm thấy order");
            }
            
            // Tạo mã giao dịch
            String txnRef = VNPayConfig.getRandomNumber(8);
            
            // Tạo payment record
            Payment payment = new Payment();
            payment.setReservationId(reservationId);
            payment.setOrderId(order.getOrderID());
            payment.setAmount(order.getTotalPrice());
            payment.setPaymentStatus("PENDING");
            payment.setTransactionNo(txnRef);
            payment.setPaymentMethod("VNPAY");
            
            // Lưu payment vào database
            PaymentDAO paymentDAO = new PaymentDAO();
            if (paymentDAO.createPayment(payment)) {
                // Tạo URL thanh toán VNPay
                String orderInfo = "Thanh toan don hang #" + order.getOrderID();
                String vnpayUrl = VNPayConfig.createPaymentUrl(txnRef, payment.getAmount(), orderInfo);
                
                // Chuyển hướng đến VNPay
                response.sendRedirect(vnpayUrl);
            } else {
                throw new Exception("Không thể tạo payment record");
            }
            
        } catch (Exception e) {
            System.out.println("Payment processing error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
