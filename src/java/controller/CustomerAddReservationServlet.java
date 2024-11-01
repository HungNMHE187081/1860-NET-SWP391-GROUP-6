package controller;

import dal.AgeLimitDAO;
import dal.ChildrenDAO;
import dal.ReservationDAO;
import dal.ServiceDAO;
import dal.StaffDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.AgeLimits;
import model.Children;
import model.Reservation;
import model.Service;
import model.Users;

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
                switch (service.getAgeLimitID()) {
                    case 1: if (age < 1) childrenByAge.add(child); break;
                    case 2: if (age >= 1 && age < 6) childrenByAge.add(child); break;
                    case 3: if (age >= 6 && age < 13) childrenByAge.add(child); break;
                    case 4: if (age >= 13 && age < 18) childrenByAge.add(child); break;
                }
            }

            StaffDAO staffDAO = new StaffDAO();
            request.setAttribute("ageLimit", ageLimit);
            request.setAttribute("service", service);
            request.setAttribute("children", childrenByAge);
            request.setAttribute("staffs", staffDAO.getAllStaffs());

            request.getRequestDispatcher("/Common_JSP/home-add-reservation.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reservationDate = request.getParameter("reservationDate");
        String startTime = request.getParameter("startTime");
        String staffIdStr = request.getParameter("staffID");
        String childIdStr = request.getParameter("childID");
        String errorMessage = null;

        try {
            int staffId = Integer.parseInt(staffIdStr);
            int childId = Integer.parseInt(childIdStr);

            Reservation reservation = new Reservation();
            reservation.setReservationDate(reservationDate);
            reservation.setStartTime(startTime);
            reservation.setStaffID(staffId);
            reservation.setIsExam(false);
            reservation.setHasRecord(false);

            ReservationDAO reservationDAO = new ReservationDAO();
            reservationDAO.addReservation(reservation);

         
        } catch (NumberFormatException e) {
            errorMessage = "Dữ liệu đầu vào không hợp lệ.";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/Common_JSP/home-add-reservation.jsp").forward(request, response);
        } catch (Exception e) {
            errorMessage = "Có lỗi xảy ra khi xử lý yêu cầu.";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/Common_JSP/home-add-reservation.jsp").forward(request, response);
        }
    }
}
