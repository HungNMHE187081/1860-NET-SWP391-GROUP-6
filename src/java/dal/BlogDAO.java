package dal;

import model.Blog;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.BlogCategory;
import model.BlogCategoryMapping;

public class BlogDAO extends DBContext {

public void addBlog(Blog blog, int categoryID) {
    String sql = "INSERT INTO Blogs (Title, Content, AuthorName, IsPublished, ThumbnailPath, Views, CreatedDate) VALUES (?, ?, ?, ?, ?, ?, GETDATE())";
    String categoryMappingSql = "INSERT INTO BlogCategoryMapping (BlogID, CategoryID) VALUES (?, ?)";

    try (PreparedStatement pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
        // Set blog details
        pstmt.setString(1, blog.getTitle());
        pstmt.setString(2, blog.getContent());
        pstmt.setString(3, blog.getAuthorName());
        pstmt.setBoolean(4, blog.getIsPublished());
        pstmt.setString(5, blog.getThumbnailPath());
        pstmt.setInt(6, 0); // Default views to 0
        
        // Execute insertion into Blogs table
        int rowsAffected = pstmt.executeUpdate();
        
        // Retrieve generated BlogID
        try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                int blogID = generatedKeys.getInt(1);
                
                // Insert into BlogCategoryMapping
                try (PreparedStatement categoryStmt = connection.prepareStatement(categoryMappingSql)) {
                    categoryStmt.setInt(1, blogID);
                    categoryStmt.setInt(2, categoryID);
                    categoryStmt.executeUpdate();
                }
            } else {
                System.out.println("Failed to retrieve BlogID after insertion into Blogs table.");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}


public Blog getBlogById(int blogID) {
    Blog blog = null;
    String sql = "SELECT b.*, bc.CategoryName " +
                 "FROM Blogs b " +
                 "LEFT JOIN BlogCategoryMapping bcm ON b.BlogID = bcm.BlogID " +
                 "LEFT JOIN BlogCategories bc ON bcm.CategoryID = bc.CategoryID " +
                 "WHERE b.BlogID = ?";

    try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
        pstmt.setInt(1, blogID);
        ResultSet rs = pstmt.executeQuery();

        List<BlogCategory> categories = new ArrayList<>();

        while (rs.next()) {
            if (blog == null) {
                blog = new Blog();
                blog.setBlogID(rs.getInt("BlogID"));
                blog.setTitle(rs.getString("Title"));
                blog.setContent(rs.getString("Content"));
                blog.setAuthorName(rs.getString("AuthorName"));
                blog.setCreatedDate(rs.getDate("CreatedDate"));
                blog.setUpdatedDate(rs.getDate("UpdatedDate"));
                blog.setIsPublished(rs.getBoolean("IsPublished"));
                blog.setThumbnailPath(rs.getString("ThumbnailPath"));
                blog.setViews(rs.getInt("Views"));
            }

            // Create BlogCategory object for each associated category
            BlogCategory category = new BlogCategory();
            category.setCategoryName(rs.getString("CategoryName"));
            categories.add(category);
        }

          blog.setCategories(categories); 

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return blog;
}

public List<BlogCategory> getAllBlogCategory(){
    List<BlogCategory> lst = new ArrayList<>();
String sql = "Select * from BlogCategories";
try{
    PreparedStatement pre = connection.prepareStatement(sql);
    ResultSet rs = pre.executeQuery();
    while(rs.next()){
        BlogCategory cate = new  BlogCategory();
        cate.setCategoryID(rs.getInt("CategoryID"));
        cate.setCategoryName(rs.getString("CategoryName"));
        lst.add(cate);
    }
}catch(SQLException e){
    e.printStackTrace();
}
return lst;
}


 public List<Blog> getAllBlogs() {
        List<Blog> blogList = new ArrayList<>();
        String sql = "SELECT * FROM Blogs";

        try (
             PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setBlogID(rs.getInt("BlogID"));
                blog.setTitle(rs.getString("Title"));
                blog.setContent(rs.getString("Content"));
                blog.setAuthorName(rs.getString("AuthorName"));
                blog.setCreatedDate(rs.getDate("CreatedDate"));
                blog.setUpdatedDate(rs.getDate("UpdatedDate"));
                blog.setIsPublished(rs.getBoolean("IsPublished"));
                blog.setThumbnailPath(rs.getString("ThumbnailPath"));
                System.out.println("Blog ID: " + blog.getBlogID() + ", Is Published: " + blog.getIsPublished()); // Kiểm tra
                blog.setViews(rs.getInt("Views"));

                blogList.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return blogList;
    }
 public boolean deleteBlog(int blogID) throws SQLException {
        String sql = "DELETE FROM Blogs WHERE blogID = ?";
        String sqlDeleteMapping = "Delete from BlogCategoryMapping Where BlogID = ?";
       try {
        // Begin transaction
        connection.setAutoCommit(false);
        
        // First, delete from BlogCategoryMapping
        try (PreparedStatement pstmtMapping = connection.prepareStatement(sqlDeleteMapping)) {
            pstmtMapping.setInt(1, blogID);
            pstmtMapping.executeUpdate();
        }

        // Next, delete from Blogs
        try (PreparedStatement pstmtBlog = connection.prepareStatement(sql)) {
            pstmtBlog.setInt(1, blogID);
            int rowsAffected = pstmtBlog.executeUpdate();
            
            // Commit transaction
            connection.commit();
            return rowsAffected > 0;
        }
        
    }  catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            // Đặt lại chế độ auto-commit
            connection.setAutoCommit(true);
        }
    }
 
  public void updateBlog(Blog blog) {
        String sql = "UPDATE Blogs SET Title = ?, Content = ?, AuthorName = ?, UpdatedDate = GETDATE(), IsPublished = ?, ThumbnailPath = ?, Views = ? WHERE BlogID = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, blog.getTitle());
            pstmt.setString(2, blog.getContent());
            pstmt.setString(3, blog.getAuthorName());
            pstmt.setBoolean(4, blog.getIsPublished());
            pstmt.setString(5, blog.getThumbnailPath());
            pstmt.setInt(6, blog.getViews());
            pstmt.setInt(7, blog.getBlogID());

            pstmt.executeUpdate(); // Thực thi câu lệnh cập nhật
        } catch (SQLException e) {
            e.printStackTrace(); // In ra thông báo lỗi nếu có
            // Bạn có thể xử lý ngoại lệ ở đây, chẳng hạn như ném một ngoại lệ tùy chỉnh hoặc log lỗi.
        }
    }
  public static void main(String[] args) {
        BlogDAO blogDAO = new BlogDAO();
       
        // Lấy danh sách các blog
        int n = 8;
        Blog b = blogDAO.getBlogById(n);
         BlogCategory category = b.getCategories().get(0);
        System.out.println(category.getCategoryName());
      
        // In danh sách blog ra console
//        for (Blog blog : blogs) {
//            System.out.println("Blog ID: " + blog.getBlogID());
//            System.out.println("Title: " + blog.getTitle());
//            System.out.println("Author: " + blog.getAuthorName());
//            System.out.println("Created Date: " + blog.getCreatedDate());
//            System.out.println("Is Published: " + blog.isPublished());
//            System.out.println("Image: " + blog.getThumbnailPath());
//            System.out.println("Views: " + blog.getViews());
//            System.out.println("-----------------------------------");
//        }
           
    }
}
