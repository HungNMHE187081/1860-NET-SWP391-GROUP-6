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
    String ServiceName;
    int CategoryID, DegreeID;
    String Description;
    double Price;
    int Duration;
    String ServiceImage;
    boolean IsActive;
    int AgeLimitID;
    String CreatedAt, UpdatedAt;

    public Service() {
    }

    public Service(int ServiceID, String ServiceName, int CategoryID, int DegreeID, String Description, double Price, int Duration, String ServiceImage, boolean IsActive, int AgeLimitID, String CreatedAt, String UpdatedAt) {
        this.ServiceID = ServiceID;
        this.ServiceName = ServiceName;
        this.CategoryID = CategoryID;
        this.DegreeID = DegreeID;
        this.Description = Description;
        this.Price = Price;
        this.Duration = Duration;
        this.ServiceImage = ServiceImage;
        this.IsActive = IsActive;
        this.AgeLimitID = AgeLimitID;
        this.CreatedAt = CreatedAt;
        this.UpdatedAt = UpdatedAt;
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

    public int getAgeLimitID() {
        return AgeLimitID;
    }

    public void setAgeLimitID(int AgeLimitID) {
        this.AgeLimitID = AgeLimitID;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public int getDegreeID() {
        return DegreeID;
    }

    public void setDegreeID(int DegreeID) {
        this.DegreeID = DegreeID;
    }

    public String getCreatedAt() {
        return CreatedAt;
    }

    public void setCreatedAt(String CreatedAt) {
        this.CreatedAt = CreatedAt;
    }

    public String getUpdatedAt() {
        return UpdatedAt;
    }

    public void setUpdatedAt(String UpdatedAt) {
        this.UpdatedAt = UpdatedAt;
    }
    
    
}
