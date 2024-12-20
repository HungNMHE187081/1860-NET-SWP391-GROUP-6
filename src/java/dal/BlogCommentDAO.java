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
public class BlogCommentDAO extends DBContext {

    public List<BlogComment> getBlogCommentsByBlogId(int blogID) throws SQLException {
        List<BlogComment> comments = new ArrayList<>();

        String query = """
                SELECT bc.CommentID, bc.BlogID, bc.UserID, bc.Content, bc.CreatedDate, bc.parentID,
                       u.UserID, u.FirstName, u.MiddleName, u.LastName, u.Email, u.PhoneNumber, u.ProfileImage
                FROM BlogComments bc
                JOIN Users u ON bc.UserID = u.UserID
                WHERE bc.BlogID = ? AND bc.parentID IS NULL
                       AND bc.IsApproved = 1
                ORDER BY bc.CreatedDate DESC;
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
    public List<BlogComment> getReplies(int parentID) throws SQLException {
        List<BlogComment> replies = new ArrayList<>();

        String query = """
                SELECT bc.CommentID, bc.BlogID, bc.UserID, bc.Content, bc.CreatedDate, bc.parentID,
                       u.UserID, u.FirstName, u.MiddleName, u.LastName, u.Email, u.PhoneNumber, u.ProfileImage
                FROM BlogComments bc
                JOIN Users u ON bc.UserID = u.UserID
                WHERE bc.parentID = ?
                AND bc.IsApproved = 1
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


    public void addComment(BlogComment comment) {
        String sql = "INSERT INTO BlogComments(CreatedDate, Content, BlogID, UserID, parentID,IsApproved) VALUES (GETDATE(), ?, ?, ?, ?, 1)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, comment.getContent());
            ps.setInt(2, comment.getBlogID());
            ps.setInt(3, comment.getUser().getUserID());
            if (comment.getParent() != null) {
                ps.setInt(4, comment.getParent().getCommentID());
            } else {
                ps.setNull(4, java.sql.Types.INTEGER);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateComment(BlogComment comment) {
        String sql = "UPDATE BlogComments SET Content = ?, CreatedDate = GETDATE() WHERE CommentID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, comment.getContent());
            ps.setInt(2, comment.getCommentID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteComment(int commentID) {
        String sql = "DELETE FROM BlogComments WHERE CommentID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, commentID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteReplies(int parentId) {
        String sql = "DELETE FROM BlogComments WHERE parentID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, parentId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
      public List<BlogComment> getBlogCommentsByBlogIdForManager(int blogID) throws SQLException {
        List<BlogComment> comments = new ArrayList<>();

        String query = """
                SELECT bc.CommentID, bc.BlogID, bc.UserID, bc.Content, bc.CreatedDate, bc.parentID, bc.IsApproved,
                       u.UserID, u.FirstName, u.MiddleName, u.LastName, u.Email, u.PhoneNumber, u.ProfileImage
                FROM BlogComments bc
                JOIN Users u ON bc.UserID = u.UserID
                WHERE bc.BlogID = ? AND bc.parentID IS NULL
                ORDER BY bc.CreatedDate DESC;
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
                    comment.setReplies(getRepliesForManager(comment.getCommentID()));
                    comment.setIsApproved(rs.getInt("IsApproved"));

                    comments.add(comment);
                }
            }
        }
        return comments;
    }

    // Hàm lấy danh sách các trả lời cho một bình luận
    public List<BlogComment> getRepliesForManager(int parentID) throws SQLException {
        List<BlogComment> replies = new ArrayList<>();

        String query = """
                SELECT bc.CommentID, bc.BlogID, bc.UserID, bc.Content, bc.CreatedDate, bc.parentID, bc.IsApproved,
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
                    reply.setIsApproved(rs.getInt("IsApproved"));

                    replies.add(reply);
                }
            }
        }
        return replies;
    }
     public void changeCommentStatus(int commentId, boolean isApproved) throws SQLException {
        String sql = "UPDATE BlogComments SET IsApproved = ? WHERE CommentID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setBoolean(1, isApproved);
            ps.setInt(2, commentId);
            ps.executeUpdate();
        }
    }

}
