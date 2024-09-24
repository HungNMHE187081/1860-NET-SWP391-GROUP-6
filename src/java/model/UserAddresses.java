/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class UserAddresses {

    private int addressID;
    private int userID;
    private String streetAddress;
    private int wardID;
   private Provinces provinces;
   private District district;
    // Getters and Setters
    // ...
    public UserAddresses() {
    }

    public UserAddresses(int addressID, int userID, String streetAddress, int wardID, Provinces provinces, District district) {
        this.addressID = addressID;
        this.userID = userID;
        this.streetAddress = streetAddress;
        this.wardID = wardID;
        this.provinces = provinces;
        this.district = district;
    }

    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public int getWardID() {
        return wardID;
    }

    public void setWardID(int wardID) {
        this.wardID = wardID;
    }

    public Provinces getProvinces() {
        return provinces;
    }

    public void setProvinces(Provinces provinces) {
        this.provinces = provinces;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

  
}
