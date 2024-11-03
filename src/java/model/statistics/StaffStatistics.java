package model.statistics;


public class StaffStatistics {
    private String staffName;
    private int totalAppointments;
    private int uniqueServices;
    private double staffRating;
    
    public StaffStatistics(String staffName, int totalAppointments, int uniqueServices, double staffRating) {
        this.staffName = staffName;
        this.totalAppointments = totalAppointments;
        this.uniqueServices = uniqueServices;
        this.staffRating = staffRating;
    }
    
    // Getters and Setters
    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public int getTotalAppointments() {
        return totalAppointments;
    }

    public void setTotalAppointments(int totalAppointments) {
        this.totalAppointments = totalAppointments;
    }

    public int getUniqueServices() {
        return uniqueServices;
    }

    public void setUniqueServices(int uniqueServices) {
        this.uniqueServices = uniqueServices;
    }

    public double getStaffRating() {
        return staffRating;
    }

    public void setStaffRating(double staffRating) {
        this.staffRating = staffRating;
    }
} 