/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class Order {
    int OrderID, CustomerID, Quantity;
    double TotalPrice;
    Date OrderDate;
    boolean isCheckOut;

    public Order() {
    }

    public Order(int OrderID, int CustomerID, int Quantity, double TotalPrice, Date OrderDate, boolean isCheckOut) {
        this.OrderID = OrderID;
        this.CustomerID = CustomerID;
        this.Quantity = Quantity;
        this.TotalPrice = TotalPrice;
        this.OrderDate = OrderDate;
        this.isCheckOut = isCheckOut;
    }
    
    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public double getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(double TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    public Date getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(Date OrderDate) {
        this.OrderDate = OrderDate;
    }

    public boolean isCheckOut() {
        return isCheckOut;
    }

    public void setCheckOut(boolean isCheckOut) {
        this.isCheckOut = isCheckOut;
    }
    
}
