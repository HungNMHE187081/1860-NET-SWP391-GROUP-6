/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class Degree {
    int DegreeID;
    String DegreeName;

    public Degree() {
    }

    public Degree(int DegreeID, String DegreeName) {
        this.DegreeID = DegreeID;
        this.DegreeName = DegreeName;
    }

    public int getDegreeID() {
        return DegreeID;
    }

    public void setDegreeID(int DegreeID) {
        this.DegreeID = DegreeID;
    }

    public String getDegreeName() {
        return DegreeName;
    }

    public void setDegreeName(String DegreeName) {
        this.DegreeName = DegreeName;
    }
    
}
