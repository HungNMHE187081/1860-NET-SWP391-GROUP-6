/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class Staff {
    int StaffID;
    String StaffName;
    int YearsOfExperience, SpecializationID, DegreeID;
    String HireDate;
    double Salary;

    public Staff() {
    }

    public Staff(int StaffID, String StaffName, int YearsOfExperience, int SpecializationID, int DegreeID, String HireDate, double Salary) {
        this.StaffID = StaffID;
        this.StaffName = StaffName;
        this.YearsOfExperience = YearsOfExperience;
        this.SpecializationID = SpecializationID;
        this.DegreeID = DegreeID;
        this.HireDate = HireDate;
        this.Salary = Salary;
    }

    public int getStaffID() {
        return StaffID;
    }

    public void setStaffID(int StaffID) {
        this.StaffID = StaffID;
    }

    public String getStaffName() {
        return StaffName;
    }

    public void setStaffName(String StaffName) {
        this.StaffName = StaffName;
    }

    public int getYearsOfExperience() {
        return YearsOfExperience;
    }

    public void setYearsOfExperience(int YearsOfExperience) {
        this.YearsOfExperience = YearsOfExperience;
    }

    public int getSpecializationID() {
        return SpecializationID;
    }

    public void setSpecializationID(int SpecializationID) {
        this.SpecializationID = SpecializationID;
    }

    public int getDegreeID() {
        return DegreeID;
    }

    public void setDegreeID(int DegreeID) {
        this.DegreeID = DegreeID;
    }

    public String getHireDate() {
        return HireDate;
    }

    public void setHireDate(String HireDate) {
        this.HireDate = HireDate;
    }

    public double getSalary() {
        return Salary;
    }

    public void setSalary(double Salary) {
        this.Salary = Salary;
    }
    
}
