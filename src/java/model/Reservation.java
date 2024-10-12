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
    int ReservationID, OrderItemID;
    String ReservationDate, StartTime;
    int StaffID;
    boolean isExam;

    public Reservation() {
    }

    public Reservation(int ReservationID, int OrderItemID, String ReservationDate, String StartTime, int StaffID, boolean isExam) {
        this.ReservationID = ReservationID;
        this.OrderItemID = OrderItemID;
        this.ReservationDate = ReservationDate;
        this.StartTime = StartTime;
        this.StaffID = StaffID;
        this.isExam = isExam;
    }

    public int getReservationID() {
        return ReservationID;
    }

    public void setReservationID(int ReservationID) {
        this.ReservationID = ReservationID;
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

    public int getOrderItemID() {
        return OrderItemID;
    }

    public void setOrderItemID(int OrderItemID) {
        this.OrderItemID = OrderItemID;
    }

    public int getStaffID() {
        return StaffID;
    }

    public void setStaffID(int StaffID) {
        this.StaffID = StaffID;
    }
    
}
