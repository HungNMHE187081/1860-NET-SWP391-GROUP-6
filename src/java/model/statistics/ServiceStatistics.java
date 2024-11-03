public class ServiceStatistics {
    private String serviceName;
    private int bookingCount;
    private double averageRating;
    private int uniqueChildren;
    
    public ServiceStatistics(String serviceName, int bookingCount, double averageRating, int uniqueChildren) {
        this.serviceName = serviceName;
        this.bookingCount = bookingCount;
        this.averageRating = averageRating;
        this.uniqueChildren = uniqueChildren;
    }
    
    // Getters and Setters
    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getBookingCount() {
        return bookingCount;
    }

    public void setBookingCount(int bookingCount) {
        this.bookingCount = bookingCount;
    }

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    public int getUniqueChildren() {
        return uniqueChildren;
    }

    public void setUniqueChildren(int uniqueChildren) {
        this.uniqueChildren = uniqueChildren;
    }
} 