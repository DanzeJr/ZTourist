/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.daos;

import hoangvp.db.MyConnection;
import hoangvp.dtos.CustomerDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author Danze
 */
public class CustomerDAO implements Serializable{
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
    
    public boolean isExistedUsername(String username) throws Exception {
        boolean check = false;
        
        try {
            String sql = "SELECT Username FROM tblCustomer WHERE Username = ?";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            rs = pre.executeQuery();
            if (rs.next())
                check = true;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean isExistedEmail(String email) throws Exception {
        boolean check = false;
        
        try {
            String sql = "SELECT Email FROM tblCustomer WHERE Email = ?";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, email);
            rs = pre.executeQuery();
            if (rs.next())
                check = true;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public String checkLogin(String username, String password) throws Exception {
        String role = "none";
        
        try {
            String sql = "SELECT Role FROM tblCustomer WHERE Username = ? AND Password = ?";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            rs = pre.executeQuery();
            if (rs.next()) {
                role = rs.getString("Role");
            }
        } finally {
            closeConnection();
        }
        return role;
    }
    
    public CustomerDTO getProfileByUsername(String username) throws Exception {
        CustomerDTO dto = null;
        
        try {
            String sql = "SELECT Avatar, FirstName, LastName, Email, Phone, Address, Gender, BirthDate, Job FROM tblCustomer WHERE Username = ?";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            rs = pre.executeQuery();
            if (rs.next()) {
                String avatar = rs.getString("Avatar");
                String firstName = rs.getString("FirstName");
                String lastName = rs.getString("LastName");
                String email = rs.getString("Email");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                String gender = rs.getString("Gender");
                Date birthDate = rs.getDate("BirthDate");
                String job = rs.getString("Job");
                dto = new CustomerDTO(email, firstName, lastName, gender, phone, address, birthDate);
                dto.setAvatar(avatar);
                dto.setJob(job);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public String getAvatar(String username) throws Exception {
        String avatar = null;
        
        try {
            String sql = "SELECT Avatar FROM tblCustomer WHERE Username = ?";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            rs = pre.executeQuery();
            if (rs.next()) {
                avatar = rs.getString("Avatar");
            }
        } finally {
            closeConnection();
        }
        return avatar;
    }
    
    public boolean insert(CustomerDTO dto) throws Exception {
        boolean check = false;
        
        try {
            String sql = "INSERT INTO tblCustomer(Username, Email, Password, FirstName, LastName, Gender, Avatar, Phone, Address, BirthDate, RegisterDate, Role)"
                    + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, dto.getUsername());
            pre.setString(2, dto.getEmail());
            pre.setString(3, dto.getPassword());
            pre.setString(4, dto.getFirstName());
            pre.setString(5, dto.getLastName());
            pre.setString(6, dto.getGender());
            pre.setString(7, dto.getAvatar());
            pre.setString(8, dto.getPhone());
            pre.setString(9, dto.getAddress());
            pre.setDate(10, dto.getBirthDate());
            pre.setTimestamp(11, Timestamp.valueOf(LocalDateTime.now()));
            pre.setString(12, "customer");
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean update(CustomerDTO dto) throws Exception {
        boolean check = false;
        
        try {
            String sql = "UPDATE tblCustomer SET Email = ?, FirstName = ?, LastName = ?, Gender = ?, Phone = ?, Address = ?, BirthDate = ?, Job = ?, Avatar = ? WHERE Username = ?";
            conn = MyConnection.getConnection();
            if (dto.getAvatar() == null) {
                sql = sql.replace(", Avatar = ?", "");
            }
            pre = conn.prepareStatement(sql);
            int i = 0;
            pre.setString(++i, dto.getEmail());
            pre.setString(++i, dto.getFirstName());
            pre.setString(++i, dto.getLastName());
            pre.setString(++i, dto.getGender());
            pre.setString(++i, dto.getPhone());
            pre.setString(++i, dto.getAddress());
            pre.setDate(++i, dto.getBirthDate());
            pre.setString(++i, dto.getJob());
            if (dto.getAvatar() != null)
                pre.setString(++i, dto.getAvatar());
            pre.setString(++i, dto.getUsername());
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean updatePassword(String username, String password) throws Exception {
        boolean check = false;
        
        try {
            String sql = "UPDATE tblCustomer SET Password = ? WHERE Username = ?";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, password);
            pre.setString(2, username);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
