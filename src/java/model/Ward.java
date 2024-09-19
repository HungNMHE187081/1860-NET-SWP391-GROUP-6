/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class Ward {
    private int id;
    private String wardName;
    private District district; // Quan hệ với District

    // Constructors
    public Ward() {}

    public Ward(int id, String wardName, District district) {
        this.id = id;
        this.wardName = wardName;
        this.district = district;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getWardName() {
        return wardName;
    }

    public void setWardName(String wardName) {
        this.wardName = wardName;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    // toString method for easy debugging
    @Override
    public String toString() {
        return "Ward{id=" + id + ", wardName='" + wardName + '\'' +
                ", district=" + district.getDistrictName() + '}';
    }
}
