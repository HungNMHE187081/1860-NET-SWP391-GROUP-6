/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
        String sql = "INSERT INTO Provinces(ProvinceName) VALUES (?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, provinces.getProvinceName());
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
   public void deleteDistricts(int id){
       String sql = "delete from Districts where DistrictID = ?";
       try{
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
public void addDistricts(District district){
    String sql = "INSERT INTO Districts(ProvinceID, DistrictName) VALUES (?, ?)";
    try{
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setInt(1, district.getProvinceID());
        pre.setString(2, district.getDistrictName());
        
        pre.executeUpdate();
    }catch(SQLException e){
        e.printStackTrace();
    }
}

    public static void main(String[] args) {
    ManagerDAO m = new ManagerDAO();
    int id = 2;
    m.deleteDistricts(id);
        System.out.println(m);
    }
}

