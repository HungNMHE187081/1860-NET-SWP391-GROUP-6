/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author User
 */
public class Prescription {
    private int prescriptionID;
    private int recordID;
    private int medicineID;
    private String dosage;
    private String frequency;
    private String duration;
    private String childFirstName;
    private String childMiddleName;
    private String childLastName;
    private String userFirstName;
    private String userMiddleName;
    private String userLastName;
    private String staffName;
    private String diagnosis;
    private String medicineName;
    public Prescription() {
    }


    public Prescription(int prescriptionID, int recordID, int medicineID, String dosage, String frequency, String duration, String childFirstName, String childMiddleName, String childLastName, String userFirstName, String userMiddleName, String userLastName, String staffName, String diagnosis, String medicineName) {
        this.prescriptionID = prescriptionID;
        this.recordID = recordID;
        this.medicineID = medicineID;
        this.dosage = dosage;
        this.frequency = frequency;
        this.duration = duration;
        this.childFirstName = childFirstName;
        this.childMiddleName = childMiddleName;
        this.childLastName = childLastName;
        this.userFirstName = userFirstName;
        this.userMiddleName = userMiddleName;
        this.userLastName = userLastName;
        this.staffName = staffName;
        this.diagnosis = diagnosis;
        this.medicineName = medicineName;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public Prescription(int prescriptionID, int recordID, int medicineID, String dosage, String frequency, String duration, String childFirstName, String childMiddleName, String childLastName, String userFirstName, String userMiddleName, String userLastName, String staffName) {
        this.prescriptionID = prescriptionID;
        this.recordID = recordID;
        this.medicineID = medicineID;
        this.dosage = dosage;
        this.frequency = frequency;
        this.duration = duration;
        this.childFirstName = childFirstName;
        this.childMiddleName = childMiddleName;
        this.childLastName = childLastName;
        this.userFirstName = userFirstName;
        this.userMiddleName = userMiddleName;
        this.userLastName = userLastName;
        this.staffName = staffName;
    }

    public String getChildFirstName() {
        return childFirstName;
    }

    public void setChildFirstName(String childFirstName) {
        this.childFirstName = childFirstName;
    }

    public String getChildMiddleName() {
        return childMiddleName;
    }

    public void setChildMiddleName(String childMiddleName) {
        this.childMiddleName = childMiddleName;
    }

    public String getChildLastName() {
        return childLastName;
    }

    public void setChildLastName(String childLastName) {
        this.childLastName = childLastName;
    }

    public String getUserFirstName() {
        return userFirstName;
    }

    public void setUserFirstName(String userFirstName) {
        this.userFirstName = userFirstName;
    }

    public String getUserMiddleName() {
        return userMiddleName;
    }

    public void setUserMiddleName(String userMiddleName) {
        this.userMiddleName = userMiddleName;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }
    

    public Prescription(int prescriptionID, int recordID, int medicineID, String dosage, String frequency, String duration) {
        this.prescriptionID = prescriptionID;
        this.recordID = recordID;
        this.medicineID = medicineID;
        this.dosage = dosage;
        this.frequency = frequency;
        this.duration = duration;
    }
     public Prescription(int recordID, int medicineID, String dosage, String frequency, String duration) {
       
        this.recordID = recordID;
        this.medicineID = medicineID;
        this.dosage = dosage;
        this.frequency = frequency;
        this.duration = duration;
    }

    public int getPrescriptionID() {
        return prescriptionID;
    }

    public void setPrescriptionID(int prescriptionID) {
        this.prescriptionID = prescriptionID;
    }

    public int getRecordID() {
        return recordID;
    }

    public void setRecordID(int recordID) {
        this.recordID = recordID;
    }

    public int getMedicineID() {
        return medicineID;
    }

    public void setMedicineID(int medicineID) {
        this.medicineID = medicineID;
    }

    public String getDosage() {
        return dosage;
    }

    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }
    
}
