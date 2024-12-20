package controller;

import dal.BlogDAO;
import dal.FeedbackDAO;
import dal.MedicineDAO;
import dal.ServiceDAO;
import dal.StaffDAO;
import dal.DegreeDAO;
import dal.SpecializationDAO;
import dal.ManagerUserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Blog;
import model.Feedback;
import model.Medicine;
import model.MedicineCategory;
import model.Service;
import model.Staff;
import model.Degree;
import model.Specialization;
import model.Users;

/**
 * Servlet implementation class GuestHomepageServlet
 */
public class HomepageFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GuestHomepageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuestHomepageServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        List<Feedback> feedbackList = feedbackDAO.getAllFeedbacks();
        request.setAttribute("feedbackList", feedbackList);

        ServiceDAO serviceDAO = new ServiceDAO();
        List<Service> services = serviceDAO.getAllServices();
        request.setAttribute("services", services);

        // Fetch the medicine list
        MedicineDAO medicineDAO = new MedicineDAO();
        List<Medicine> medicineList = medicineDAO.getMedicines(1, 5, null, null, null, null); // Adjust parameters as needed
        request.setAttribute("medicineList", medicineList);

        // Fetch the categories
        List<MedicineCategory> categories = medicineDAO.getAllCategories();
        request.setAttribute("categories", categories);

        // Fetch the staff list, degrees, and specializations
        StaffDAO staffDAO = new StaffDAO();
        List<Staff> stafflist = staffDAO.getAllStaffs();
        DegreeDAO degreeDAO = new DegreeDAO();
        List<Degree> degrees = degreeDAO.getAllDegrees();
        SpecializationDAO specializationDAO = new SpecializationDAO();
        List<Specialization> specializations = specializationDAO.getAllSpecializations();
        ManagerUserDAO managerUserDAO = new ManagerUserDAO();
        List<Users> users = new ArrayList<>();
        List<Staff> staffs = new ArrayList<>();
        for (Staff staff : stafflist){
            if (staff.getStaffName() != null)
                staffs.add(staff);
            users.add(managerUserDAO.getDetailUserByUserID(staff.getStaffID()));
        }
        
        Collections.sort(staffs, new Comparator<Staff>() {
            @Override
            public int compare(Staff s1, Staff s2) {
                return s1.getStaffName().compareTo(s2.getStaffName());
            }
        });

        request.setAttribute("staffs", staffs);
        request.setAttribute("users", users);
        request.setAttribute("degrees", degrees);
        request.setAttribute("specializations", specializations);

        // Fetch the blog list
        BlogDAO blogDAO = new BlogDAO();
        List<Blog> blogList = blogDAO.getAllBlogs();
        request.setAttribute("blogList", blogList);

        request.getRequestDispatcher("/Common_JSP/homepage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}