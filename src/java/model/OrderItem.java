/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class OrderItem {
    int OrderItemID, OrderID, ServiceID, ChildID;

    public OrderItem() {
    }

    public OrderItem(int OrderItemID, int OrderID, int ServiceID, int ChildID) {
        this.OrderItemID = OrderItemID;
        this.OrderID = OrderID;
        this.ServiceID = ServiceID;
        this.ChildID = ChildID;
    }

    public int getOrderItemID() {
        return OrderItemID;
    }

    public void setOrderItemID(int OrderItemID) {
        this.OrderItemID = OrderItemID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getServiceID() {
        return ServiceID;
    }

    public void setServiceID(int ServiceID) {
        this.ServiceID = ServiceID;
    }

    public int getChildID() {
        return ChildID;
    }

    public void setChildID(int ChildID) {
        this.ChildID = ChildID;
    }
    
}
