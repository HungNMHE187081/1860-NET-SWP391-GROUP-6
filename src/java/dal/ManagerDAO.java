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
import model.Provinces;

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
        try{
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                int provinceID = rs.getInt("ProvinceID");
                String provinceName = rs.getString("ProvinceName");
                int totalDistricts = rs.getInt("TotalDistricts");
                int totalWards = rs.getInt("TotalWards");
                Provinces province = new Provinces(provinceID, provinceName, totalDistricts, totalWards);
                listProvinces.add(province);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return listProvinces;

    }
    public void updateProvinces(Provinces provinces){
        String sql = "Update Provinces SET ProvinceName = ? WHERE ProvinceID=?";
        try{
           PreparedStatement pre = connection.prepareStatement(sql);
         pre.setString(1, provinces.getProvinceName());
         pre.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        
    }
    public static void main(String[] args) {
        List<Provinces> list = new ArrayList<>();
        ManagerDAO dao = new ManagerDAO();
        list = dao.getAllProvinces();
        System.out.println(list);
    }
}
