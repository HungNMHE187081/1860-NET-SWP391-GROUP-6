package controller;

import dal.AgeLimitDAO;
import dal.ChildrenDAO;
import dal.OrderDAO;
import dal.ReservationDAO;
import dal.ServiceDAO;
import dal.StaffDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.AgeLimits;
import model.Children;
import model.Order;
import model.OrderItem;
import model.Reservation;
import model.Service;
import model.Staff;
import model.Users;
import model.Payment;
import dal.PaymentDAO;

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
            Integer serviceID = getServiceID(request);
            if (serviceID == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid service ID.");
                return;
            }

            ServiceDAO serviceDAO = new ServiceDAO();
            Service service = serviceDAO.getServiceByID(serviceID);
            int ageLimitID = service.getAgeLimitID();
            AgeLimitDAO ageDAO = new AgeLimitDAO();
            AgeLimits ageLimit = ageDAO.getAgeLimitByID(ageLimitID);
            if (service == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Service not found.");
                return;
            }

            ChildrenDAO childrenDAO = new ChildrenDAO();
            List<Children> allChildren = childrenDAO.getAgeOfChildrenByCustomerID(user.getUserID());
            List<Children> childrenByAge = new ArrayList<>();

            // Filtering logic based on service's age limit
            for (Children child : allChildren) {
                int age = child.getAge();
                if (ageLimitID == 1 && age < 1) {
                    childrenByAge.add(child);
                } else if (ageLimitID == 2 && age >= 1 && age < 6) {
                    childrenByAge.add(child);
                } else if (ageLimitID == 3 && age >= 6 && age < 13) {
                    childrenByAge.add(child);
                } else if (ageLimitID == 4 && age >= 13 && age < 18) {
                    childrenByAge.add(child);
                }
            }

            StaffDAO staffDAO = new StaffDAO();
            List<Staff> staffs = staffDAO.getStaffByDegreeID(service.getDegreeID());
            
            request.setAttribute("ageLimit", ageLimit);
            request.setAttribute("service", service);
            request.setAttribute("children", childrenByAge);
            request.setAttribute("staffs", staffs);

            request.getRequestDispatcher("/Common_JSP/home-add-reservation.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            try {
                // Get and validate parameters
                Integer serviceID = getServiceID(request);
                String childIDStr = request.getParameter("childID");
                String startTime = request.getParameter("startTime") + ":00";
                String reservationDate = request.getParameter("reservationDate");
                String staffIDStr = request.getParameter("staffID");
                String paymentMethod = request.getParameter("isCheckOut");

                // Check parameters
                if (serviceID == null || childIDStr == null || startTime == null || 
                    reservationDate == null || staffIDStr == null || 
                    childIDStr.isEmpty() || startTime.isEmpty() || 
                    reservationDate.isEmpty() || staffIDStr.isEmpty()) {
                    
                    request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin.");
                    request.getRequestDispatcher("/Common_JSP/home-add-reservation.jsp").forward(request, response);
                    return;
                }

                int childID = Integer.parseInt(childIDStr);
                int staffID = Integer.parseInt(staffIDStr);
                
                // Get service and child details
                ServiceDAO serviceDAO = new ServiceDAO();
                ChildrenDAO childrenDAO = new ChildrenDAO();
                Service service = serviceDAO.getServiceByID(serviceID);
                Children child = childrenDAO.getChildrenByID(childID);
                
                // Validate child's age against service age limit
                int ageLimitID = service.getAgeLimitID();
                int childAge = child.getAge();
                
                if (ageLimitID == 1 && childAge < 1) {
                } else if (ageLimitID == 2 && childAge >= 1 && childAge < 6) {
                } else if (ageLimitID == 3 && childAge >= 6 && childAge < 13) {
                } else if (ageLimitID == 4 && childAge >= 13 && childAge < 18) {
                }
                // Check for time conflicts
                ReservationDAO reservationDAO = new ReservationDAO();

                // Check if child has any conflicting appointments
                if (reservationDAO.hasChildTimeConflict(reservationDate, startTime, childID, service.getDuration())) {
                    request.setAttribute("errorMessage", "Trẻ đã có lịch khám trong khoảng thời gian này. Vui lòng chọn thời gian khác.");
                    reloadFormData(request, response, user, service);
                    return;
                }
                
                // Check if staff is already booked for this exact time on this date
                if (!reservationDAO.isStaffAvailable(reservationDate, startTime, staffID)) {
                    request.setAttribute("errorMessage", "Bác sĩ đã có lịch hẹn vào thời điểm này. Vui lòng chọn bác sĩ khác hoặc thời gian khác.");
                    // Reload necessary data for the form
                    reloadFormData(request, response, user, service);
                    return;
                }

                // Only check for time conflicts if it's the same date and same staff
                if (reservationDAO.hasTimeConflict(reservationDate, startTime, staffID, service.getDuration())) {
                    request.setAttribute("errorMessage", "Bác sĩ đã có lịch hẹn trong khoảng thời gian này. Vui lòng chọn thời gian khác.");
                    // Reload necessary data for the form
                    reloadFormData(request, response, user, service);
                    return;
                }

                // Lưu thông tin vào session để dùng cho thanh toán
                session.setAttribute("reservationInfo", new HashMap<String, Object>() {{
                    put("serviceID", serviceID);
                    put("service", service);
                    put("childID", childID);
                    put("startTime", startTime);
                    put("reservationDate", reservationDate);
                    put("staffID", staffID);
                }});

                if ("CheckOut".equals(paymentMethod)) {
                    // Thanh toán offline - tạo reservation ngay
                    OrderDAO orderDAO = new OrderDAO();
                    Order order = new Order(0, user.getUserID(), 1, service.getPrice(), "", false);
                    order = orderDAO.addOrder(order);

                    OrderItem orderItem = new OrderItem(0, order.getOrderID(), serviceID, childID);
                    orderItem = orderDAO.addOrderItem(orderItem);

                    Reservation reservation = new Reservation(
                        0, 
                        orderItem.getOrderItemID(),
                        reservationDate,
                        startTime,
                        staffID,
                        false,
                        false
                    );
                    
                    if (reservationDAO.addReservation(reservation)) {
                        // Tạo payment record với status PENDING
                        Payment payment = new Payment();
                        payment.setReservationId(reservation.getReservationID());
                        payment.setOrderId(order.getOrderID());
                        payment.setAmount(service.getPrice());
                        payment.setPaymentStatus("PENDING");
                        payment.setPaymentMethod("OFFLINE");
                        
                        PaymentDAO paymentDAO = new PaymentDAO();
                        paymentDAO.createPayment(payment);
                        
                        response.sendRedirect(request.getContextPath() + "/customer/listreservations");
                    }
                } else {
                    // Thanh toán online - chuyển đến trang thanh toán
                    response.sendRedirect(request.getContextPath() + "/payment");
                }

            } catch (Exception e) {
                request.setAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
                request.getRequestDispatcher("/Common_JSP/home-add-reservation.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login");
        }
    }

    // Add this helper method to reduce code duplication
    private void reloadFormData(HttpServletRequest request, HttpServletResponse response, 
                              Users user, Service service) throws ServletException, IOException {
        ChildrenDAO childrenDAO = new ChildrenDAO();
        StaffDAO staffDAO = new StaffDAO();
        AgeLimitDAO ageDAO = new AgeLimitDAO();
        
        AgeLimits ageLimit = ageDAO.getAgeLimitByID(service.getAgeLimitID());
        List<Children> allChildren = childrenDAO.getAgeOfChildrenByCustomerID(user.getUserID());
        List<Children> childrenByAge = new ArrayList<>();
        
        // Filter children by age
        for (Children child : allChildren) {
            int age = child.getAge();
            if (service.getAgeLimitID() == 1 && age < 1) {
                childrenByAge.add(child);
            } else if (service.getAgeLimitID() == 2 && age >= 1 && age < 6) {
                childrenByAge.add(child);
            } else if (service.getAgeLimitID() == 3 && age >= 6 && age < 13) {
                childrenByAge.add(child);
            } else if (service.getAgeLimitID() == 4 && age >= 13 && age < 18) {
                childrenByAge.add(child);
            }
        }
        
        List<Staff> staffs = staffDAO.getStaffByDegreeID(service.getDegreeID());
        
        request.setAttribute("service", service);
        request.setAttribute("ageLimit", ageLimit);
        request.setAttribute("children", childrenByAge);
        request.setAttribute("staffs", staffs);
        
        request.getRequestDispatcher("/Common_JSP/home-add-reservation.jsp").forward(request, response);
    }
}
