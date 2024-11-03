public class MonthlyOrderStatistics {
    private int month;
    private int totalOrders;
    private int totalServices;
    
    public MonthlyOrderStatistics(int month, int totalOrders, int totalServices) {
        this.month = month;
        this.totalOrders = totalOrders;
        this.totalServices = totalServices;
    }
    
    // Getters and Setters
    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getTotalOrders() {
        return totalOrders;
    }

    public void setTotalOrders(int totalOrders) {
        this.totalOrders = totalOrders;
    }

    public int getTotalServices() {
        return totalServices;
    }

    public void setTotalServices(int totalServices) {
        this.totalServices = totalServices;
    }
} 