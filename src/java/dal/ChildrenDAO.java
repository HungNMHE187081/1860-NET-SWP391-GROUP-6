package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Types;
import java.sql.Date;
import model.Children;

public class ChildrenDAO extends DBContext {

    public void addChild(Children child) throws SQLException {
        String sql = "INSERT INTO Children (CustomerID, FirstName, MiddleName, LastName, DateOfBirth, Gender, ChildImage) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, child.getCustomerID());
            pstmt.setString(2, child.getFirstName());
            pstmt.setString(3, child.getMiddleName());
            pstmt.setString(4, child.getLastName());
            pstmt.setDate(5, new java.sql.Date(child.getDateOfBirth().getTime()));
            pstmt.setString(6, child.getGender());
            pstmt.setString(7, child.getChildImage());
            pstmt.executeUpdate();
        }
    }
    // Method to retrieve all children from the database
    public List<Children> getAllChildren() {
        List<Children> list = new ArrayList<>();
        String sql = "SELECT * FROM Children";
        
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int childID = rs.getInt("ChildID");
                int customerID = rs.getInt("CustomerID");
                String firstName = rs.getString("FirstName");
                String middleName = rs.getString("MiddleName");
                String lastName = rs.getString("LastName");
                java.sql.Date dateOfBirth = rs.getDate("DateOfBirth");
                String gender = rs.getString("Gender");
                String childImage = rs.getString("ChildImage");
                list.add(new Children(childID, customerID, firstName, middleName, lastName, dateOfBirth, gender, childImage));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception for debugging
        }
        return list;
    }

    // Method to retrieve a child by their ID
    public Children getChildrenByID(int childID) {
        String sql = "SELECT * FROM Children WHERE ChildID = ?";
        
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, childID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Children children = new Children();
                children.setChildID(childID);
                children.setCustomerID(rs.getInt("CustomerID"));
                children.setFirstName(rs.getString("FirstName"));
                children.setMiddleName(rs.getString("MiddleName"));
                children.setLastName(rs.getString("LastName"));
                children.setDateOfBirth(rs.getDate("DateOfBirth")); // Ensure this is java.sql.Date
                children.setGender(rs.getString("Gender"));
                children.setChildImage(rs.getString("ChildImage"));
                return children;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception for debugging
        }
        return null; // Return null if no child found
    }

    // Method to retrieve children by their customer ID
    public List<Children> getChildrenByCustomerID(int customerID) {
        List<Children> list = new ArrayList<>();
        String sql = "SELECT * FROM Children WHERE CustomerID = ?";
        
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int childID = rs.getInt("ChildID");
                String firstName = rs.getString("FirstName");
                String middleName = rs.getString("MiddleName");
                String lastName = rs.getString("LastName");
                java.sql.Date dateOfBirth = rs.getDate("DateOfBirth");
                String gender = rs.getString("Gender");
                String childImage = rs.getString("ChildImage");
                list.add(new Children(childID, customerID, firstName, middleName, lastName, dateOfBirth, gender, childImage));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception for debugging
        }
        return list;
    }
 public void updateChild(Children child) throws SQLException {
    String sql = "UPDATE Children SET firstName = ?, middleName = ?, lastName = ?, dateOfBirth = ?, gender = ?, childImage = ? WHERE childID = ?";
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        stmt.setString(1, child.getFirstName());
        stmt.setString(2, child.getMiddleName());
        stmt.setString(3, child.getLastName());
        stmt.setDate(4, child.getDateOfBirth());
        stmt.setString(5, child.getGender());
        stmt.setString(6, child.getChildImage());
        stmt.setInt(7, child.getChildID());
        stmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace(); // Xử lý ngoại lệ một cách thích hợp
        throw e; // Ném lại để xử lý trong servlet
    }
}
     public boolean deleteChild(int childID) {
        String sql = "DELETE FROM Children WHERE ChildID = ?";
        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, childID);
            return stmt.executeUpdate() > 0; // Returns true if a row was deleted
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Return false in case of an error
        }
    }


}
