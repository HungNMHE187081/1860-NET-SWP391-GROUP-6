/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class BlogComment {

    private int commentID;
    private int blogID;
    private Users user;
    private String content;
    private List<BlogComment> replies;
    private Timestamp createdDate;
    private BlogComment parent;
   private int isApproved;
    public BlogComment() {

    }

    public BlogComment(int commentID, int blogID, Users user, String content, List<BlogComment> replies, Timestamp createdDate, BlogComment parent, int isApproved) {
        this.commentID = commentID;
        this.blogID = blogID;
        this.user = user;
        this.content = content;
        this.replies = replies;
        this.createdDate = createdDate;
        this.parent = parent;
        this.isApproved = isApproved;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getBlogID() {
        return blogID;
    }

    public void setBlogID(int blogID) {
        this.blogID = blogID;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<BlogComment> getReplies() {
        return replies;
    }

    public void setReplies(List<BlogComment> replies) {
        this.replies = replies;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public BlogComment getParent() {
        return parent;
    }

    public void setParent(BlogComment parent) {
        this.parent = parent;
    }

    public int getIsApproved() {
        return isApproved;
    }

    public void setIsApproved(int isApproved) {
        this.isApproved = isApproved;
    }

   

}
