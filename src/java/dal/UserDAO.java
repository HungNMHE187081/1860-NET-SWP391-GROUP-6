/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import model.Roles;
import model.UserAuthentication;
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
        List<Users> users = userDAO.getAllUsers();

        // In kết quả ra màn hình
        for (Users user : users) {
            System.out.println(user);
        }
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
    
    public void registerUser(Users user) {
        String sqlUsers = "INSERT INTO Users (Email) VALUES (?)";
        String sqlUserAuth = "INSERT INTO UserAuthentication (UserID, Username, PasswordHash, Salt, LastLogin) VALUES (?, ?, ?, ?, ?)";
        
        try (PreparedStatement stmtUsers = connection.prepareStatement(sqlUsers, Statement.RETURN_GENERATED_KEYS);
             PreparedStatement stmtUserAuth = connection.prepareStatement(sqlUserAuth)) {
            
            // Insert into Users table
            stmtUsers.setString(1, user.getEmail());
            stmtUsers.executeUpdate();
            
            // Get the generated UserID
            try (ResultSet generatedKeys = stmtUsers.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int userID = generatedKeys.getInt(1);
                    user.setUserID(userID);
                    
                    // Insert into UserAuthentication table
                    UserAuthentication userAuth = user.getUser();
                    stmtUserAuth.setInt(1, userID);
                    stmtUserAuth.setString(2, userAuth.getUsername());
                    stmtUserAuth.setString(3, userAuth.getPasswordHash());
                    stmtUserAuth.setString(4, userAuth.getSalt());
                    stmtUserAuth.setTimestamp(5, userAuth.getLastLogin());
                    stmtUserAuth.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private String hashPassword(String password, String salt) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(Base64.getDecoder().decode(salt));
            byte[] hashedPassword = md.digest(password.getBytes());
            return Base64.getEncoder().encodeToString(hashedPassword);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    
    public UserAuthentication loginUser(String username, String password) {
        String sql = "SELECT * FROM UserAuthentication WHERE Username = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String storedHash = rs.getString("PasswordHash");
                    String salt = rs.getString("Salt");
                    if (storedHash.equals(hashPassword(password, salt))) {
                        UserAuthentication userAuth = new UserAuthentication();
                        userAuth.setUserID(rs.getInt("UserID"));
                        userAuth.setUsername(rs.getString("Username"));
                        userAuth.setPasswordHash(storedHash);
                        userAuth.setSalt(salt);
                        userAuth.setLastLogin(rs.getTimestamp("LastLogin"));
                        return userAuth;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
