/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Roles;

/**
 *
 * @author HÙNG
 */
public class RolesDAO extends DBContext {

    public List<Roles> getAllRoles() {
        List<Roles> roles = new ArrayList<>();
        String sql = "SELECT * FROM Roles";
        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Roles role = new Roles();
                role.setRoleID(rs.getInt("RoleID"));
                role.setRoleName(rs.getString("RoleName"));
                roles.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roles;
    }

    // add new role to table Roles
    public void addRole(String roleName) {
        String sql = "INSERT INTO Roles (RoleName) VALUES (?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, roleName);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // delete role from table Roles
    public void deleteRole(int roleID) {
        String sql = "DELETE FROM Roles WHERE RoleID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, roleID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update role name in table Roles
    public void updateRole(int roleID, String roleName) {
        String sql = "UPDATE Roles SET RoleName = ? WHERE RoleID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, roleName);
            stmt.setInt(2, roleID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getRoleIDByName(String roleName) {
        String sql = "SELECT RoleID FROM Roles WHERE RoleName = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, roleName);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("RoleID");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}
