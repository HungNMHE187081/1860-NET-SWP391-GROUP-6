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
    private Date recordDate; // Change to java.sql.Date

    public MedicalRecord() {
    }

     public MedicalRecord( int childID, int staffID, int reservationID, String diagnosis, String treatment, String notes, Date recordDate) {
        this.childID = childID;
        this.staffID = staffID;
        this.reservationID = reservationID;
        this.diagnosis = diagnosis;
        this.treatment = treatment;
        this.notes = notes;
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
