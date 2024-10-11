package model;

import java.sql.Timestamp;
import java.util.Date;

public class Blog {
    private int blogID;
    private String title;
    private String content;
    private String authorName;
    private Date createdDate;
    private Date updatedDate;
    private Boolean isPublished;
    private String thumbnailPath;
    private int views;

    // Constructors, Getters and Setters
    public Blog() {}

    public Blog(int blogID, String title, String content, String authorName, Date createdDate, Date updatedDate, Boolean isPublished, String thumbnailPath, int views) {
        this.blogID = blogID;
        this.title = title;
        this.content = content;
        this.authorName = authorName;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.isPublished = isPublished;
        this.thumbnailPath = thumbnailPath;
        this.views = views;
    }

    public Blog(String title, String content, String authorName, String thumbnailPath) {
        this.title = title;
        this.content = content;
        this.authorName = authorName;
        this.thumbnailPath = thumbnailPath;
    }

    public int getBlogID() {
        return blogID;
    }

    public void setBlogID(int blogID) {
        this.blogID = blogID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public Boolean getIsPublished() {
    return isPublished;
}

    public void setIsPublished(Boolean isPublished) {
        this.isPublished = isPublished;
    }

    public String getThumbnailPath() {
        return thumbnailPath;
    }

    public void setThumbnailPath(String thumbnailPath) {
        this.thumbnailPath = thumbnailPath;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }


}

