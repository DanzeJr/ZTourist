/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.daos;

import hoangvp.db.MyConnection;
import hoangvp.dtos.EmployeeDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Danze
 */
public class EmployeeDAO implements Serializable{
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
    
    public int getTotalStaffs() throws Exception {
        int total = 0;
        
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT COUNT(Username) AS Total"
                    + " FROM tblEmployee";          
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
    
    public List<EmployeeDTO> getAllStaffs(int skip, int fetch) throws Exception {
        List<EmployeeDTO> result = null;
        EmployeeDTO dto;
        String username, firstName, lastName, gender, avatar, role, startDate;
        
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT Username, FirstName, LastName, Gender, Avatar, StartDate, Role"
                    + " FROM tblEmployee"
                    + " ORDER BY FirstName, LastName"
                    + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            
            pre = conn.prepareStatement(sql);
            pre.setInt(1, skip);
            pre.setInt(2, fetch);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                username = rs.getString("Username");
                firstName = rs.getString("FirstName");
                lastName = rs.getString("LastName");
                gender = rs.getString("Gender");
                avatar = rs.getString("Avatar");
                startDate = rs.getTimestamp("StartDate").toLocalDateTime().format(DateTimeFormatter.ofPattern("yyyy/MMM/dd"));
                role = rs.getString("Role");
                dto = new EmployeeDTO(avatar, username, firstName, lastName, gender, startDate, role);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public HashMap<String, String> getGuideIdName() throws Exception {
        HashMap<String, String> result;
        String username, name, fname, lname;
        
        try {
            String sql = "SELECT Username, FirstName, LastName FROM tblEmployee WHERE Role = 'guide'";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            result = new HashMap<>();
            while (rs.next()) {
                username = rs.getString("Username");
                fname = rs.getString("FirstName");
                lname = rs.getString("LastName");
                name = fname + " " + lname;
                result.put(username, name);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean isExistedUsername(String username) throws Exception {
        boolean check = false;
        
        try {
            String sql = "SELECT Username FROM tblEmployee WHERE Username = ?";
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
            String sql = "SELECT Email FROM tblEmployee WHERE Email = ?";
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
            String sql = "SELECT Role FROM tblEmployee WHERE Username = ? AND Password = ?";
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
    
    public EmployeeDTO getProfileByUsername(String username) throws Exception {
        EmployeeDTO dto = null;
        
        try {
            String sql = "SELECT Avatar, FirstName, LastName, Email, Phone, Address, Gender, BirthDate, Job, Language, StartDate, Salary, Role FROM tblEmployee WHERE Username = ?";
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
                String lang = rs.getString("Language");
                Timestamp startDate = rs.getTimestamp("StartDate");
                float salary = rs.getFloat("Salary");
                String role = rs.getString("Role");
                dto = new EmployeeDTO(firstName, lastName, gender, address, email, phone, birthDate);
                dto.setAvatar(avatar);
                dto.setJob(job);
                dto.setLanguage(lang);
                dto.setStartDate(startDate);
                dto.setSalary(salary);
                dto.setRole(role);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public String getAvatar(String username) throws Exception {
        String avatar = null;
        
        try {
            String sql = "SELECT Avatar FROM tblEmployee WHERE Username = ?";
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
    
    public boolean insert(EmployeeDTO dto) throws Exception {
        boolean check = false;
        
        try {
            String sql = "INSERT INTO tblEmployee(Username, Password, FirstName, LastName, Gender, Avatar, Address, Email, Phone, BirthDate, StartDate, Salary, Role)"
                    + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, dto.getUsername());
            pre.setString(2, dto.getPassword());
            pre.setString(3, dto.getFirstName());
            pre.setString(4, dto.getLastName());
            pre.setString(5, dto.getGender());
            pre.setString(6, dto.getAvatar());
            pre.setString(7, dto.getAddress());
            pre.setString(8, dto.getEmail());            
            pre.setString(9, dto.getPhone());
            pre.setDate(10, dto.getBirthDate());
            pre.setTimestamp(11, Timestamp.valueOf(LocalDateTime.now()));
            pre.setFloat(12, 0);
            pre.setString(13, dto.getRole());
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean update(EmployeeDTO dto) throws Exception {
        boolean check = false;
        
        try {
            String sql = "UPDATE tblEmployee SET Email = ?, FirstName = ?, LastName = ?, Gender = ?, Phone = ?, Address = ?, BirthDate = ?, Role = ?, Language = ?, Job = ?, Salary = ?, Avatar = ? WHERE Username = ?";
            conn = MyConnection.getConnection();
            if (dto.getRole() == null) {
                sql = sql.replace(", Role = ?", "");
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
            if (dto.getRole() != null) {                
                pre.setString(++i, dto.getRole());
            }
            pre.setString(++i, dto.getLanguage());
            pre.setString(++i, dto.getJob());
            pre.setFloat(++i, dto.getSalary());
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
            String sql = "UPDATE tblEmployee SET Password = ? WHERE Username = ?";
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
