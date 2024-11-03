package model.statistics;

public class CategoryStatistics {
    private String categoryName;
    private int serviceCount;
    
    public CategoryStatistics(String categoryName, int serviceCount) {
        this.categoryName = categoryName;
        this.serviceCount = serviceCount;
    }
    
    // Getters and Setters
    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getServiceCount() {
        return serviceCount;
    }

    public void setServiceCount(int serviceCount) {
        this.serviceCount = serviceCount;
    }
} 