/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.dtos;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author Danze
 */
public class TourDTO implements Serializable{
    private String id, name, desc, transport, status, titleImage, fromDate, toDate;
    private float fareAdult, fareKid, duration;
    private Timestamp fromDateTime, toDateTime;
    private int minGuest, maxGuest, saleOff;
    private List<PlaceDTO> listPlace;

    public TourDTO() {
    }
    
    public TourDTO(String id, String name, String desc, String transport, String titleImage, float fareAdult, float duration, String fromDate, String toDate) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.transport = transport;
        this.titleImage = titleImage;
        this.fareAdult = fareAdult;
        this.duration = duration;
        this.fromDate = fromDate;
        this.toDate = toDate;
    }       

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    public String getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    public Timestamp getFromDateTime() {
        return fromDateTime;
    }

    public void setFromDateTime(Timestamp fromDateTime) {
        this.fromDateTime = fromDateTime;
    }

    public Timestamp getToDateTime() {
        return toDateTime;
    }

    public void setToDateTime(Timestamp toDateTime) {
        this.toDateTime = toDateTime;
    }

    public float getDuration() {
        return duration;
    }

    public void setDuration(float duration) {
        this.duration = duration;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTitleImage() {
        return titleImage;
    }

    public void setTitleImage(String titleImage) {
        this.titleImage = titleImage;
    }

    public float getFareAdult() {
        return fareAdult;
    }

    public void setFareAdult(float fareAdult) {
        this.fareAdult = fareAdult;
    }

    public float getFareKid() {
        return fareKid;
    }

    public void setFareKid(float fareKid) {
        this.fareKid = fareKid;
    }

    public String getTransport() {
        return transport;
    }

    public void setTransport(String transport) {
        this.transport = transport;
    }

    public int getMinGuest() {
        return minGuest;
    }

    public void setMinGuest(int minGuest) {
        this.minGuest = minGuest;
    }

    public int getMaxGuest() {
        return maxGuest;
    }

    public void setMaxGuest(int maxGuest) {
        this.maxGuest = maxGuest;
    }

    public int getSaleOff() {
        return saleOff;
    }

    public void setSaleOff(int saleOff) {
        this.saleOff = saleOff;
    }    

    public List<PlaceDTO> getListPlace() {
        return listPlace;
    }

    public void setListPlace(List<PlaceDTO> listPlace) {
        this.listPlace = listPlace;
    }
    
}
