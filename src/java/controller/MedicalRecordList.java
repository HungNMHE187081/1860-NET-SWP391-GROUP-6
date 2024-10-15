package controller;


import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.MedicalRecord;
import model.MedicalRecordDAO;

/**
 *
 * @author User
 */
public class MedicalRecordList extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MedicalRecordList</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MedicalRecordList at " + request.getContextPath() + "</h1>");
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
        MedicalRecordDAO dao = new MedicalRecordDAO();

        // Lấy tên trẻ từ tham số yêu cầu
        String childName = request.getParameter("search");
        String month = request.getParameter("month");
        // Lấy tham số để xác định việc sắp xếp
        String sortBy = request.getParameter("sortBy"); // sortBy có thể là "dateAdded" hoặc null

        // Lấy danh sách hồ sơ y tế, có thể lọc theo tên trẻ và tháng
        boolean sortByDateAdded = "dateAdded".equals(sortBy); // Kiểm tra xem có sắp xếp không
        List<MedicalRecord> records = dao.getAllMedicalRecords(childName, month, sortByDateAdded);

        // Đặt thuộc tính cho yêu cầu
        request.setAttribute("records", records);
        
        // Chuyển tiếp đến JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Staff_JSP/medical-record-list.jsp");
        dispatcher.forward(request, response);
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
        processRequest(request, response);
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
