/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Users;
import model.Roles;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author HÙNG
 */
public class UserDAO extends DBContext{
    
    public List<Users> getAllUsers() {
        List<Users> users = new ArrayList<>();
        String sql = "SELECT * FROM Users";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Users user = new Users();
                user.setUserID(rs.getInt("UserID"));
                user.setFirstName(rs.getString("FirstName"));
                user.setMiddleName(rs.getString("MiddleName"));
                user.setLastName(rs.getString("LastName"));
                user.setEmail(rs.getString("Email"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setDateOfBirth(rs.getDate("DateOfBirth"));
                user.setGender(rs.getString("Gender"));
                user.setCitizenIdentification(rs.getString("CitizenIdentification"));
                user.setProfileImage(rs.getString("ProfileImage"));
                user.setCreatedAt(rs.getTimestamp("CreatedAt"));
                user.setUpdatedAt(rs.getTimestamp("UpdatedAt"));
                user.setRoles(getRolesByUserID(user.getUserID()));
                users.add(user);
            }
        } catch (SQLException e) {
        }
        return users;
    }
    
    //Query list of specify User Role
    private List<Roles> getRolesByUserID(int userID) {
        List<Roles> roles = new ArrayList<>();
        String sql = "SELECT r.RoleID, r.RoleName FROM Roles r " +
                     "JOIN UserRoles ur ON r.RoleID = ur.RoleID " +
                     "WHERE ur.UserID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Roles role = new Roles();
                    role.setRoleID(rs.getInt("RoleID"));
                    role.setRoleName(rs.getString("RoleName"));
                    roles.add(role);
                }
            }
        } catch (SQLException e) {
        }
        return roles;
    }
    
    //Add User Role
    public void addUserRole(int userID, int roleID) {
        String sql = "INSERT INTO UserRoles (UserID, RoleID) VALUES (?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userID);
            stmt.setInt(2, roleID);
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    //Delete User Role
    public void removeUserRole(int userID, int roleID) {
        String sql = "DELETE FROM UserRoles WHERE UserID = ? AND RoleID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userID);
            stmt.setInt(2, roleID);
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
