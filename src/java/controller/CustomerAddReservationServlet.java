/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ChildrenDAO;
import dal.OrderDAO;
import dal.ReservationDAO;
import dal.ServiceDAO;
import dal.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Children;
import model.Order;
import model.OrderItem;
import model.Reservation;
import model.Service;
import model.Users;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class CustomerAddReservationServlet extends HttpServlet {

    private Integer getServiceID(HttpServletRequest request) {
        String serviceIDParam = request.getParameter("serviceID");
        if (serviceIDParam == null || serviceIDParam.isEmpty()) {
            return null;
        }
        try {
            return Integer.parseInt(serviceIDParam);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession();
    Users user = (Users) session.getAttribute("user");

    if (user != null) {
        String serviceIDStr = request.getParameter("serviceID");
        System.out.println("Service ID received: " + serviceIDStr); // Debugging

        int serviceID = Integer.parseInt(serviceIDStr);
        ServiceDAO serviceDAO = new ServiceDAO();
        Service service = serviceDAO.getServiceByID(serviceID);
        
        if (service != null) {
            System.out.println("Service fetched: " + service.getServiceName()); // Debugging
        } else {
            System.out.println("Service not found with ID: " + serviceID);
        }

        int ageLimitID = service.getAgeLimitID();
        System.out.println("Age Limit ID for Service: " + ageLimitID); // Debugging

        ChildrenDAO childrenDAO = new ChildrenDAO();
        List<Children> allChildren = childrenDAO.getAgeOfChildrenByCustomerID(user.getUserID());
        List<Children> childrenByAge = new ArrayList<>();

        // Apply the specific filtering logic based on age limits
        if (ageLimitID == 1) {
            for (Children child : allChildren) {
                if (child.getAge() < 1) {
                    childrenByAge.add(child);
                }
            }
        } 
        if (ageLimitID == 2) {
            for (Children child : allChildren) {
                if (child.getAge() >= 1 && child.getAge() < 6) {
                    childrenByAge.add(child);
                }
            }
        } 
        if (ageLimitID == 3) {
            for (Children child : allChildren) {
                if (child.getAge() >= 6 && child.getAge() < 13) {
                    childrenByAge.add(child);
                }
            }
        } 
        if (ageLimitID == 4) {
            for (Children child : allChildren) {
                if (child.getAge() >= 13 && child.getAge() < 18) {
                    childrenByAge.add(child);
                }
            }
        }

        System.out.println("Filtered children count: " + childrenByAge.size()); // Debugging

        StaffDAO staffDAO = new StaffDAO();
        request.setAttribute("service", service);
        request.setAttribute("children", childrenByAge);
        request.setAttribute("staffs", staffDAO.getAllStaffs());

        request.getRequestDispatcher("/Common_JSP/home-add-reservation.jsp").forward(request, response);
    } else {
        response.sendRedirect(request.getContextPath() + "/login");
    }
}



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Nhận các tham số từ request
        String orderItemIdStr = request.getParameter("orderItemId");
        String reservationDateStr = request.getParameter("reservationDate");
        String startTimeStr = request.getParameter("startTime");
        String staffIdStr = request.getParameter("staffId");

        String errorMessage = null;

        try {
            // Chuyển đổi dữ liệu đầu vào
            int orderItemId = Integer.parseInt(orderItemIdStr);
            int staffId = Integer.parseInt(staffIdStr);

            // Tạo đối tượng Reservation
            Reservation reservation = new Reservation();
            reservation.setOrderItemID(orderItemId);
            reservation.setReservationDate(reservationDateStr);  // Giữ nguyên định dạng chuỗi
            reservation.setStartTime(startTimeStr);              // Giữ nguyên định dạng chuỗi
            reservation.setStaffID(staffId);
            reservation.setIsExam(false);
            reservation.setHasRecord(false);

            // Thêm đặt lịch qua ReservationDAO
            ReservationDAO reservationDAO = new ReservationDAO();
            // boolean isAdded = reservationDAO.addReservation(reservation);

            // if (isAdded) {
            //     response.sendRedirect("reservationConfirmation.jsp"); // Chuyển hướng đến trang xác nhận
            // } else {
            //     errorMessage = "Không thể thêm đặt lịch. Vui lòng thử lại.";
            //     request.setAttribute("errorMessage", errorMessage);
            //     request.getRequestDispatcher("home-add-reservation.jsp").forward(request, response);
            // }
        } catch (NumberFormatException e) {
            errorMessage = "Dữ liệu đầu vào không hợp lệ. Vui lòng kiểm tra lại.";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/Common_JSP/home-add-reservation.jsp").forward(request, response);
        } catch (Exception e) {
            errorMessage = "Có lỗi xảy ra khi xử lý yêu cầu của bạn.";
            e.printStackTrace();
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/Common_JSP/home-add-reservation.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
