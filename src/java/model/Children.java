/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author HÙNG
 */
public class Children {
    private int childID;           // ID của trẻ em
    private int customerID;        // ID của khách hàng
    private String firstName;      // Tên
    private String middleName;     // Tên đệm
    private String lastName;       // Họ
    private Date dateOfBirth;      // Ngày sinh
    private String gender;         // Giới tính
    private String childImage;     // Đường dẫn hình ảnh của trẻ em
    private int age;

    public Children() {
    }
public Children(int customerID, String firstName, String middleName, String lastName, Date dateOfBirth, String gender, String childImage) {
       
        this.customerID = customerID;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.childImage = childImage;
    }
    public Children(int childID, int customerID, String firstName, String middleName, String lastName, Date dateOfBirth, String gender, String childImage) {
        this.childID = childID;
        this.customerID = customerID;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.childImage = childImage;
    }

    public Children(int childID, int customerID, String firstName, String middleName, String lastName, Date dateOfBirth, String gender, String childImage, int age) {
        this.childID = childID;
        this.customerID = customerID;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.childImage = childImage;
        this.age = age;
    }
    

    public int getChildID() {
        return childID;
    }

    public void setChildID(int childID) {
        this.childID = childID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getChildImage() {
        return childImage;
    }

    public void setChildImage(String childImage) {
        this.childImage = childImage;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    
}
