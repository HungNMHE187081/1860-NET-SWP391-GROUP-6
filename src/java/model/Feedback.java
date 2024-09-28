package model;

import java.util.Date;

public class Feedback {
    int FeedbackID, UserID, ServiceID, Rating;
    String Comment;
    String FeedbackDate;

    public Feedback() {
    }

    public Feedback(int FeedbackID, int UserID, int ServiceID, int Rating, String Comment, String FeedbackDate) {
        this.FeedbackID = FeedbackID;
        this.UserID = UserID;
        this.ServiceID = ServiceID;
        this.Rating = Rating;
        this.Comment = Comment;
        this.FeedbackDate = FeedbackDate;
    }

    public int getFeedbackID() {
        return FeedbackID;
    }

    public void setFeedbackID(int FeedbackID) {
        this.FeedbackID = FeedbackID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getServiceID() {
        return ServiceID;
    }

    public void setServiceID(int ServiceID) {
        this.ServiceID = ServiceID;
    }

    public int getRating() {
        return Rating;
    }

    public void setRating(int Rating) {
        this.Rating = Rating;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String Comment) {
        this.Comment = Comment;
    }

    public String getFeedbackDate() {
        return FeedbackDate;
    }

    public void setFeedbackDate(String FeedbackDate) {
        this.FeedbackDate = FeedbackDate;
    }

    
}