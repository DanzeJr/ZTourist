/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.dtos;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Danze
 */
public class BookingDTO implements Serializable{
    private String id, tourID, guestID, request, pickUpPlace, promotionCode, status;
    private int room, ticketAdult, ticketKid;
    private Timestamp date;

    public BookingDTO(String id, String tourID, String guestID, String status, int room, int ticketAdult, int ticketKid, Timestamp date) {
        this.id = id;
        this.tourID = tourID;
        this.guestID = guestID;
        this.status = status;
        this.room = room;
        this.ticketAdult = ticketAdult;
        this.ticketKid = ticketKid;
        this.date = date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTourID() {
        return tourID;
    }

    public void setTourID(String tourID) {
        this.tourID = tourID;
    }

    public String getGuestID() {
        return guestID;
    }

    public void setGuestID(String guestID) {
        this.guestID = guestID;
    }

    public String getRequest() {
        return request;
    }

    public void setRequest(String request) {
        this.request = request;
    }

    public String getPickUpPlace() {
        return pickUpPlace;
    }

    public void setPickUpPlace(String pickUpPlace) {
        this.pickUpPlace = pickUpPlace;
    }

    public String getPromotionCode() {
        return promotionCode;
    }

    public void setPromotionCode(String promotionCode) {
        this.promotionCode = promotionCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
    }

    public int getTicketAdult() {
        return ticketAdult;
    }

    public void setTicketAdult(int ticketAdult) {
        this.ticketAdult = ticketAdult;
    }

    public int getTicketKid() {
        return ticketKid;
    }

    public void setTicketKid(int ticketKid) {
        this.ticketKid = ticketKid;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    
    
}
