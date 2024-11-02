/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ChildrenDAO;
import dal.ServiceDAO;
import dal.StaffDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import model.Children;
import model.Service;
import model.Staff;
import model.Users;

@WebServlet(name = "CustomerViewCartServlet", urlPatterns = {"/customer/viewcart"})
public class CustomerViewCartServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        System.out.println("Debug: ViewCart Servlet accessed"); // Add debug log

        if (user != null) {
            try {
                // Get cart from session, initialize if null
                List<Map<String, Object>> cartItems = (List<Map<String, Object>>) session.getAttribute("cart");
                System.out.println("Debug: Cart items: " + (cartItems != null ? cartItems.size() : "null")); // Add debug log
                double totalAmount = 0;
                
                // Nếu cart null thì khởi tạo mới thay vì báo lỗi
                if (cartItems == null) {
                    request.getRequestDispatcher("/Common_JSP/home-view-cart.jsp").forward(request, response);
                    return;
                }

                if (!cartItems.isEmpty()) {
                    ServiceDAO serviceDAO = new ServiceDAO();
                    ChildrenDAO childrenDAO = new ChildrenDAO();
                    StaffDAO staffDAO = new StaffDAO();
                    
                    for (Map<String, Object> item : cartItems) {
                        try {
                            int serviceID = (Integer) item.get("serviceID");
                            int childID = (Integer) item.get("childID");
                            int staffID = (Integer) item.get("staffID");
                            
                            Service service = serviceDAO.getServiceByID(serviceID);
                            Children child = childrenDAO.getChildrenByID(childID);
                            Staff staff = staffDAO.getStaffByID(staffID);
                            
                            if (service != null && child != null && staff != null) {
                                item.put("service", service);
                                item.put("child", child);
                                item.put("staff", staff);
                                totalAmount += service.getPrice();
                            }
                        } catch (Exception e) {
                            // Log lỗi nhưng không dừng xử lý
                            e.printStackTrace();
                            continue;
                        }
                    }
                }
                
                request.setAttribute("cartItems", cartItems);
                request.setAttribute("totalAmount", totalAmount);
                request.getRequestDispatcher("/Common_JSP/home-view-cart.jsp").forward(request, response);
                
            } catch (Exception e) {
                System.out.println("Error in ViewCart: " + e.getMessage()); // Add error log
                e.printStackTrace();
                // Redirect về trang giỏ hàng trống thay vì báo lỗi
                request.getRequestDispatcher("/Common_JSP/home-view-cart.jsp").forward(request, response);
            }
        } else {
            System.out.println("Debug: User not logged in"); // Add debug log
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Handle POST request if needed
    }
}
