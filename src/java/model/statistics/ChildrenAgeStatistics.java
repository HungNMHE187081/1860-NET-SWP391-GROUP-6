package model.statistics;


public class ChildrenAgeStatistics {
    private int age;
    private int childCount;
    private double percentage;
    
    public ChildrenAgeStatistics(int age, int childCount, double percentage) {
        this.age = age;
        this.childCount = childCount;
        this.percentage = percentage;
    }
    
    // Getters and Setters
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getChildCount() {
        return childCount;
    }

    public void setChildCount(int childCount) {
        this.childCount = childCount;
    }

    public double getPercentage() {
        return percentage;
    }

    public void setPercentage(double percentage) {
        this.percentage = percentage;
    }
} 