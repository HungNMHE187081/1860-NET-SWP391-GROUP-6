/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;



/**
 *
 * @author LENOVO
 */
public class District {
    private int id;
    private String districtName;
    private int provinceID; // Quan hệ với Province
   private int totalWards;

    // Constructors
    public District() {

    }

    public District(int id, String districtName, int provinceID, int totalWards) {
        this.id = id;
        this.districtName = districtName;
        this.provinceID = provinceID;
        this.totalWards = totalWards;
    }

    public District(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }

    public int getTotalWards() {
        return totalWards;
    }

    public void setTotalWards(int totalWards) {
        this.totalWards = totalWards;
    }

   
}