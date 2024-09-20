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
    int AgeLimitID;
    String AgeLimit;

    public AgeLimits() {
    }

    public AgeLimits(int AgeLimitID, String AgeLimit) {
        this.AgeLimitID = AgeLimitID;
        this.AgeLimit = AgeLimit;
    }

    public int getAgeLimitID() {
        return AgeLimitID;
    }

    public void setAgeLimitID(int AgeLimitID) {
        this.AgeLimitID = AgeLimitID;
    }

    public String getAgeLimit() {
        return AgeLimit;
    }

    public void setAgeLimit(String AgeLimit) {
        this.AgeLimit = AgeLimit;
    }
    
}
