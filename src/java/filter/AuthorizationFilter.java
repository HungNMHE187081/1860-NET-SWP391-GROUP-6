package filter;

import java.io.IOException;
import java.util.List;
import java.util.Arrays;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Users;
import dal.UserDAO;

public class AuthorizationFilter implements Filter {

    private static final String LOGIN_URL = "/login";
    private static final String UNAUTHORIZED_URL = "/unauthorized";
    private UserDAO userDAO;
    private static final List<String> PUBLIC_URLS = Arrays.asList(
            LOGIN_URL,
            "/register",
            "/resetpassword",
            "/forgotpassword",
            "/guest/homepage",
            "/guest/services",
            "/guest/feedback",
            "/guest/view-staffs",
            "/guest/bloglist",
            "/guest/detailguestblog",
            "/guest/viewservice",
            "/guest/detailservice",
            "/unauthorized",
            "/logout",
            "/login"
    );

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        userDAO = new UserDAO();
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        try {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            HttpSession session = httpRequest.getSession(false);

            String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
            System.out.println("Filtering request to: " + path);

            boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

            // Nếu user đã đăng nhập và cố truy cập trang guest
            if (isLoggedIn && path.startsWith("/guest/")) {
                Users user = (Users) session.getAttribute("user");
                List<String> roles = userDAO.getUserRoles(user.getUserID());

                // Redirect về trang home tương ứng với role
                if (roles.contains("Administrator")) {
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/admin/dashboard");
                } else if (roles.contains("Manager")) {
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/manager/serviceslist");
                } else if (roles.contains("Staff")) {
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/staff/staffhomepage");
                } else if (roles.contains("Customer")) {
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/customer/homepage");
                }
                return;
            }

            // Kiểm tra các resource không cần bảo vệ
            if (!isProtectedResource(httpRequest)) {
                chain.doFilter(request, response);
                return;
            }

            // Xử lý các request khác
            if (isLoggedIn) {
                Users user = (Users) session.getAttribute("user");
                List<String> roles = userDAO.getUserRoles(user.getUserID());
                if (isAuthorized(httpRequest, roles)) {
                    chain.doFilter(request, response);
                } else {
                    httpResponse.sendRedirect(httpRequest.getContextPath() + UNAUTHORIZED_URL);
                }
            } else {
                // Nếu chưa đăng nhập và cố truy cập trang được bảo vệ
                httpResponse.sendRedirect(httpRequest.getContextPath() + LOGIN_URL);
            }
        } catch (Exception e) {
            System.err.println("Error in AuthorizationFilter: " + e.getMessage());
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    private boolean isProtectedResource(HttpServletRequest request) {
        String path = request.getRequestURI().substring(request.getContextPath().length());

        // Check static resources
        if (path.matches(".*\\.(css|js|png|jpg|jpeg|gif|ico|woff|woff2|ttf)$")) {
            return false;
        }

        // Check public URLs
        if (PUBLIC_URLS.contains(path)) {
            return false;
        }

        return true;
    }

    private boolean isAuthorized(HttpServletRequest request, List<String> roles) {
        if (roles == null || roles.isEmpty()) {
            return false;
        }

        String path = request.getRequestURI().substring(request.getContextPath().length());

        // Kiểm tra các đường dẫn được bảo vệ
        if (path.startsWith("/admin/")) {
            return roles.contains("Administrator");
        } else if (path.startsWith("/manager/")) {
            return roles.contains("Manager");
        } else if (path.startsWith("/staff/")) {
            return roles.contains("Staff");
        } else if (path.startsWith("/customer/")) {
            return roles.contains("Customer");
        }

        // Cho phép truy cập các resource công khai
        return !isProtectedResource(request);
    }

    @Override
    public void destroy() {
    }
}
