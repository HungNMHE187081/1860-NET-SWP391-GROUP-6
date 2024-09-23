/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.District;
import model.Provinces;
import model.Ward;

/**
 *
 * @author LENOVO
 */
public class ManagerUserDAO extends DBContext {

    public List<Users> getAllUsers() {
        List<Users> usersList = new ArrayList<>();
        String sql = "SELECT \n"
                + "    u.UserID, \n"
                + "    u.FirstName, \n"
                + "	u.MiddleName,\n"
                + "    u.LastName, \n"
                + "    u.Email, \n"
                + "	u.DateOfBirth,\n"
                + "	u.Gender,\n"
                + "	u.PhoneNumber,\n"
                + "    a.StreetAddress, \n"
                + "	w.WardName as Ward,\n"
                + "    d.DistrictName AS District, \n"
                + "    p.ProvinceName AS Province, \n"
                + "    r.RoleName, \n"
                + "    ua.Username \n"
                + "FROM \n"
                + "    Users u \n"
                + "JOIN \n"
                + "    UserAddresses a ON u.UserID = a.UserID \n"
                + "JOIN \n"
                + "    Wards w ON a.WardID = w.WardID \n"
                + "JOIN \n"
                + "    Districts d ON w.DistrictID = d.DistrictID \n"
                + "JOIN \n"
                + "    Provinces p ON d.ProvinceID = p.ProvinceID \n"
                + "JOIN \n"
                + "    UserRoles ur ON u.UserID = ur.UserID \n"
                + "JOIN \n"
                + "    Roles r ON ur.RoleID = r.RoleID \n"
                + "JOIN \n"
                + "    UserAuthentication ua ON u.UserID = ua.UserID;";

        try (
                PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Users user = new Users();
                user.setUserID(rs.getInt("UserID"));
                user.setFirstName(rs.getString("FirstName"));
                user.setMiddleName(rs.getString("MiddleName"));
                user.setLastName(rs.getString("LastName"));
                user.setEmail(rs.getString("Email"));
                user.setDateOfBirth(rs.getDate("DateOfBirth"));
                user.setGender(rs.getString("Gender"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                // Tạo địa chỉ đầy đủ
                user.setStreetAddress(rs.getString("StreetAddress"));
                user.setDistrictName(rs.getString("District"));
                user.setProvinceName(rs.getString("Province"));

                usersList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usersList;
    }
     public void addUser(String firstName, String middleName, String lastName, String email, String phoneNumber, 
                        String dateOfBirth, String gender, String citizenIdentification, String username, 
                        String passwordHash, String salt, int roleID, String streetAddress, int wardID) {
        String insertUserSQL = "INSERT INTO Users (FirstName, MiddleName, LastName, Email, PhoneNumber, DateOfBirth, Gender, CitizenIdentification) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        String insertAuthSQL = "INSERT INTO UserAuthentication (UserID, Username, PasswordHash, Salt) VALUES (?, ?, ?, ?)";
        String insertRoleSQL = "INSERT INTO UserRoles (UserID, RoleID) VALUES (?, ?)";
        String insertAddressSQL = "INSERT INTO UserAddresses (UserID, WardID, StreetAddress) VALUES (?, ?, ?)";

        try  {
            connection.setAutoCommit(false); // Bắt đầu transaction

            // Thêm người dùng vào bảng Users
            try (PreparedStatement userStmt = connection.prepareStatement(insertUserSQL, PreparedStatement.RETURN_GENERATED_KEYS)) {
                userStmt.setString(1, firstName);
                userStmt.setString(2, middleName);
                userStmt.setString(3, lastName);
                userStmt.setString(4, email);
                userStmt.setString(5, phoneNumber);
                userStmt.setString(6, dateOfBirth);
                userStmt.setString(7, gender);
                userStmt.setString(8, citizenIdentification);
                userStmt.executeUpdate();

                // Lấy UserID vừa tạo
                int userID = 0;
                try (var generatedKeys = userStmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        userID = generatedKeys.getInt(1);
                    }
                }

                // Thêm thông tin đăng nhập vào bảng UserAuthentication
                try (PreparedStatement authStmt = connection.prepareStatement(insertAuthSQL)) {
                    authStmt.setInt(1, userID);
                    authStmt.setString(2, username);
                    authStmt.setString(3, passwordHash);
                    authStmt.setString(4, salt);
                    authStmt.executeUpdate();
                }

                // Thêm vai trò vào bảng UserRoles
                try (PreparedStatement roleStmt = connection.prepareStatement(insertRoleSQL)) {
                    roleStmt.setInt(1, userID);
                    roleStmt.setInt(2, roleID);
                    roleStmt.executeUpdate();
                }

                // Thêm địa chỉ vào bảng UserAddresses
                try (PreparedStatement addressStmt = connection.prepareStatement(insertAddressSQL)) {
                    addressStmt.setInt(1, userID);
                    addressStmt.setInt(2, wardID);
                    addressStmt.setString(3, streetAddress);
                    addressStmt.executeUpdate();
                }

                // Cam kết transaction
                connection.commit();
            } catch (SQLException e) {
                connection.rollback(); // Rollback nếu có lỗi
                throw e;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
public List<District> getDistrictsByProvince(String provinceID) {
        List<District> districts = new ArrayList<>();
        String sql = "SELECT id, districtName FROM Districts WHERE provinceID = ?";

        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, provinceID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                District district = new District();
                district.setId(rs.getInt("id"));
                district.setDistrictName(rs.getString("districtName"));
                districts.add(district);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return districts;
    }

    // Phương thức lấy danh sách phường theo quận
    public List<Ward> getWardsByDistrict(String districtID) {
        List<Ward> wards = new ArrayList<>();
        String sql = "SELECT id, wardName FROM Wards WHERE districtID = ?";

        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, districtID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Ward ward = new Ward();
                ward.setId(rs.getInt("id"));
                ward.setWardName(rs.getString("wardName"));
                wards.add(ward);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return wards;
    }
    public List<Provinces> getAllProvinces() {
        List<Provinces> provincesList = new ArrayList<>();
        String query = "SELECT provinceID, provinceName FROM Provinces"; // Thay đổi tên bảng và trường nếu cần

        try (
             PreparedStatement pstmt = connection.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int provinceID = rs.getInt("provinceID");
                String provinceName = rs.getString("provinceName");
                provincesList.add(new Provinces(provinceID, provinceName));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý ngoại lệ (có thể ném ra hoặc log)
        }

        return provincesList;
    }
}
