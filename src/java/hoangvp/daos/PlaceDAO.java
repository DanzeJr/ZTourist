/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.daos;

import hoangvp.db.MyConnection;
import hoangvp.dtos.PlaceDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Danze
 */
public class PlaceDAO implements Serializable{
    private Connection conn;
    private PreparedStatement pre;
    private ResultSet rs;
    
    private void closeConnection() throws Exception {
        if (rs != null)
            rs.close();
        if (pre != null)
            pre.close();
        if (conn != null)
            conn.close();
    }
    
    public HashMap<String, String> getPlaceIdName() throws Exception {
        HashMap<String, String> result;
        String id, name;
        
        try {
            String sql = "SELECT ID, Name FROM tblPlace WHERE Status = 'Active'";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            result = new HashMap<>();
            while (rs.next()) {
                id = rs.getString("ID");
                name = rs.getString("Name");
                result.put(id, name);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean isExistedID(String id) throws Exception {
        boolean check = false;
        
        try {
            String sql = "SELECT ID FROM tblPlace WHERE ID = ?";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            rs = pre.executeQuery();
            if (rs.next())
                check = true;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public int getTotalDestinations() throws Exception {
        int total = 0;
        
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT COUNT(ID) AS Total"
                    + " FROM tblPlace"
                    + " WHERE Status = 'Active'";            
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            if (rs.next()) {
                total = rs.getInt("Total");
            }
        } finally {
            closeConnection();
        }
        return total;
    }
    
    public List<PlaceDTO> getAllDestinations(int skip, int fetch) throws Exception {
        List<PlaceDTO> result = null;
        PlaceDTO dto;
        String id, name, des, country, titleImage;
        
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT ID, Name, TitleImage, Description, Country"
                    + " FROM tblPlace"
                    + " WHERE Status = 'Active'"
                    + " ORDER BY ID"
                    + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            
            pre = conn.prepareStatement(sql);
            pre.setInt(1, skip);
            pre.setInt(2, fetch);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                id = rs.getString("ID");
                name = rs.getString("Name");
                titleImage = rs.getString("TitleImage");
                des = rs.getString("Description");
                country = rs.getString("Country");
                dto = new PlaceDTO(id, name, titleImage, des, country);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean insert(PlaceDTO dto) throws Exception {
        boolean check = false;
        
        try {
            String sql = "INSERT INTO tblPlace(ID, Name, TitleImage, Description, Country, Status)"
                    + " VALUES(?,?,?,?,?,?)";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, dto.getId());
            pre.setString(2, dto.getName());
            pre.setString(3, dto.getTitleImage());
            pre.setString(4, dto.getDes());
            pre.setString(5, dto.getCountry());
            pre.setString(6, "Active");
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean update(PlaceDTO dto) throws Exception {
        boolean check = false;
        
        try {
            String sql = "UPDATE tblPlace SET Name = ?, TitleImage = ?, Description = ?, Country = ?, Status = ? WHERE ID = ?";
            conn = MyConnection.getConnection();
            if (dto.getDes().isEmpty()) {
                sql = sql.replace(", Description = ?", "");
            }
            pre = conn.prepareStatement(sql);
            int i = 0;
            pre.setString(++i, dto.getName());
            pre.setString(++i, dto.getTitleImage());
            if (!dto.getDes().isEmpty())
                pre.setString(++i, dto.getDes());
            
            pre.setString(++i, dto.getCountry());
            pre.setString(++i, dto.getStatus());
            pre.setString(++i, dto.getId());
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
