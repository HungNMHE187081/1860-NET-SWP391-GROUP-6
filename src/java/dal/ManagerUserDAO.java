/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import model.District;
import model.Provinces;
import model.Roles;
import model.UserAddresses;
import model.Ward;

/**
 *
 * @author LENOVO
 */
public class ManagerUserDAO extends DBContext {

    public List<Users> getAllUsers() {
        List<Users> usersList = new ArrayList<>();
        String sql = "SELECT \n"
                + "    u.UserID,\n"
                + "    u.FirstName,\n"
                + "    u.MiddleName,\n"
                + "    u.LastName,\n"
                + "    u.Email,\n"
                + "    u.DateOfBirth,\n"
                + "    u.Gender,\n"
                + "    u.PhoneNumber,\n"
                + "    a.StreetAddress,\n"
                + "    w.WardID,   -- Chỉ lấy WardID\n"
                + "    w.WardName as Ward,\n"
                + "    d.DistrictID, -- Thêm DistrictID để lấy\n"
                + "    d.DistrictName AS District,\n"
                + "    p.ProvinceID, -- Thêm ProvinceID để lấy\n"
                + "    p.ProvinceName AS Province,\n"
                + "    r.RoleName as roleName,\n"
                + "    ua.Username\n"
                + "FROM \n"
                + "    Users u\n"
                + "left JOIN \n"
                + "    UserAddresses a ON u.UserID = a.UserID\n"
                + "left JOIN \n"
                + "    Wards w ON a.WardID = w.WardID\n"
                + "left JOIN \n"
                + "    Districts d ON w.DistrictID = d.DistrictID\n"
                + "left JOIN \n"
                + "    Provinces p ON d.ProvinceID = p.ProvinceID\n"
                + "left JOIN \n"
                + "    UserRoles ur ON u.UserID = ur.UserID\n"
                + "left JOIN \n"
                + "    Roles r ON ur.RoleID = r.RoleID\n"
                + "left JOIN \n"
                + "    UserAuthentication ua ON u.UserID = ua.UserID";

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
                UserAddresses address = new UserAddresses();
                address.setStreetAddress(rs.getString("StreetAddress"));
                address.setWardID(rs.getInt("WardID")); // Assuming WardID is also needed

                District district = new District();
                district.setId(rs.getInt("DistrictID")); // Đảm bảo rằng bạn đã chọn DistrictID trong câu truy vấn
                district.setDistrictName(rs.getString("District")); // Gán tên quận
                address.setDistrict(district);

                // Tạo và gán đối tượng tỉnh
                Provinces province = new Provinces();
                province.setProvinceID(rs.getInt("ProvinceID")); // Đảm bảo rằng bạn đã chọn ProvinceID trong câu truy vấn
                province.setProvinceName(rs.getString("Province")); // Gán tên tỉnh
                address.setProvinces(province);
                user.setAddress(address);

                List<Roles> rolesList = new ArrayList<>();
                Roles role = new Roles();
                role.setRoleName(rs.getString("roleName"));
                rolesList.add(role);
                user.setRoles(rolesList);

                usersList.add(user);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usersList;
    }

