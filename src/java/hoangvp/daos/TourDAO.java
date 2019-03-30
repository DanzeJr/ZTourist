/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.daos;

import hoangvp.db.MyConnection;
import hoangvp.dtos.EmployeeDTO;
import hoangvp.dtos.PlaceDTO;
import hoangvp.dtos.TourDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
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
    
    public boolean isExistedID(String id) throws Exception {
        boolean check = false;
        
        try {
            String sql = "SELECT ID FROM tblTour WHERE ID = ?";
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
    
    public TourDTO getTourDetailsByID(String id) throws Exception {
        TourDTO dto = null;
        String name, titleImg, fromDate;
        float fareAdult, fareKid, duration;
        int maxGuest;
        
        try {
            String sql = "SELECT Name, TitleImage, FromDate, FareAdult, FareKid, MaxGuest, DATEDIFF(day, FromDate, ToDate) AS Duration FROM tblTour WHERE ID = ? AND Status = 'Active'";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            rs = pre.executeQuery();            
            if (rs.next()) {
                name = rs.getString("Name");
                titleImg = rs.getString("TitleImage");
                fromDate = rs.getTimestamp("FromDate").toLocalDateTime().format(DateTimeFormatter.ofPattern("dd/MMM/yyyy"));
                fareAdult = rs.getFloat("FareAdult");
                fareKid = rs.getFloat("FareKid");
                maxGuest = rs.getInt("MaxGuest");
                duration = rs.getInt("Duration");
                dto = new TourDTO();
                dto.setName(name);
                dto.setTitleImage(titleImg);
                dto.setFromDate(fromDate);
                dto.setFareAdult(fareAdult);
                dto.setFareKid(fareKid);
                dto.setMaxGuest(maxGuest);
                dto.setDuration(duration);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public TourDTO getTourDetailsByIDStaff(String id) throws Exception {
        TourDTO dto = null;
        String name, des, transport, titleImg, status;
        Timestamp fromDate, toDate;
        float fareAdult, fareKid;
        int minGuest, maxGuest;
        
        try {
            String sql = "SELECT Name, Description, FromDate, ToDate, FareAdult, FareKid, Transport, MinGuest, MaxGuest, TitleImage, Status FROM tblTour WHERE ID = ? AND Status = 'Active'";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            rs = pre.executeQuery();            
            if (rs.next()) {
                name = rs.getString("Name");
                des = rs.getString("Description");
                titleImg = rs.getString("TitleImage");
                fromDate = rs.getTimestamp("FromDate");
                toDate = rs.getTimestamp("ToDate");
                fareAdult = rs.getFloat("FareAdult");
                fareKid = rs.getFloat("FareKid");
                transport = rs.getString("Transport");
                minGuest = rs.getInt("MinGuest");
                maxGuest = rs.getInt("MaxGuest");
                status = rs.getString("Status");
                dto = new TourDTO(name, des, transport, titleImg, fareAdult, fareKid, fromDate, toDate, minGuest, maxGuest);
                dto.setStatus(status);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public TourDTO getTourCartByID(String id) throws Exception {
        TourDTO dto = null;
        String name, titleImg;
        float fareAdult, fareKid;
        
        try {
            String sql = "SELECT Name, TitleImage, FareAdult, FareKid FROM tblTour WHERE ID = ? AND Status = 'Active'";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            rs = pre.executeQuery();            
            if (rs.next()) {
                name = rs.getString("Name");
                titleImg = rs.getString("TitleImage");
                fareAdult = rs.getFloat("FareAdult");
                fareKid = rs.getFloat("FareKid");
                dto = new TourDTO();
                dto.setName(name);
                dto.setTitleImage(titleImg);
                dto.setFareAdult(fareAdult);
                dto.setFareKid(fareKid);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public int getMaxGuestByID(String id) throws Exception {
        int maxGuest = 0;
        
        try {
            String sql = "SELECT MaxGuest FROM tblTour WHERE ID = ?";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            rs = pre.executeQuery();            
            if (rs.next()) {
                maxGuest = rs.getInt("MaxGuest");
            }
        } finally {
            closeConnection();
        }
        return maxGuest;
    }
    
    public int getTakenSpotByTourID(String id) throws Exception {
        int takenSpot = 0;
        
        try {
            String sql = "SELECT SUM(TicketAdult + TicketKid) AS TakenSpot FROM tblBookingDetail WHERE TourID = ?";
            conn = MyConnection.getConnection();            
            pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            rs = pre.executeQuery();
            if (rs.next()) {
                takenSpot = rs.getInt("TakenSpot");
            }
        } finally {
            closeConnection();
        }
        return takenSpot;
    }
    
    public List<TourDTO> getTopNearestTours() throws Exception {
        List<TourDTO> result = null;
        TourDTO dto;
        String id, titleImg;
        
        try {
            String sql = "SELECT TOP 5 ID, TitleImage"
                    + " FROM tblTour WHERE Status = 'Active'"
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
                    + " FROM tblBookingDetail JOIN (SELECT ID, TitleImage, FareAdult, Status, DATEDIFF(day, FromDate, ToDate) AS Duration FROM tblTour) AS tbTour ON TourID = tbTour.ID"
                    + " WHERE tbTour.Status = 'Active'"
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
                dto = new PlaceDTO();
                dto.setId(placeID);
                dto.setName(name);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public String getLastDestinationByTourID(String id) throws Exception {
        String name = "";
        
        try {
            String sql = "SELECT TOP 1 Name FROM tblTourDetail JOIN tblPlace ON PlaceID = ID WHERE TourID = ? ORDER BY Number DESC";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            rs = pre.executeQuery();
            if (rs.next()) {
                name = rs.getString("Name");
            }
        } finally {
            closeConnection();
        }
        return name;
    }
    
    public List<EmployeeDTO> findGuidesByTourID(String id) throws Exception {
        List<EmployeeDTO> result = null;
        EmployeeDTO dto;
        String username, firstName, lastName;
        
        try {
            String sql = "SELECT EmployeeID, FirstName, LastName FROM tblTourGuide JOIN tblEmployee ON EmployeeID = Username WHERE TourID = ? AND Status = 'Active' ORDER BY AssignDate";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                username = rs.getString("EmployeeID");
                firstName = rs.getString("FirstName");
                lastName = rs.getString("LastName");
                dto = new EmployeeDTO();
                dto.setUsername(username);
                dto.setFirstName(firstName);
                dto.setLastName(lastName);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int getTotalTours() throws Exception {
        int total = 0;
        
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT COUNT(ID) AS Total"
                    + " FROM tblTour"
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
    
    public List<TourDTO> getAllTours(int skip, int fetch) throws Exception {
        List<TourDTO> result = null;
        TourDTO dto;
        String id, name, des, trans, titleImage;
        float fareA, dur;
        String fDate, tDate;
        
        try {
            conn = MyConnection.getConnection();
            String sql = "SELECT ID, Name, Description, FromDate, ToDate, Transport, FareAdult, TitleImage, DATEDIFF(day, FromDate, ToDate) AS Duration"
                    + " FROM tblTour"
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
                    + " WHERE FromDate >= ?"
                    + " AND FareAdult >= ? AND FareAdult <= ?"
                    + " AND DATEDIFF(hour, FromDate, ToDate) <= ?"
                    + " AND ID IN (SELECT TourID AS ID FROM tblTourDetail WHERE PlaceID = ?)"
                    + " AND ID = ? AND Name LIKE ?";
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
            if (id.isEmpty()) {
                sql = sql.replace(" AND ID = ?", "");
            }
            if (name.isEmpty()) {
                sql = sql.replace(" AND Name LIKE ?", "");
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
            if (!id.isEmpty()) {
                pre.setString(++i, id);
            }
            if (!name.isEmpty()) {
                pre.setString(++i, "%" + name + "%");
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
                    + " WHERE FromDate >= ?"
                    + " AND FareAdult >= ? AND FareAdult <= ?"
                    + " AND DATEDIFF(hour, FromDate, ToDate) <= ?"
                    + " AND ID IN (SELECT TourID AS ID FROM tblTourDetail WHERE PlaceID = ?)"
                    + " AND ID = ? AND Name LIKE ?"
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
            if (tourID.isEmpty()) {
                sql = sql.replace(" AND ID = ?", "");
            }
            if (tourName.isEmpty()) {
                sql = sql.replace(" AND Name LIKE ?", "");
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
            if (!tourID.isEmpty()) {
                pre.setString(++i, tourID);
            }
            if (!tourName.isEmpty()) {
                pre.setString(++i, "%" + tourName + "%");
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
    
    public boolean hasNotBooking(String tourID) throws Exception {
        boolean check = true;
        
        try {
            String sql = "SELECT TourID FROM tblBookingDetail WHERE TourID = ?";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, tourID);
            rs = pre.executeQuery();
            if (rs.next()) {
                check = false;
            }
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean insertTourPlace(String tourID, String placeID, int number) throws Exception {
        boolean check = false;
        
        try {
            String sql = "INSERT INTO tblTourDetail(TourID, PlaceID, Number)"
                    + " VALUES(?,?,?)";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, tourID);
            pre.setString(2, placeID);
            pre.setInt(3, number);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean deleteTourPlaces(String tourID) throws Exception {
        boolean check = false;
        
        try {
            String sql = "DELETE FROM tblTourDetail WHERE TourID = ?";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);            
            pre.setString(1, tourID);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean insertTourGuide(String tourID, String username) throws Exception {
        boolean check = false;
        
        try {
            String sql = "INSERT INTO tblTourGuide(TourID, EmployeeID, AssignDate, Status)"
                    + " VALUES(?,?,?,?)";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, tourID);
            pre.setString(2, username);
            pre.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            pre.setString(4, "Active");
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean deactivateTourGuides(String tourID) throws Exception {
        boolean check = false;
        
        try {
            String sql = "UPDATE tblTourGuide SET Status = 'Deactive' WHERE TourID = ?";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);            
            pre.setString(1, tourID);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean updateTourGuides(String tourID, String username) throws Exception {
        boolean check = false;
        
        try {
            String sql = "UPDATE tblTourGuide SET AssignDate = ?, Status = 'Active' WHERE TourID = ? AND EmployeeID = ?";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
            pre.setString(2, tourID);
            pre.setString(3, username);
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public List<String> getAllTourGuides(String tourID) throws Exception {
        List<String> result = null;
        String username;
        
        try {
            String sql = "SELECT EmployeeID FROM tblTourGuide WHERE TourID = ?";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, tourID);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                username = rs.getString("EmployeeID");
                result.add(username);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<String> getActiveTourGuides(String tourID) throws Exception {
        List<String> result = null;
        String username;
        
        try {
            String sql = "SELECT EmployeeID FROM tblTourGuide WHERE TourID = ? AND Status = 'Active'";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, tourID);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                username = rs.getString("EmployeeID");
                result.add(username);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<String> getAllTourPlaces(String tourID) throws Exception {
        List<String> result = null;
        String placeID;
        
        try {
            String sql = "SELECT PlaceID FROM tblTourDetail WHERE TourID = ? ORDER BY Number";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, tourID);
            rs = pre.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                placeID = rs.getString("PlaceID");
                result.add(placeID);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean insert(TourDTO dto) throws Exception {
        boolean check = false;
        
        try {
            String sql = "INSERT INTO tblTour(ID, Name, Description, FromDate, ToDate, FareAdult, FareKid, Transport, MinGuest, MaxGuest, TitleImage, Status)"
                    + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
            conn = MyConnection.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, dto.getId());
            pre.setString(2, dto.getName());
            pre.setString(3, dto.getDesc());
            pre.setTimestamp(4, dto.getFromDateTime());
            pre.setTimestamp(5, dto.getToDateTime());
            pre.setFloat(6, dto.getFareAdult());
            pre.setFloat(7, dto.getFareKid());
            pre.setString(8, dto.getTransport());
            pre.setInt(9, dto.getMinGuest());
            pre.setInt(10, dto.getMaxGuest());
            pre.setString(11, dto.getTitleImage());
            pre.setString(12, "Active");
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean update(TourDTO dto) throws Exception {
        boolean check = false;
        
        try {
            String sql = "UPDATE tblTour"
                    + " SET Name = ?, Description = ?, Transport = ?, TitleImage = ?, FromDate = ?, ToDate = ?, FareAdult = ?, FareKid = ?, MinGuest = ?, MaxGuest = ?, Status = ?"
                    + " WHERE ID = ?";
            conn = MyConnection.getConnection();
            if (dto.getFareAdult() < 0) {
                sql = sql.replace(", FromDate = ?, ToDate = ?, FareAdult = ?, FareKid = ?, MinGuest = ?, MaxGuest = ?, Status = ?", "");
            }
            pre = conn.prepareStatement(sql);
            int i = 0;
            pre.setString(++i, dto.getName());
            pre.setString(++i, dto.getDesc());            
            pre.setString(++i, dto.getTransport());
            pre.setString(++i, dto.getTitleImage());
            if (dto.getFareAdult() > 0) {
                pre.setTimestamp(++i, dto.getFromDateTime());
                pre.setTimestamp(++i, dto.getToDateTime());
                pre.setFloat(++i, dto.getFareAdult());
                pre.setFloat(++i, dto.getFareKid());                
                pre.setInt(++i, dto.getMinGuest());
                pre.setInt(++i, dto.getMaxGuest());
                pre.setString(++i, dto.getStatus());
            }
            pre.setString(++i, dto.getId());
            check = pre.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
}
