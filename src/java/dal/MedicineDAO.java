/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Medicine;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.MedicineCategory;

/**
 *
 * @author User
 */
public class MedicineDAO extends DBContext {

    public List<Medicine> getMedicines(int pageIndex, int pageSize, String categoryID, String manufactureName, String searchQuery, String sort) {
        List<Medicine> medicines = new ArrayList<>();

        String sql = "SELECT m.MedicineID, m.Name, m.Uses, m.Dosage, m.Description, c.CategoryName "
                + "FROM Medicine m "
                + "JOIN MedicineCategory c ON m.CategoryID = c.CategoryID "
                + "WHERE 1=1 ";

        if (categoryID != null && !categoryID.isEmpty()) {
            sql += "AND m.CategoryID = ? ";  // Filter by CategoryID
        }

        if (manufactureName != null && !manufactureName.isEmpty()) {
            sql += "AND m.Description = ? "; // Adjust this filter as necessary
        }

        if (searchQuery != null && !searchQuery.isEmpty()) {
            sql += "AND m.Name LIKE ? ";
        }

        // Adding sorting
        if ("name".equals(sort)) {
            sql += "ORDER BY m.Name ";
        } else if ("uses".equals(sort)) {
            sql += "ORDER BY m.Uses ";
        } else if ("category".equals(sort)) {
            sql += "ORDER BY c.CategoryName ";
        } else if ("manufacturer".equals(sort)) {
            sql += "ORDER BY m.Description "; // Adjust to the appropriate column
        } else {
            sql += "ORDER BY m.MedicineID "; // Default sorting
        }

        sql += "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            int paramIndex = 1;

            if (categoryID != null && !categoryID.isEmpty()) {
                ps.setString(paramIndex++, categoryID);
            }

            if (manufactureName != null && !manufactureName.isEmpty()) {
                ps.setString(paramIndex++, manufactureName);
            }

            if (searchQuery != null && !searchQuery.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchQuery + "%");
            }

            ps.setInt(paramIndex++, (pageIndex - 1) * pageSize);  // Offset
            ps.setInt(paramIndex++, pageSize);  // Page size

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Medicine medicine = new Medicine(
                            rs.getInt("MedicineID"),
                            rs.getString("Name"),
                            rs.getString("Uses"),
                            rs.getString("Dosage"),
                            rs.getString("CategoryName"),
                            rs.getString("Description")
                    );
                    medicines.add(medicine);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return medicines;
    }

    public int getTotalMedicines(String categoryID, String manufactureName, String searchQuery) {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM Medicine m JOIN MedicineCategory c ON m.CategoryID = c.CategoryID WHERE 1=1 ";

        if (categoryID != null && !categoryID.isEmpty()) {
            sql += "AND m.CategoryID = ? ";
        }

        if (manufactureName != null && !manufactureName.isEmpty()) {
            sql += "AND m.Description = ? "; // Adjust as necessary
        }

        if (searchQuery != null && !searchQuery.isEmpty()) {
            sql += "AND m.Name LIKE ? ";
        }

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            int paramIndex = 1;

            if (categoryID != null && !categoryID.isEmpty()) {
                ps.setString(paramIndex++, categoryID);
            }

            if (manufactureName != null && !manufactureName.isEmpty()) {
                ps.setString(paramIndex++, manufactureName);
            }

            if (searchQuery != null && !searchQuery.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchQuery + "%");
            }

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    total = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public Medicine getMedicineById(int medicineId) {
        Medicine medicine = null;
        String sql = "SELECT m.MedicineID, m.Name, m.Description, m.Uses, m.Dosage, "
                + "m.UserManual, m.Contraindications, c.CategoryName, m.CategoryID "
                + "FROM Medicine m "
                + "JOIN MedicineCategory c ON m.CategoryID = c.CategoryID "
                + "WHERE m.MedicineID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, medicineId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    medicine = new Medicine(
                            rs.getInt("MedicineID"),
                            rs.getString("Name"),
                            rs.getString("Description"), // Added manufactureName
                            rs.getString("Uses"),
                            rs.getString("Dosage"),
                            rs.getString("UserManual"), // Added userManual
                            rs.getString("Contraindications"), // Added contraindications
                            rs.getString("CategoryName"), // Category name
                            rs.getInt("CategoryID") // Category ID
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return medicine;
    }

    public String getCategoryById(int categoryID) {
        String sql = "SELECT categoryName FROM MedicineCategory WHERE categoryID = ?";

        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, categoryID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("categoryName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addMedicine(Medicine medicine) {
        String sql = "INSERT INTO Medicine (Name, Description, Uses, Dosage, UserManual, Contraindications, CategoryID) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, medicine.getName());
            ps.setString(2, medicine.getManufactureName());
            ps.setString(3, medicine.getUses());
            ps.setString(4, medicine.getDosage());
            ps.setString(5, medicine.getUserManual());
            ps.setString(6, medicine.getContraindications());
            ps.setInt(7, medicine.getCategoryID());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateMedicine(Medicine medicine) {
        String sql = "UPDATE Medicine SET Name = ?, Description = ?, Uses = ?, Dosage = ?, UserManual = ?, Contraindications = ?, CategoryID = ? WHERE MedicineID = ?";
        try (
                PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, medicine.getName());
            pstmt.setString(2, medicine.getManufactureName());
            pstmt.setString(3, medicine.getUses());
            pstmt.setString(4, medicine.getDosage());
            pstmt.setString(5, medicine.getUserManual());
            pstmt.setString(6, medicine.getContraindications());
            pstmt.setInt(7, medicine.getCategoryID());
            pstmt.setInt(8, medicine.getMedicineID());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to delete medicine
    public boolean deleteMedicineById(int medicineID) {
        String sql = "DELETE FROM Medicine WHERE medicineID = ?";

        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, medicineID);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<MedicineCategory> getAllCategories() {
        List<MedicineCategory> categories = new ArrayList<>();
        String sql = "SELECT * FROM MedicineCategory";

        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                int categoryID = rs.getInt("CategoryID");
                String categoryName = rs.getString("CategoryName");
                categories.add(new MedicineCategory(categoryID, categoryName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public static void main(String[] args) {
        MedicineDAO medicineDAO = new MedicineDAO();

        // Fetch all categories
        List<MedicineCategory> categories = medicineDAO.getAllCategories();

        // Print the categories
        if (categories.isEmpty()) {
            System.out.println("No categories found.");
        } else {
            System.out.println("Medicine Categories:");
            for (MedicineCategory category : categories) {
                System.out.println("ID: " + category.getCategoryID() + ", Name: " + category.getCategoryName());
            }
        }

    }
}