    public List<District> getDistrictsByProvince(int provinceID) { // Sử dụng int cho provinceID
        List<District> districts = new ArrayList<>();
        String sql = "SELECT DistrictID, DistrictName FROM Districts WHERE ProvinceID = ?"; // Chỉnh sửa tên trường

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, provinceID); // Chuyển sang setInt
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                District district = new District();
                district.setId(rs.getInt("DistrictID")); // Đảm bảo khớp với tên cột trong SQL
                district.setDistrictName(rs.getString("DistrictName"));
                districts.add(district);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return districts;
    }

    // Phương thức lấy danh sách phường theo quận
    public List<Ward> getWardsByDistrict(int districtID) { // Sử dụng int cho districtID
        List<Ward> wards = new ArrayList<>();
        String sql = "SELECT WardID, WardName FROM Wards WHERE DistrictID = ?"; // Chỉnh sửa tên trường

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, districtID); // Chuyển sang setInt
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Ward ward = new Ward();
                ward.setId(rs.getInt("WardID")); // Đảm bảo khớp với tên cột trong SQL
                ward.setWardName(rs.getString("WardName"));
                wards.add(ward);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return wards;
    }

    public List<Provinces> getAllProvinces() {
        List<Provinces> provincesList = new ArrayList<>();
        String query = "SELECT ProvinceID, ProvinceName FROM Provinces"; // Thay đổi tên bảng và trường nếu cần

        try (PreparedStatement pstmt = connection.prepareStatement(query); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                int provinceID = rs.getInt("ProvinceID");
                String provinceName = rs.getString("ProvinceName");
                provincesList.add(new Provinces(provinceID, provinceName));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý ngoại lệ (có thể ném ra hoặc log)
        }

        return provincesList;
    }

    private int getRoleIdByName(String roleName) {
        int roleId = -1;
        String sql = "SELECT RoleID FROM Roles WHERE RoleName = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, roleName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                roleId = rs.getInt("RoleID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roleId;
    }

    public void addUser(Users user) {
        String sqlUser = "INSERT INTO Users (FirstName, MiddleName, LastName, Email, PhoneNumber, DateOfBirth, Gender, CitizenIdentification, ProfileImage, CreatedAt, UpdatedAt) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String sqlAddress = "INSERT INTO UserAddresses (StreetAddress, WardID, UserID) VALUES (?, ?, ?)";
        String sqlAuth = "INSERT INTO UserAuthentication (Username, PasswordHash, Salt, UserID) VALUES (?, ?, ?, ?)";
        String sqlRole = "INSERT INTO UserRoles (UserID, RoleID) VALUES (?, ?)"; // Câu lệnh thêm vai trò

        try {
            // Bắt đầu transaction
            connection.setAutoCommit(false);

            // Thêm người dùng vào bảng Users
            try (PreparedStatement psUser = connection.prepareStatement(sqlUser)) {
                psUser.setString(1, user.getFirstName());
                psUser.setString(2, user.getMiddleName());
                psUser.setString(3, user.getLastName());
                psUser.setString(4, user.getEmail());
                psUser.setString(5, user.getPhoneNumber());
                psUser.setDate(6, new java.sql.Date(user.getDateOfBirth().getTime()));
                psUser.setString(7, user.getGender());
                psUser.setString(8, user.getCitizenIdentification());
                psUser.setString(9, user.getProfileImage());
                psUser.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
                psUser.setTimestamp(11, new Timestamp(System.currentTimeMillis()));
                int affectedRows = psUser.executeUpdate();
                if (affectedRows == 0) {
                    throw new SQLException("Creating user failed, no rows affected.");
                }

                // Lấy UserID vừa tạo
                try (ResultSet generatedKeys = psUser.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        user.setUserID(generatedKeys.getInt(1)); // Cập nhật UserID vào đối tượng user
                    } else {
                        throw new SQLException("Creating user failed, no ID obtained.");
                    }
                }
            }

            // Thêm địa chỉ vào bảng UserAddresses
            try (PreparedStatement psAddress = connection.prepareStatement(sqlAddress)) {
                psAddress.setString(1, user.getAddress().getStreetAddress());
                psAddress.setInt(2, user.getAddress().getWardID());
                psAddress.setInt(3, user.getUserID()); // Sử dụng UserID vừa tạo

                psAddress.executeUpdate();
            }

            // Thêm thông tin đăng nhập vào bảng UserAuthentication
            try (PreparedStatement psAuth = connection.prepareStatement(sqlAuth)) {
                psAuth.setString(1, user.getUser().getUsername());
                psAuth.setString(2, user.getUser().getPasswordHash());
                psAuth.setString(3, user.getUser().getSalt());
                psAuth.setInt(4, user.getUserID()); // Sử dụng UserID vừa tạo

                psAuth.executeUpdate();
            }

            // Thêm vai trò vào bảng UserRoles
            int customerRoleId = getRoleIdByName("Customer"); // Lấy RoleID của Customer
            try (PreparedStatement psRole = connection.prepareStatement(sqlRole)) {
                psRole.setInt(1, user.getUserID()); // Sử dụng UserID vừa tạo
                psRole.setInt(2, customerRoleId); // Thêm vai trò Customer

                psRole.executeUpdate();
            }

            // Commit transaction
            connection.commit();
        } catch (SQLException e) {
            // Rollback transaction if any error occurs
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                connection.setAutoCommit(true); // Trở về chế độ tự động commit
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        String id = "Customer";
        ManagerUserDAO dao = new ManagerUserDAO();
        System.out.println(dao.getRoleIdByName(id));
    }
}
