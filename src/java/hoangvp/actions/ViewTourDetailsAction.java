/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.TourDAO;
import hoangvp.dtos.PlaceDTO;
import hoangvp.dtos.TourDTO;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author Danze
 */
public class ViewTourDetailsAction extends ActionSupport{
    
    private static Logger logger = LogManager.getLogger(ViewTourDetailsAction.class.getName());
    
    private String id, name, titleImage, fromDate;
    private float fareAdult, fareKid, duration;
    private int  leftSpot, takenSpot;
    private boolean outDate;
    private List<PlaceDTO> listPlace;
    
    public ViewTourDetailsAction() {
    }
    
    @Override
    public String execute() {
        try {
            if (id == null) {
                return ERROR;
            }
            TourDAO dao = new TourDAO();
            TourDTO dto = dao.getTourDetailsByID(id);
            if (dto == null) {
                return ERROR;
            }
            name = dto.getName();
            titleImage = dto.getTitleImage();
            fromDate = dto.getFromDate();
            outDate = LocalDate.now().compareTo(LocalDate.parse(fromDate, DateTimeFormatter.ofPattern("dd/MMM/yyyy"))) >= 0;
            fareAdult = dto.getFareAdult();
            fareKid = dto.getFareKid();
            duration = dto.getDuration();
            takenSpot = dao.getTakenSpotByTourID(id);
            leftSpot = dto.getMaxGuest() - takenSpot;
            listPlace = dao.findPlacesByTourID(id);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
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

    public String getTitleImage() {
        return titleImage;
    }

    public void setTitleImage(String titleImage) {
        this.titleImage = titleImage;
    }

    public String getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    public boolean isOutDate() {
        return outDate;
    }

    public void setOutDate(boolean outDate) {
        this.outDate = outDate;
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

    public float getDuration() {
        return duration;
    }

    public void setDuration(float duration) {
        this.duration = duration;
    }

    public int getLeftSpot() {
        return leftSpot;
    }

    public void setLeftSpot(int leftSpot) {
        this.leftSpot = leftSpot;
    }

    public int getTakenSpot() {
        return takenSpot;
    }

    public void setTakenSpot(int takenSpot) {
        this.takenSpot = takenSpot;
    }

    public List<PlaceDTO> getListPlace() {
        return listPlace;
    }

    public void setListPlace(List<PlaceDTO> listPlace) {
        this.listPlace = listPlace;
    }
    
}
