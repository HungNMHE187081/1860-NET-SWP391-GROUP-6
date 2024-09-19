/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class Provinces {
    private int provinceID;
    private String provinceName;
    private int totalDistricts;
    private int totalWards;

    // Constructor
    public Provinces(int provinceID, String provinceName, int totalDistricts, int totalWards) {
        this.provinceID = provinceID;
        this.provinceName = provinceName;
        this.totalDistricts = totalDistricts;
        this.totalWards = totalWards;
    }

    public Provinces(int provinceID, String provinceName) {
    this.provinceID = provinceID;
        this.provinceName = provinceName;
    }

    // Getters and Setters
    public int getProvinceID() { return provinceID; }
    public void setProvinceID(int provinceID) { this.provinceID = provinceID; }

    public String getProvinceName() { return provinceName; }
    public void setProvinceName(String provinceName) { this.provinceName = provinceName; }

    public int getTotalDistricts() { return totalDistricts; }
    public void setTotalDistricts(int totalDistricts) { this.totalDistricts = totalDistricts; }

    public int getTotalWards() { return totalWards; }
    public void setTotalWards(int totalWards) { this.totalWards = totalWards; }
}
