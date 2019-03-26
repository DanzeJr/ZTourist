/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.daos;

import hoangvp.db.MyConnection;
import hoangvp.dtos.PlaceDTO;
import hoangvp.dtos.TourDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Danze
 */
public class TourDAO implements Serializable{
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
    
    public List<TourDTO> getTopNearestTours() throws Exception {
        List<TourDTO> result = null;
        TourDTO dto;
        String id, titleImg;
        
        try {
            String sql = "SELECT TOP 5 ID, TitleImage"
                    + " FROM tblTour"
                    + " ORDER BY FromDate";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                id = rs.getString("ID");
                titleImg = rs.getString("TitleImage");
                dto = new TourDTO();
                dto.setId(id);
                dto.setTitleImage(titleImg);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<TourDTO> getPopularTours() throws Exception {
        List<TourDTO> result = null;
        TourDTO dto;
        String id, titleImg;
        float fareA, dur;
        
        try {
            String sql = "SELECT TOP 5 TourID, TitleImage, FareAdult, Duration"
                    + " FROM tblBooking JOIN (SELECT ID, TitleImage, FareAdult, DATEDIFF(day, FromDate, ToDate) AS Duration FROM tblTour) AS tbTour ON TourID = tbTour.ID"
                    + " GROUP BY TourID, TitleImage, FareAdult, Duration"
                    + " ORDER BY SUM(TicketAdult + TicketKid) DESC";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                id = rs.getString("TourID");
                titleImg = rs.getString("TitleImage");
                fareA = rs.getFloat("FareAdult");
                dur = rs.getInt("Duration");
                dto = new TourDTO();
                dto.setId(id);
                dto.setTitleImage(titleImg);
                dto.setFareAdult(fareA);
                dto.setDuration(dur);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<PlaceDTO> findPlacesByTourID(String id) throws Exception {
        List<PlaceDTO> result = null;
        PlaceDTO dto;
        String placeID, name;
        
        try {
            String sql = "SELECT PlaceID, Name FROM tblTourDetail JOIN tblPlace ON PlaceID = ID WHERE TourID = ? ORDER BY Number";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                placeID = rs.getString("PlaceID");
                name = rs.getString("Name");
                dto = new PlaceDTO(placeID, name);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int getTotalSearchTour(String dest, Timestamp fromDate, int duration, float priceMin, float priceMax) throws Exception {
        int total = 0;
        
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT COUNT(ID) AS Total"
                    + " FROM tblTour"
                    + " WHERE Status = 'Active' AND FromDate >= ?"
                    + " AND FareAdult >= ? AND FareAdult <= ?"
                    + " AND DATEDIFF(hour, FromDate, ToDate) <= ?"
                    + " AND ID IN (SELECT TourID AS ID FROM tblTourDetail WHERE PlaceID = ?)";
            int i = 0;
            
            if (priceMin < 0) {
                sql = sql.replace(" AND FareAdult >= ? AND FareAdult <= ?", "");
            } else {
                if (priceMax < 0)
                    sql = sql.replace(" AND FareAdult <= ?", "");
            }         
            if (duration <= 0) {
                sql = sql.replace(" AND DATEDIFF(hour, FromDate, ToDate) <= ?", "");
            } else if (duration > 7) {
                sql = sql.replace("DATEDIFF(hour, FromDate, ToDate) <= ?", "DATEDIFF(hour, FromDate, ToDate) > ?");
            }
            if (dest.equalsIgnoreCase("-1")) {
                sql = sql.replace(" AND ID IN (SELECT TourID AS ID FROM tblTourDetail WHERE PlaceID = ?)", "");
            }
            
            pre = conn.prepareStatement(sql);
            
            pre.setTimestamp(++i, fromDate);
            if (priceMin >= 0) {
                pre.setFloat(++i, priceMin);
                if (priceMax >= 0)
                    pre.setFloat(++i, priceMax);
            }
            if (duration > 0) {
                if (duration > 7)
                    pre.setInt(++i, 7);
                else
                    pre.setInt(++i, duration);
            }
            if (!dest.equalsIgnoreCase("-1")) {
                pre.setString(++i, dest);
            }
            rs = pre.executeQuery();
            if (rs.next()) {
                total = rs.getInt("Total");
            }
        } finally {
            closeConnection();
        }
        return total;
    }
    
    public List<TourDTO> findTour(int skip, int fetch, String dest, Timestamp fromDateTime, int duration, float priceMin, float priceMax) throws Exception {
        List<TourDTO> result = null;
        TourDTO dto;
        String id, name, des, trans, titleImage;
        float fareA, dur;
        String fDate, tDate;
        
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT ID, Name, Description, FromDate, ToDate, Transport, FareAdult, TitleImage, DATEDIFF(day, FromDate, ToDate) AS Duration"
                    + " FROM tblTour"
                    + " WHERE Status = 'Active' AND FromDate >= ?"
                    + " AND FareAdult >= ? AND FareAdult <= ?"
                    + " AND DATEDIFF(hour, FromDate, ToDate) <= ?"
                    + " AND ID IN (SELECT TourID AS ID FROM tblTourDetail WHERE PlaceID = ?)"
                    + " ORDER BY FromDate"
                    + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            int i = 0;
            
            if (priceMin < 0) {
                sql = sql.replace(" AND FareAdult >= ? AND FareAdult <= ?", "");
            } else {
                if (priceMax < 0)
                    sql = sql.replace(" AND FareAdult <= ?", "");
            }         
            if (duration <= 0) {
                sql = sql.replace(" AND DATEDIFF(hour, FromDate, ToDate) <= ?", "");
            } else if (duration > 7) {
                sql = sql.replace("DATEDIFF(hour, FromDate, ToDate) <= ?", "DATEDIFF(hour, FromDate, ToDate) > ?");
            }
            if (dest.equalsIgnoreCase("-1")) {
                sql = sql.replace(" AND ID IN (SELECT TourID AS ID FROM tblTourDetail WHERE PlaceID = ?)", "");
            }
            
            pre = conn.prepareStatement(sql);
            
            pre.setTimestamp(++i, fromDateTime);
            if (priceMin >= 0) {
                pre.setFloat(++i, priceMin);
                if (priceMax >= 0)
                    pre.setFloat(++i, priceMax);
            }
            if (duration > 0) {
                if (duration > 7)
                    pre.setInt(++i, 7);
                else
                    pre.setInt(++i, duration);
            }
            if (!dest.equalsIgnoreCase("-1")) {
                pre.setString(++i, dest);
            }
            pre.setInt(++i, skip);
            pre.setInt(++i, fetch);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                id = rs.getString("ID");
                name = rs.getString("Name");
                des = rs.getString("Description");
                fDate = rs.getTimestamp("FromDate").toLocalDateTime().format(DateTimeFormatter.ofPattern("dd/MMM/yyyy"));
                tDate = rs.getTimestamp("ToDate").toLocalDateTime().format(DateTimeFormatter.ofPattern("dd/MMM/yyyy"));
                trans = rs.getString("Transport");
                fareA = rs.getFloat("FareAdult");
                titleImage = rs.getString("TitleImage");
                dur = rs.getInt("Duration");
                dto = new TourDTO(id, name, des, trans, titleImage, fareA, dur, fDate, tDate);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int getTotalSearchTourStaff(String id, String name, String dest, Timestamp fromDate, int duration, float priceMin, float priceMax) throws Exception {
        int total = 0;
        
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT COUNT(ID) AS Total"
                    + " FROM tblTour"
                    + " WHERE Status = 'Active' AND FromDate >= ?"
                    + " AND FareAdult >= ? AND FareAdult <= ?"
                    + " AND DATEDIFF(hour, FromDate, ToDate) <= ?"
                    + " AND ID IN (SELECT TourID AS ID FROM tblTourDetail WHERE PlaceID = ?)"
                    + " AND ID = ? AND Name = ?";
            int i = 0;
                        
            if (priceMin < 0) {
                sql = sql.replace(" AND FareAdult >= ? AND FareAdult <= ?", "");
            } else {
                if (priceMax < 0)
                    sql = sql.replace(" AND FareAdult <= ?", "");
            }         
            if (duration <= 0) {
                sql = sql.replace(" AND DATEDIFF(hour, FromDate, ToDate) <= ?", "");
            } else if (duration > 7) {
                sql = sql.replace("DATEDIFF(hour, FromDate, ToDate) <= ?", "DATEDIFF(hour, FromDate, ToDate) > ?");
            }
            if (dest.equalsIgnoreCase("-1")) {
                sql = sql.replace(" AND ID IN (SELECT TourID AS ID FROM tblTourDetail WHERE PlaceID = ?)", "");
            }
            if (id == null) {
                sql = sql.replace(" AND ID = ?", "");
            }
            if (name == null) {
                sql = sql.replace(" AND Name = ?", "");
            }
            
            pre = conn.prepareStatement(sql);
            
            pre.setTimestamp(++i, fromDate);
            if (priceMin >= 0) {
                pre.setFloat(++i, priceMin);
                if (priceMax >= 0)
                    pre.setFloat(++i, priceMax);
            }
            if (duration > 0) {
                if (duration > 7)
                    pre.setInt(++i, 7);
                else
                    pre.setInt(++i, duration);
            }
            if (!dest.equalsIgnoreCase("-1")) {
                pre.setString(++i, dest);
            }
            if (id != null) {
                pre.setString(++i, id);
            }
            if (name != null) {
                pre.setString(++i, name);
            }
            rs = pre.executeQuery();
            if (rs.next()) {
                total = rs.getInt("Total");
            }
        } finally {
            closeConnection();
        }
        return total;
    }
    
    public List<TourDTO> findTourStaff(int skip, int fetch, String tourID, String tourName, String dest, Timestamp fromDateTime, int duration, float priceMin, float priceMax) throws Exception {
        List<TourDTO> result = null;
        TourDTO dto;
        String id, name, des, trans, titleImage;
        float fareA, dur;
        String fDate, tDate;
        
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT ID, Name, Description, FromDate, ToDate, Transport, FareAdult, TitleImage, DATEDIFF(day, FromDate, ToDate) AS Duration"
                    + " FROM tblTour"
                    + " WHERE Status = 'Active' AND FromDate >= ?"
                    + " AND FareAdult >= ? AND FareAdult <= ?"
                    + " AND DATEDIFF(hour, FromDate, ToDate) <= ?"
                    + " AND ID IN (SELECT TourID AS ID FROM tblTourDetail WHERE PlaceID = ?)"
                    + " AND ID = ? AND Name = ?"
                    + " ORDER BY FromDate"
                    + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            int i = 0;
            
            if (priceMin < 0) {
                sql = sql.replace(" AND FareAdult >= ? AND FareAdult <= ?", "");
            } else {
                if (priceMax < 0)
                    sql = sql.replace(" AND FareAdult <= ?", "");
            }         
            if (duration <= 0) {
                sql = sql.replace(" AND DATEDIFF(hour, FromDate, ToDate) <= ?", "");
            } else if (duration > 7) {
                sql = sql.replace("DATEDIFF(hour, FromDate, ToDate) <= ?", "DATEDIFF(hour, FromDate, ToDate) > ?");
            }
            if (dest.equalsIgnoreCase("-1")) {
                sql = sql.replace(" AND ID IN (SELECT TourID AS ID FROM tblTourDetail WHERE PlaceID = ?)", "");
            }
            if (tourID == null) {
                sql = sql.replace(" AND ID = ?", "");
            }
            if (tourName == null) {
                sql = sql.replace(" AND Name = ?", "");
            }
            
            pre = conn.prepareStatement(sql);
            
            pre.setTimestamp(++i, fromDateTime);
            if (priceMin >= 0) {
                pre.setFloat(++i, priceMin);
                if (priceMax >= 0)
                    pre.setFloat(++i, priceMax);
            }
            if (duration > 0) {
                if (duration > 7)
                    pre.setInt(++i, 7);
                else
                    pre.setInt(++i, duration);
            }
            if (!dest.equalsIgnoreCase("-1")) {
                pre.setString(++i, dest);
            }
            if (tourID != null) {
                pre.setString(++i, tourID);
            }
            if (tourName != null) {
                pre.setString(++i, tourName);
            }
            pre.setInt(++i, skip);
            pre.setInt(++i, fetch);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                id = rs.getString("ID");
                name = rs.getString("Name");
                des = rs.getString("Description");
                fDate = rs.getTimestamp("FromDate").toLocalDateTime().format(DateTimeFormatter.ofPattern("dd/MMM/yyyy"));
                tDate = rs.getTimestamp("ToDate").toLocalDateTime().format(DateTimeFormatter.ofPattern("dd/MMM/yyyy"));
                trans = rs.getString("Transport");
                fareA = rs.getFloat("FareAdult");
                titleImage = rs.getString("TitleImage");
                dur = rs.getInt("Duration");
                dto = new TourDTO(id, name, des, trans, titleImage, fareA, dur, fDate, tDate);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
}
