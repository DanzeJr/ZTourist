/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.daos;

import hoangvp.db.MyConnection;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

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
            String sql = "SELECT ID, Name FROM tblPlace";
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
    
}
