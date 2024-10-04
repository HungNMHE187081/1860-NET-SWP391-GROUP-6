/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import model.District;
import model.Provinces;
import model.Ward;

/**
 *
 * @author LENOVO
 */
public class ManagerDAO extends DBContext {

    public List<Provinces> getAllProvinces() {
        List<Provinces> listProvinces = new ArrayList<>();
        String sql = "SELECT \n"
                + "    p.ProvinceID,\n"
                + "    p.ProvinceName,\n"
                + "    (SELECT COUNT(*) FROM Districts d WHERE d.ProvinceID = p.ProvinceID) AS TotalDistricts,\n"
                + "    (SELECT COUNT(*) FROM Wards w JOIN Districts d ON w.DistrictID = d.DistrictID WHERE d.ProvinceID = p.ProvinceID) AS TotalWards\n"
                + "FROM Provinces p;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int provinceID = rs.getInt("ProvinceID");
                String provinceName = rs.getString("ProvinceName");
                int totalDistricts = rs.getInt("TotalDistricts");
                int totalWards = rs.getInt("TotalWards");
                Provinces province = new Provinces(provinceID, provinceName, totalDistricts, totalWards);
                listProvinces.add(province);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listProvinces;

    }

    public void updateProvinces(Provinces provinces) {
        String sql = "UPDATE Provinces SET ProvinceName = ? WHERE ProvinceID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, provinces.getProvinceName());
            pre.setInt(2, provinces.getProvinceID()); // Set ProvinceID as a parameter
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateWards(Ward ward) {
        String sql = "UPDATE Wards SET WardName = ? WHERE WardID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, ward.getWardName());
            pre.setInt(2, ward.getId());
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addProvinces(Provinces provinces) {
    try {
        // Kiểm tra nếu tên tỉnh đã tồn tại trước khi thêm
        if (!isProvinceNameExist(provinces.getProvinceName())) {
            String query = "INSERT INTO Provinces(ProvinceName) VALUES (TRIM(?))";
            try (PreparedStatement pre = connection.prepareStatement(query)) {
                pre.setString(1, provinces.getProvinceName().trim());
                pre.executeUpdate();
                System.out.println("Đã thêm tỉnh thành: " + provinces.getProvinceName());
            }
        } else {
            System.out.println("Tên tỉnh đã tồn tại: " + provinces.getProvinceName());
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    
 public boolean isProvinceNameExist(String provinceName) throws SQLException {
    // Loại bỏ dấu và chuyển đổi về chữ thường
    String normalizedProvinceName = removeAccent(provinceName.trim()).toLowerCase();
    System.out.println("Kiểm tra tên tỉnh: " + provinceName + ", Normalized: " + normalizedProvinceName); // Debug thông tin đầu vào
    
     String query = "SELECT COUNT(*) FROM Provinces WHERE LOWER(dbo.removeAccent(ProvinceName)) = LOWER(?)";
    
    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setString(1, normalizedProvinceName); // So sánh với tên đã chuẩn hóa
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                boolean exists = rs.getInt(1) > 0; // Nếu số lượng > 0, tên tỉnh đã tồn tại
                System.out.println("Tên tỉnh đã tồn tại: " + exists); // Debug thông tin kết quả
                return exists;
            }
        }
    }
    return false;
}
   public String removeAccent(String s) {
    if (s == null) {
        return null;
    }
    String normalized = Normalizer.normalize(s, Normalizer.Form.NFD);
    Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
    return pattern.matcher(normalized).replaceAll("");
}


    public void deleteProvinces(int provinceID) {
        String sql = "delete from Provinces where ProvinceID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, provinceID);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<District> getAllDistricts(int provinceID) {
        List<District> districts = new ArrayList<>();
        String sql = "SELECT \n"
                + "    d.DistrictID,\n"
                + "    d.DistrictName,\n"
                + "    COUNT(w.WardID) AS TotalWards\n"
                + "FROM \n"
                + "    Districts d\n"
                + "LEFT JOIN \n"
                + "    Wards w ON d.DistrictID = w.DistrictID\n"
                + "WHERE \n"
                + "    d.ProvinceID = ? "
                + "GROUP BY \n"
                + "    d.DistrictID, d.DistrictName;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, provinceID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int districtID = rs.getInt("DistrictID");
                String districtName = rs.getString("DistrictName");
                int totalWards = rs.getInt("TotalWards");
                districts.add(new District(districtID, districtName, provinceID, totalWards));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return districts;
    }

    public List<Ward> getWardByDistrict(int districtID) {
        List<Ward> ward = new ArrayList<>();
        String sql = "select * from Wards where DistrictID =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, districtID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("WardID");
                String wardName = rs.getString("WardName");
                ward.add(new Ward(id, wardName, districtID));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ward;
    }

    public void deleteDistricts(int id) {
        String sql = "delete from Districts where DistrictID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteWards(int id) {
        String sql = "delete from Wards where WardID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void updateDistricts(int districtId, String districtName, int provinceID) {
        String sql = "UPDATE Districts SET DistrictName = ?, ProvinceID = ? WHERE DistrictID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, districtName);
            pre.setInt(2, provinceID); // thêm provinceID vào câu lệnh
            pre.setInt(3, districtId);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
public boolean isDistrictNameExist(int provinceID, String districtName) throws SQLException {
    // Loại bỏ dấu và chuyển tên về dạng chữ thường
    String normalizedDistrictName = removeAccent(districtName.trim()).toLowerCase();
    System.out.println("Kiểm tra tên quận/huyện: " + districtName + ", Normalized: " + normalizedDistrictName); // Debug thông tin đầu vào
    
    String query = "SELECT COUNT(*) FROM Districts WHERE ProvinceID = ? AND LOWER(dbo.removeAccent(DistrictName)) = LOWER(?)";
    
    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setInt(1, provinceID); // Kiểm tra dựa trên ID tỉnh
        ps.setString(2, normalizedDistrictName); // So sánh với tên quận/huyện đã chuẩn hóa
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                boolean exists = rs.getInt(1) > 0; // Nếu số lượng > 0, tên quận/huyện đã tồn tại
                System.out.println("Tên quận/huyện đã tồn tại: " + exists); // Debug kết quả
                return exists;
            }
        }
    }
    return false;
}

    public void addDistricts(District district) {
        String sql = "INSERT INTO Districts(ProvinceID, DistrictName) VALUES (?, ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, district.getProvinceID());
            pre.setString(2, district.getDistrictName());

            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    

    public static void main(String[] args) {
        ManagerDAO m = new ManagerDAO();
        Provinces provicnes = new Provinces();
        System.out.println(m.getAllProvinces().size());
        
       
    }
}
