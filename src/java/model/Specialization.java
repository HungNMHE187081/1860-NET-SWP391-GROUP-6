/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class Specialization {
    int SpecializationID;
    String SpecializationName;

    public Specialization() {
    }

    public Specialization(int SpecializationID, String SpecializationName) {
        this.SpecializationID = SpecializationID;
        this.SpecializationName = SpecializationName;
    }

    public int getSpecializationID() {
        return SpecializationID;
    }

    public void setSpecializationID(int SpecializationID) {
        this.SpecializationID = SpecializationID;
    }

    public String getSpecializationName() {
        return SpecializationName;
    }

    public void setSpecializationName(String SpecializationName) {
        this.SpecializationName = SpecializationName;
    }
    
}
