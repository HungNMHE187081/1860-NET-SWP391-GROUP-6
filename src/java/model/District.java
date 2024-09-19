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
    private Provinces province; // Quan hệ với Province

    // Constructors
    public District() {}

    public District(int id, String districtName, Provinces province) {
        this.id = id;
        this.districtName = districtName;
        this.province = province;
    }

    // Getters and Setters
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

    public Provinces getProvince() {
        return province;
    }

    public void setProvince(Provinces province) {
        this.province = province;
    }

    // toString method for easy debugging
    @Override
    public String toString() {
        return "District{id=" + id + ", districtName='" + districtName + '\'' +
                ", province=" + province.getProvinceName() + '}';
    }
}
