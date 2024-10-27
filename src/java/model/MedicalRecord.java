    package model;

import java.sql.Date; // Use java.sql.Date instead of java.util.Date

/**
 *
 * @author User
 */
public class MedicalRecord {
    private int recordID;
    private int childID;
    private int staffID;
    private int reservationID;
    private String diagnosis;
    private String treatment;
    private String notes;
    private String childImage;
    private String firstNameChild;
    private String middleNameChild;
    private String lastNameChild;
    private Date reservationDate;
    private Date recordDate; // Change to java.sql.Date
    
    private boolean hasPres;

    public boolean isHasPres() {
        return hasPres;
    }

    public void setHasPres(boolean hasPres) {
        this.hasPres = hasPres;
    }

    public MedicalRecord() {
    }

     public MedicalRecord( int childID, int staffID, int reservationID, String diagnosis, String treatment, String notes,Date reservationDate ,Date recordDate) {
        this.childID = childID;
        this.staffID = staffID;
        this.reservationID = reservationID;
        this.diagnosis = diagnosis;
        this.treatment = treatment;
        this.notes = notes;
        this.reservationDate = reservationDate;
        this.recordDate = recordDate;
    }
    public MedicalRecord(int recordID, int childID, int staffID, int reservationID, String diagnosis, String treatment, String notes, Date recordDate) {
        this.recordID = recordID;
        this.childID = childID;
        this.staffID = staffID;
        this.reservationID = reservationID;
        this.diagnosis = diagnosis;
        this.treatment = treatment;
        this.notes = notes;
        this.recordDate = recordDate;
    }

    public MedicalRecord(int recordID, int childID, int staffID, int reservationID, String diagnosis, String treatment, String notes, String firstNameChild, String middleNameChild, String lastNameChild, Date recordDate) {
        this.recordID = recordID;
        this.childID = childID;
        this.staffID = staffID;
        this.reservationID = reservationID;
        this.diagnosis = diagnosis;
        this.treatment = treatment;
        this.notes = notes;
        this.firstNameChild = firstNameChild;
        this.middleNameChild = middleNameChild;
        this.lastNameChild = lastNameChild;
        this.recordDate = recordDate;
    }

    public MedicalRecord(int recordID, int childID, int staffID, int reservationID, String diagnosis, String treatment, String notes, String childImage, String firstNameChild, String middleNameChild, String lastNameChild, Date recordDate) {
        this.recordID = recordID;
        this.childID = childID;
        this.staffID = staffID;
        this.reservationID = reservationID;
        this.diagnosis = diagnosis;
        this.treatment = treatment;
        this.notes = notes;
        this.childImage = childImage;
        this.firstNameChild = firstNameChild;
        this.middleNameChild = middleNameChild;
        this.lastNameChild = lastNameChild;
        this.recordDate = recordDate;
    }

    public MedicalRecord(int recordID, int childID, int staffID, int reservationID, String diagnosis, String treatment, String notes, String childImage, String firstNameChild, String middleNameChild, String lastNameChild, Date reservationDate, Date recordDate) {
        this.recordID = recordID;
        this.childID = childID;
        this.staffID = staffID;
        this.reservationID = reservationID;
        this.diagnosis = diagnosis;
        this.treatment = treatment;
        this.notes = notes;
        this.childImage = childImage;
        this.firstNameChild = firstNameChild;
        this.middleNameChild = middleNameChild;
        this.lastNameChild = lastNameChild;
        this.reservationDate = reservationDate;
        this.recordDate = recordDate;
    }
    

    public Date getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(Date reservationDate) {
        this.reservationDate = reservationDate;
    }

    public String getChildImage() {
        return childImage;
    }

    public void setChildImage(String childImage) {
        this.childImage = childImage;
    }

    public String getFirstNameChild() {
        return firstNameChild;
    }

    public void setFirstNameChild(String firstNameChild) {
        this.firstNameChild = firstNameChild;
    }

    public String getMiddleNameChild() {
        return middleNameChild;
    }

    public void setMiddleNameChild(String middleNameChild) {
        this.middleNameChild = middleNameChild;
    }

    public String getLastNameChild() {
        return lastNameChild;
    }

    public void setLastNameChild(String lastNameChild) {
        this.lastNameChild = lastNameChild;
    }
    
    
    

    // Getters and Setters
    public int getRecordID() { return recordID; }
    public void setRecordID(int recordID) { this.recordID = recordID; }

    public int getChildID() { return childID; }
    public void setChildID(int childID) { this.childID = childID; }

    public int getStaffID() { return staffID; }
    public void setStaffID(int staffID) { this.staffID = staffID; }

    public int getReservationID() { return reservationID; }
    public void setReservationID(int reservationID) { this.reservationID = reservationID; }

    public String getDiagnosis() { return diagnosis; }
    public void setDiagnosis(String diagnosis) { this.diagnosis = diagnosis; }

    public String getTreatment() { return treatment; }
    public void setTreatment(String treatment) { this.treatment = treatment; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    public Date getRecordDate() { return recordDate; }
    public void setRecordDate(Date recordDate) { this.recordDate = recordDate; }
}
