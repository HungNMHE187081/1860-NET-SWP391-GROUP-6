package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;

public class FeedbackDAO extends DBContext {
    public List<Feedback> getAllFeedbacks() {
        List<Feedback> listFeedback = new ArrayList<>();
        String sql = "SELECT * FROM Feedback";
        
        try (PreparedStatement pre = connection.prepareStatement(sql);
             ResultSet rs = pre.executeQuery()) {
             
            while (rs.next()) {
                int FeedbackID = rs.getInt("FeedbackID");
                int UserID = rs.getInt("UserID");
                int ServiceID = rs.getInt("ServiceID");
                int Rating = rs.getInt("Rating");
                String Comment = rs.getString("Comment");
                String FeedbackDate = rs.getString("FeedbackDate");
                listFeedback.add(new Feedback(FeedbackID, UserID, ServiceID, Rating, Comment, FeedbackDate));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging the error or rethrowing a custom exception
        }
        return listFeedback;
    }

    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        System.out.println(dao.getAllFeedbacks().size());
    }
}