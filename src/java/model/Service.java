/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class Service {
    int ServiceID;
    String ServiceName, Description;
    double Price;
    int Duration;
    String ServiceImage;
    boolean IsActive;

    public Service() {
    }

    public Service(int ServiceID, String ServiceName, String Description, double Price, int Duration, String ServiceImage, boolean IsActive) {
        this.ServiceID = ServiceID;
        this.ServiceName = ServiceName;
        this.Description = Description;
        this.Price = Price;
        this.Duration = Duration;
        this.ServiceImage = ServiceImage;
        this.IsActive = IsActive;
    }

    public int getServiceID() {
        return ServiceID;
    }

    public void setServiceID(int ServiceID) {
        this.ServiceID = ServiceID;
    }

    public String getServiceName() {
        return ServiceName;
    }

    public void setServiceName(String ServiceName) {
        this.ServiceName = ServiceName;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public int getDuration() {
        return Duration;
    }

    public void setDuration(int Duration) {
        this.Duration = Duration;
    }

    public String getServiceImage() {
        return ServiceImage;
    }

    public void setServiceImage(String ServiceImage) {
        this.ServiceImage = ServiceImage;
    }

    public boolean isIsActive() {
        return IsActive;
    }

    public void setIsActive(boolean IsActive) {
        this.IsActive = IsActive;
    }
    
}
