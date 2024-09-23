/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.security.Timestamp;

/**
 *
 * @author LENOVO
 */
public class UserAuthentication {
    private int userID;
    private String username;
    private String passwordHash;
    private String salt;
    private Timestamp lastLogin;

    // Constructor mặc định
    public UserAuthentication() {
    }

    // Constructor đầy đủ
    public UserAuthentication(int userID, String username, String passwordHash, String salt, Timestamp lastLogin) {
        this.userID = userID;
        this.username = username;
        this.passwordHash = passwordHash;
        this.salt = salt;
        this.lastLogin = lastLogin;
    }

    // Getters and Setters

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Timestamp getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Timestamp lastLogin) {
        this.lastLogin = lastLogin;
    }
}
