/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class Reservation {
    int ReservationID, CustomerID, ChildrenID, ServiceID;
    String ReservationDate, StartTime;
    boolean isExam;

    public Reservation() {
    }

    public Reservation(int ReservationID, int CustomerID, int ChildrenID, int ServiceID, String ReservationDate, String StartTime, boolean isExam) {
        this.ReservationID = ReservationID;
        this.CustomerID = CustomerID;
        this.ChildrenID = ChildrenID;
        this.ServiceID = ServiceID;
        this.ReservationDate = ReservationDate;
        this.StartTime = StartTime;
        this.isExam = isExam;
    }

    public int getReservationID() {
        return ReservationID;
    }

    public void setReservationID(int ReservationID) {
        this.ReservationID = ReservationID;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public int getChildrenID() {
        return ChildrenID;
    }

    public void setChildrenID(int ChildrenID) {
        this.ChildrenID = ChildrenID;
    }

    public int getServiceID() {
        return ServiceID;
    }

    public void setServiceID(int ServiceID) {
        this.ServiceID = ServiceID;
    }

    public String getReservationDate() {
        return ReservationDate;
    }

    public void setReservationDate(String ReservationDate) {
        this.ReservationDate = ReservationDate;
    }

    public String getStartTime() {
        return StartTime;
    }

    public void setStartTime(String StartTime) {
        this.StartTime = StartTime;
    }

    public boolean isIsExam() {
        return isExam;
    }

    public void setIsExam(boolean isExam) {
        this.isExam = isExam;
    }

    
}
