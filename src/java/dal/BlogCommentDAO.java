/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.BlogComment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Users;


/**
 *
 * @author LENOVO
 */
public class BlogCommentDAO extends DBContext{
     public List<BlogComment> getBlogCommentsByBlogId(int blogID) throws SQLException {
        List<BlogComment> comments = new ArrayList<>();

        String query = """
                SELECT bc.CommentID, bc.BlogID, bc.UserID, bc.Content, bc.CreatedDate, bc.parentID,
                       u.UserID, u.FirstName, u.MiddleName, u.LastName, u.Email, u.PhoneNumber, u.ProfileImage
                FROM BlogComments bc
                JOIN Users u ON bc.UserID = u.UserID
                WHERE bc.BlogID = ? AND bc.parentID IS NULL
                ORDER BY bc.CreatedDate ASC;
                """;

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, blogID);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BlogComment comment = new BlogComment();
                    comment.setCommentID(rs.getInt("CommentID"));
                    comment.setBlogID(rs.getInt("BlogID"));

                    Users user = new Users();
                    user.setUserID(rs.getInt("UserID"));
                    user.setFirstName(rs.getString("FirstName"));
                    user.setMiddleName(rs.getString("MiddleName"));
                    user.setLastName(rs.getString("LastName"));
                    user.setEmail(rs.getString("Email"));
                    user.setPhoneNumber(rs.getString("PhoneNumber"));
                    user.setProfileImage(rs.getString("ProfileImage"));
                    comment.setUser(user);

                    comment.setContent(rs.getString("Content"));
                    comment.setCreatedDate(rs.getTimestamp("CreatedDate"));

                    // Lấy danh sách các trả lời của bình luận này
                    comment.setReplies(getReplies(comment.getCommentID()));

                    comments.add(comment);
                }
            }
        }
        return comments;
    }

    // Hàm lấy danh sách các trả lời cho một bình luận
    private List<BlogComment> getReplies(int parentID) throws SQLException {
        List<BlogComment> replies = new ArrayList<>();

        String query = """
                SELECT bc.CommentID, bc.BlogID, bc.UserID, bc.Content, bc.CreatedDate, bc.parentID,
                       u.UserID, u.FirstName, u.MiddleName, u.LastName, u.Email, u.PhoneNumber, u.ProfileImage
                FROM BlogComments bc
                JOIN Users u ON bc.UserID = u.UserID
                WHERE bc.parentID = ?
                ORDER BY bc.CreatedDate ASC;
                """;

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, parentID);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BlogComment reply = new BlogComment();
                    reply.setCommentID(rs.getInt("CommentID"));
                    reply.setBlogID(rs.getInt("BlogID"));

                    Users user = new Users();
                    user.setUserID(rs.getInt("UserID"));
                    user.setFirstName(rs.getString("FirstName"));
                    user.setMiddleName(rs.getString("MiddleName"));
                    user.setLastName(rs.getString("LastName"));
                    user.setEmail(rs.getString("Email"));
                    user.setPhoneNumber(rs.getString("PhoneNumber"));
                    user.setProfileImage(rs.getString("ProfileImage"));
                    reply.setUser(user);

                    reply.setContent(rs.getString("Content"));
                    reply.setCreatedDate(rs.getTimestamp("CreatedDate"));

                    // Đệ quy để lấy các trả lời con (nếu có)
                    reply.setReplies(getReplies(reply.getCommentID()));

                    replies.add(reply);
                }
            }
        }
        return replies;
    }
    public static void main(String[] args) {
    BlogCommentDAO dao = new BlogCommentDAO();
    int blogId = 1; // Thay đổi ID của bài viết để kiểm tra

    try {
        // Lấy danh sách bình luận theo blogID
        List<BlogComment> comments = dao.getBlogCommentsByBlogId(blogId);

        // In ra thông tin của các bình luận
        for (BlogComment comment : comments) {
            System.out.println("Bình luận ID: " + comment.getCommentID());
            System.out.println("Người dùng: " + comment.getUser().getFirstName() + " " + comment.getUser().getLastName());
            System.out.println("Nội dung: " + comment.getContent());
            System.out.println("Ngày tạo: " + comment.getCreatedDate());

            // In ra các trả lời cho bình luận này
            if (comment.getReplies() != null && !comment.getReplies().isEmpty()) {
                System.out.println("Các trả lời:");
                for (BlogComment reply : comment.getReplies()) {
                    System.out.println("  - Trả lời ID: " + reply.getCommentID());
                    System.out.println("    Người dùng: " + reply.getUser().getFirstName() + " " + reply.getUser().getLastName());
                    System.out.println("    Nội dung: " + reply.getContent());
                    System.out.println("    Ngày tạo: " + reply.getCreatedDate());
                }
            }
            System.out.println(); // Dòng trống để dễ đọc
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
}
