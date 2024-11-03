package model.statistics;

public class FeedbackStatistics {
    private int rating;
    private int ratingCount;
    
    public FeedbackStatistics(int rating, int ratingCount) {
        this.rating = rating;
        this.ratingCount = ratingCount;
    }
    
    // Getters and Setters
    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getRatingCount() {
        return ratingCount;
    }

    public void setRatingCount(int ratingCount) {
        this.ratingCount = ratingCount;
    }
} 