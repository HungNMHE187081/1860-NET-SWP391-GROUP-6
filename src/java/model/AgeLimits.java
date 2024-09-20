/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class AgeLimits {
    int ID;
    String AgeLimit;

    public AgeLimits() {
    }

    public AgeLimits(int ID, String AgeLimit) {
        this.ID = ID;
        this.AgeLimit = AgeLimit;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getAgeLimit() {
        return AgeLimit;
    }

    public void setAgeLimit(String AgeLimit) {
        this.AgeLimit = AgeLimit;
    }
    
}
