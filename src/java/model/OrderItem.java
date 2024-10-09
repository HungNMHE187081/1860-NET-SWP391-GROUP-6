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
    int OrderItemID, OrderID, ServiceID, ChildrenID;

    public OrderItem() {
    }

    public OrderItem(int OrderItemID, int OrderID, int ServiceID, int ChildrenID) {
        this.OrderItemID = OrderItemID;
        this.OrderID = OrderID;
        this.ServiceID = ServiceID;
        this.ChildrenID = ChildrenID;
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

    public int getChildrenID() {
        return ChildrenID;
    }

    public void setChildrenID(int ChildrenID) {
        this.ChildrenID = ChildrenID;
    }
    
}
