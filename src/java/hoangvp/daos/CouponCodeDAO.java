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
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author Danze
 */
public class CouponCodeDAO implements Serializable{
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
    
    public int getOffPercentByCode(String code) throws Exception {
        int offPercent = 0;
        
        try {
            String sql = "SELECT OffPercent FROM tblCouponCode WHERE Code = ? AND ? BETWEEN StartDate AND EndDate";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, code);
            pre.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
            rs = pre.executeQuery();
            if (rs.next())
                offPercent = rs.getInt("OffPercent");
        } finally {
            closeConnection();
        }
        return offPercent;
    }
    
}
