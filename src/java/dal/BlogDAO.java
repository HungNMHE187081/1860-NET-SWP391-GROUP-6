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
public List<Blog> getBlogsByCategory(int categoryId) {
    List<Blog> blogs = new ArrayList<>();
    String sql = "SELECT b.* " +
                 "FROM Blogs b " +
                 "INNER JOIN BlogCategoryMapping bcm ON b.BlogID = bcm.BlogID " +
                 "WHERE bcm.CategoryID = ?";
                 
    try (
         PreparedStatement pstmt = connection.prepareStatement(sql)) {
        
        pstmt.setInt(1, categoryId);
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            Blog blog = new Blog();
            blog.setBlogID(rs.getInt("BlogID"));
            blog.setTitle(rs.getString("Title"));
            blog.setContent(rs.getString("Content"));
            blog.setAuthorName(rs.getString("AuthorName"));
            blog.setCreatedDate(rs.getTimestamp("CreatedDate"));
            blog.setUpdatedDate(rs.getTimestamp("UpdatedDate"));
            blog.setIsPublished(rs.getBoolean("IsPublished"));
            blog.setThumbnailPath(rs.getString("ThumbnailPath"));
            blog.setViews(rs.getInt("Views"));
            
            blogs.add(blog);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return blogs;
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
 public List<Blog> getAllBlogsWhereActive() {
        List<Blog> blogList = new ArrayList<>();
        String sql = "SELECT * FROM Blogs Where IsPublished = 1";

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
        String sql = "UPDATE Blogs SET Title = ?, Content = ?, AuthorName = ?, UpdatedDate = GETDATE(), IsPublished = ?, ThumbnailPath = ? WHERE BlogID = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, blog.getTitle());
            pstmt.setString(2, blog.getContent());
            pstmt.setString(3, blog.getAuthorName());
            pstmt.setBoolean(4, blog.getIsPublished());
            pstmt.setString(5, blog.getThumbnailPath());
            pstmt.setInt(6, blog.getBlogID());

            pstmt.executeUpdate(); // Thực thi câu lệnh cập nhật
        } catch (SQLException e) {
            e.printStackTrace(); // In ra thông báo lỗi nếu có
            // Bạn có thể xử lý ngoại lệ ở đây, chẳng hạn như ném một ngoại lệ tùy chỉnh hoặc log lỗi.
        }
    }
  public void updateBlogCategoryMapping(int blogID, int categoryID) {
    String sql = "UPDATE BlogCategoryMapping SET CategoryID = ? WHERE BlogID = ?";
    try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
        pstmt.setInt(1, categoryID);
        pstmt.setInt(2, blogID);
        pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
public List<Blog> getLatestBlogs() throws SQLException {
        List<Blog> latestBlogs = new ArrayList<>();
        
        // SQL query to get the top 3 latest blogs
        String query = "SELECT TOP 3 * FROM Blogs ORDER BY CreatedDate DESC";
        
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            
            // Loop through the result set and create Blog objects
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
                blog.setViews(rs.getInt("Views"));

                // Add the blog to the list
                latestBlogs.add(blog);
            }
        }

        return latestBlogs;
    }
public List<Blog> getRelatedBlogs(int blogID) {
        List<Blog> relatedBlogs = new ArrayList<>();

        String sql = """
            SELECT b.BlogID, b.Title, b.Content, b.AuthorName, b.CreatedDate, b.UpdatedDate, 
                   b.IsPublished, b.ThumbnailPath, b.Views
            FROM Blogs b
            JOIN BlogCategoryMapping bcm1 ON b.BlogID = bcm1.BlogID
            JOIN BlogCategoryMapping bcm2 ON bcm1.CategoryID = bcm2.CategoryID
            WHERE bcm2.BlogID = ? AND b.BlogID != ?
            GROUP BY b.BlogID, b.Title, b.Content, b.AuthorName, b.CreatedDate, 
                     b.UpdatedDate, b.IsPublished, b.ThumbnailPath, b.Views
            """;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, blogID);
            stmt.setInt(2, blogID);

            try (ResultSet rs = stmt.executeQuery()) {
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
                    blog.setViews(rs.getInt("Views"));

                    // Fetch and set categories for this blog
                    blog.setCategories(getCategoriesForBlog(blog.getBlogID()));

                    relatedBlogs.add(blog);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return relatedBlogs;
    }

    private List<BlogCategory> getCategoriesForBlog(int blogID) {
        List<BlogCategory> categories = new ArrayList<>();
        String sql = """
            SELECT bc.CategoryID, bc.CategoryName
            FROM BlogCategories bc
            JOIN BlogCategoryMapping bcm ON bc.CategoryID = bcm.CategoryID
            WHERE bcm.BlogID = ?
            """;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, blogID);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    BlogCategory category = new BlogCategory();
                    category.setCategoryID(rs.getInt("CategoryID"));
                    category.setCategoryName(rs.getString("CategoryName"));
                    categories.add(category);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return categories;
    }
public void increaseView(int blogID) {
    String sql = "UPDATE Blogs SET Views = Views + 1 WHERE BlogID = ?";
    try (
         PreparedStatement stmt = connection.prepareStatement(sql)) {
        stmt.setInt(1, blogID);
        stmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

  public static void main(String[] args) {
       int blogID = 2;
       BlogDAO dao = new BlogDAO();
       dao.increaseView(blogID);
       System.out.println("Success");
           
    }
}
