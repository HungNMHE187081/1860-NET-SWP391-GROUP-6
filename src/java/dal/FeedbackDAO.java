package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Feedback;

public class FeedbackDAO extends DBContext {

    public List<Feedback> getAllFeedbacks() {
        List<Feedback> listFeedback = new ArrayList<>();
        String sql = "SELECT * FROM Feedback";

        try (PreparedStatement pre = connection.prepareStatement(sql); ResultSet rs = pre.executeQuery()) {

            while (rs.next()) {
                int FeedbackID = rs.getInt("FeedbackID");
                int UserID = rs.getInt("UserID");
                int ServiceID = rs.getInt("ServiceID");
                String UserName = rs.getString("UserName");
                String Email = rs.getString("Email");
                String PhoneNumber = rs.getString("PhoneNumber");
                int Rating = rs.getInt("Rating");
                String ExperienceRating = rs.getString("ExperienceRating");
                String Comment = rs.getString("Comment");
                String Suggestion = rs.getString("Suggestion");
                String AttachmentPath = rs.getString("AttachmentPath");
//                Date FeedbackDate = rs.getDate("FeedbackDate");
                boolean Status = rs.getBoolean("Status");

                listFeedback.add(new Feedback(FeedbackID, UserID, ServiceID, UserName, Email, PhoneNumber, Rating, ExperienceRating, Comment, Suggestion, AttachmentPath, Status));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging the error or rethrowing a custom exception
        }
        return listFeedback;
    }

    public void insertFeedback(Feedback feedback) {
        String sql = "INSERT INTO Feedback (UserID, ServiceID, UserName, Email, PhoneNumber, Rating, ExperienceRating, Comment, Suggestion, AttachmentPath, Status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";

        try (PreparedStatement pre = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pre.setInt(1, feedback.getUserID());
            pre.setInt(2, feedback.getServiceID());
            pre.setString(3, feedback.getUserName());
            pre.setString(4, feedback.getEmail());
            pre.setString(5, feedback.getPhoneNumber());
            pre.setInt(6, feedback.getRating());
            pre.setString(7, feedback.getExperienceRating());
            pre.setString(8, feedback.getComment());
            pre.setString(9, feedback.getSuggestion());
            pre.setString(10, feedback.getAttachmentPath());
            pre.executeUpdate();

            try (ResultSet rs = pre.getGeneratedKeys()) {
                if (rs.next()) {
                    feedback.setFeedbackID(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging the error or rethrowing a custom exception
        }
    }

    public List<Feedback> searchFeedbacks(String userName, Integer rating) {
        List<Feedback> listFeedback = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Feedback WHERE 1=1");

        if (userName != null && !userName.trim().isEmpty()) {
            sql.append(" AND UserName LIKE ?");
        }
        if (rating != null) {
            sql.append(" AND Rating = ?");
        }

        try (PreparedStatement pre = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;
            if (userName != null && !userName.trim().isEmpty()) {
                pre.setString(paramIndex++, "%" + userName + "%");
            }
            if (rating != null) {
                pre.setInt(paramIndex++, rating);
            }

            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    int FeedbackID = rs.getInt("FeedbackID");
                    int UserID = rs.getInt("UserID");
                    int ServiceID = rs.getInt("ServiceID");
                    String UserName = rs.getString("UserName");
                    String Email = rs.getString("Email");
                    String PhoneNumber = rs.getString("PhoneNumber");
                    int Rating = rs.getInt("Rating");
                    String ExperienceRating = rs.getString("ExperienceRating");
                    String Comment = rs.getString("Comment");
                    String Suggestion = rs.getString("Suggestion");
                    String AttachmentPath = rs.getString("AttachmentPath");
                    boolean Status = rs.getBoolean("Status");

                    listFeedback.add(new Feedback(FeedbackID, UserID, ServiceID, UserName, Email, PhoneNumber, Rating, ExperienceRating, Comment, Suggestion, AttachmentPath, Status));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging the error or rethrowing a custom exception
        }
        return listFeedback;
    }

    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();

//        System.out.println(dao.searchFeedbacks("John").size());
    }

    public void updatefeedbackstatus(int feedbackID, boolean status) {
        String sql = "UPDATE Feedback SET Status = ? WHERE FeedbackID = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setBoolean(1, status);
            pre.setInt(2, feedbackID);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging the error or rethrowing a custom exception
        }
    }

    public Feedback getFeedbackByID(int feedbackID) {
        String sql = "SELECT * FROM Feedback WHERE FeedbackID = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, feedbackID);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    int UserID = rs.getInt("UserID");
                    int ServiceID = rs.getInt("ServiceID");
                    String UserName = rs.getString("UserName");
                    String Email = rs.getString("Email");
                    String PhoneNumber = rs.getString("PhoneNumber");
                    int Rating = rs.getInt("Rating");
                    String ExperienceRating = rs.getString("ExperienceRating");
                    String Comment = rs.getString("Comment");
                    String Suggestion = rs.getString("Suggestion");
                    String AttachmentPath = rs.getString("AttachmentPath");
                    boolean Status = rs.getBoolean("Status");

                    return new Feedback(feedbackID, UserID, ServiceID, UserName, Email, PhoneNumber, Rating, ExperienceRating, Comment, Suggestion, AttachmentPath, Status);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging the error or rethrowing a custom exception
        }
        return null;
    }
}
