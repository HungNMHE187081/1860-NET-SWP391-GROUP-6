package model;

import java.util.Date;

public class Feedback {
    int FeedbackID, UserID, ServiceID;
    String UserName, Email, PhoneNumber;
    int Rating;
    String ExperienceRating, Comment, Suggestion, AttachmentPath;
//    Date FeedbackDate;
    boolean Status;

    public Feedback() {
    }
    

    public Feedback(int FeedbackID, int UserID, int ServiceID, String UserName, String Email, String PhoneNumber, int Rating, String ExperienceRating, String Comment, String Suggestion, String AttachmentPath, boolean Status) {
        this.FeedbackID = FeedbackID;
        this.UserID = UserID;
        this.ServiceID = ServiceID;
        this.UserName = UserName;
        this.Email = Email;
        this.PhoneNumber = PhoneNumber;
        this.Rating = Rating;
        this.ExperienceRating = ExperienceRating;
        this.Comment = Comment;
        this.Suggestion = Suggestion;
        this.AttachmentPath = AttachmentPath;
//        this.FeedbackDate = FeedbackDate;
        this.Status = Status;
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

//    public Date getFeedbackDate() {
//        return FeedbackDate;
//    }
//
//    public void setFeedbackDate(Date FeedbackDate) {
//        this.FeedbackDate = FeedbackDate;
//    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getExperienceRating() {
        return ExperienceRating;
    }

    public void setExperienceRating(String ExperienceRating) {
        this.ExperienceRating = ExperienceRating;
    }

    public String getSuggestion() {
        return Suggestion;
    }

    public void setSuggestion(String Suggestion) {
        this.Suggestion = Suggestion;
    }

    public String getAttachmentPath() {
        return AttachmentPath;
    }

    public void setAttachmentPath(String AttachmentPath) {
        this.AttachmentPath = AttachmentPath;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }
    
     
    
}