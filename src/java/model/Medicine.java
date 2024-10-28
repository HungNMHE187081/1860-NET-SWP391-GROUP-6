package model;

public class Medicine {
    private int medicineID;
    private String name;
    private String manufactureName;
    private String uses;
    private String dosage;
    private String userManual;
    private String contraindications;
    private String categoryName;
    private int categoryID;

    public Medicine() {
    }
    public Medicine(int medicineID, String name)
    {
      this.medicineID = medicineID;
        this.name = name;  
    }

    public Medicine(int medicineID, String name, String manufactureName, String uses, String dosage, String userManual, String contraindications, String categoryName, int categoryID) {
        this.medicineID = medicineID;
        this.name = name;
        this.manufactureName = manufactureName;
        this.uses = uses;
        this.dosage = dosage;
        this.userManual = userManual;
        this.contraindications = contraindications;
        this.categoryName = categoryName;
        this.categoryID = categoryID;
    }

    
     public Medicine(int medicineID, String name, String uses, String dosage, String categoryName, String manufactureName) {
        this.medicineID = medicineID;
        this.name = name;
        this.uses = uses;
        this.dosage = dosage;
        this.categoryName = categoryName;
        this.manufactureName = manufactureName;  // Assign description
    }


    public Medicine(int medicineID, String name, String uses, String dosage, String userManual, String contraindications, String categoryName) {
        this.medicineID = medicineID;
        this.name = name;
        this.uses = uses;
        this.dosage = dosage;
        this.userManual = userManual;
        this.contraindications = contraindications;
        this.categoryName = categoryName;
    }

    public Medicine(String name, String manufactureName, String uses, String dosage, String userManual, String contraindications, int categoryID) {
        this.name = name;
        this.manufactureName = manufactureName;
        this.uses = uses;
        this.dosage = dosage;
        this.userManual = userManual;
        this.contraindications = contraindications;
        this.categoryID = categoryID;
    }

    public Medicine(int aInt, String string, String string0, String string1, String string2, String string3, String string4, String string5) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

 
    public int getMedicineID() {
        return medicineID;
    }

    public void setMedicineID(int medicineID) {
        this.medicineID = medicineID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getManufactureName() {
        return manufactureName;
    }

    public void setManufactureName(String manufactureName) {
        this.manufactureName = manufactureName;
    }

    public String getUses() {
        return uses;
    }

    public void setUses(String uses) {
        this.uses = uses;
    }

    public String getDosage() {
        return dosage;
    }

    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    public String getUserManual() {
        return userManual;
    }

    public void setUserManual(String userManual) {
        this.userManual = userManual;
    }

    public String getContraindications() {
        return contraindications;
    }

    public void setContraindications(String contraindications) {
        this.contraindications = contraindications;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    
}
