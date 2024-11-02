package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public class CustomerRemoveFromCartServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        try {
            int index = Integer.parseInt(request.getParameter("index"));
            List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
            
            if (cart != null && index >= 0 && index < cart.size()) {
                cart.remove(index);
                session.setAttribute("cart", cart);
            }
            
            response.sendRedirect(request.getContextPath() + "/customer/viewcart");
            
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid cart item index", e);
        }
    }
}
