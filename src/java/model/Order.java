/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author LENOVO
 */
public class Order {
    int OrderID, CustomerID, Quantity;
    double TotalPrice;
    String OrderDate;
    boolean isOrder, isCheckOut;

    public Order() {
    }

    public Order(int OrderID, int CustomerID, int Quantity, double TotalPrice, String OrderDate, boolean isOrder, boolean isCheckOut) {
        this.OrderID = OrderID;
        this.CustomerID = CustomerID;
        this.Quantity = Quantity;
        this.TotalPrice = TotalPrice;
        this.OrderDate = OrderDate;
        this.isOrder = isOrder;
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

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public boolean isIsOrder() {
        return isOrder;
    }

    public void setIsOrder(boolean isOrder) {
        this.isOrder = isOrder;
    }

    public boolean isIsCheckOut() {
        return isCheckOut;
    }

    public void setIsCheckOut(boolean isCheckOut) {
        this.isCheckOut = isCheckOut;
    }
    
}
