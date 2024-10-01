/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Roles;
import model.Users;
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
    
    
    public Users getUserById(int userId) {
        Users user = null;
        String sql = "SELECT * FROM Users WHERE UserID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = new Users();
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
                }
            }
        } catch (SQLException e) {
        }
        return user;
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
    
    public static void main(String[] args) {
        // Tạo đối tượng UserDAO
        UserDAO userDAO = new UserDAO();

        // Gọi phương thức getAllUsers
        Users users = userDAO.getUserById(1);

        // In kết quả ra màn hình

            System.out.println(users.getFirstName());
       
    }
    
    public List<Users> searchUsers(String searchTerm) {
        List<Users> users = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE FirstName LIKE ? OR LastName LIKE ? OR Email LIKE ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            String likeSearchTerm = "%" + searchTerm + "%";
            stmt.setString(1, likeSearchTerm);
            stmt.setString(2, likeSearchTerm);
            stmt.setString(3, likeSearchTerm);
            try (ResultSet rs = stmt.executeQuery()) {
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Consider logging the error or throwing a custom exception
        }
        return users;
    }
    
    public List<Users> getUsersWithPagination(int page, int pageSize) {
        List<Users> users = new ArrayList<>();
        String sql = "SELECT * FROM Users LIMIT ? OFFSET ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, pageSize);
            stmt.setInt(2, (page - 1) * pageSize);
            try (ResultSet rs = stmt.executeQuery()) {
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
            }
        } catch (SQLException e) {
            e.printStackTrace();}
        return users;
    }

    public int getTotalUsers() {
        String sql = "SELECT COUNT(*) FROM Users";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();}
        return 0;
    }
    
    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM Users WHERE UserID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            // Consider logging the error or throwing a custom exception
            return false;
        }
    }
    
    public boolean updateUser(Users user) {
        String sql = "UPDATE Users SET FirstName = ?, MiddleName = ?, LastName = ?, Email = ?, " +
                     "PhoneNumber = ?, DateOfBirth = ?, Gender = ?, CitizenIdentification = ?, " +
                     "ProfileImage = ? WHERE UserID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getMiddleName());
            stmt.setString(3, user.getLastName());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getPhoneNumber());
            stmt.setDate(6, new java.sql.Date(user.getDateOfBirth().getTime()));
            stmt.setString(7, user.getGender());
            stmt.setString(8, user.getCitizenIdentification());
            stmt.setString(9, user.getProfileImage());
            stmt.setInt(10, user.getUserID());
            
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            // Consider logging the error or throwing a custom exception
            return false;
        }
    }
    
    public List<String> getUserRoles(int userID) {
        List<String> roles = new ArrayList<>();
        String sql = "SELECT r.RoleName FROM Roles r " +
                     "JOIN UserRoles ur ON r.RoleID = ur.RoleID " +
                     "WHERE ur.UserID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    roles.add(rs.getString("RoleName"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roles;
    }

}
