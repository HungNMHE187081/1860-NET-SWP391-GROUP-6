/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author HÙNG
 */
public class ReservationInfo {
    
    private Service service;
    private Date reservationDate;
    private Time startTime;
    private int serviceID;
    private int childID;
    private int staffID;
    
    public ReservationInfo() {}
    
    public ReservationInfo(Service service, Date reservationDate, Time startTime, 
            int serviceID, int childID, int staffID) {
        this.service = service;
        this.reservationDate = reservationDate;
        this.startTime = startTime;
        this.serviceID = serviceID;
        this.childID = childID;
        this.staffID = staffID;
    }

    // Getters and Setters
    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public Date getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(Date reservationDate) {
        this.reservationDate = reservationDate;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public int getChildID() {
        return childID;
    }

    public void setChildID(int childID) {
        this.childID = childID;
    }

    public int getStaffID() {
        return staffID;
    }

    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }
}
