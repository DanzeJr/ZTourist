/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.daos;

import hoangvp.db.MyConnection;
import hoangvp.dtos.BookingDTO;
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
public class BookingDAO implements Serializable{
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
    
    public boolean insert(BookingDTO dto) throws Exception {
        boolean check = false;
        
        try {
            String sql = "INSERT INTO tblBooking(ID, CustomerID, CouponCode, Comment, BookingDate, Status)"
                    + " VALUES(?,?,?,?,?,?)";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, dto.getId());
            pre.setString(2, dto.getCustomerID());
            pre.setString(3, dto.getCouponCode());
            pre.setString(4, dto.getComment());
            pre.setTimestamp(5, dto.getDate());
            pre.setString(6, "Processing");
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean insertDetails(String bookingCode, String tourID, int ticketAdult, int ticketKid) throws Exception {
        boolean check = false;
        
        try {
            String sql = "INSERT INTO tblBookingDetail(BookingID, TourID, TicketAdult, TicketKid)"
                    + " VALUES(?,?,?,?)";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, bookingCode);
            pre.setString(2, tourID);
            pre.setInt(3, ticketAdult);
            pre.setInt(4, ticketKid);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
}
