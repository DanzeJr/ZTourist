/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.TourDAO;
import hoangvp.dtos.TourDTO;
import java.time.format.DateTimeFormatter;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author Danze
 */
public class ViewTourDetailsStaffAction extends ActionSupport {

    private static Logger logger = LogManager.getLogger(ViewTourDetailsStaffAction.class.getName());

    private String id, name, fromDate, toDate, transport, des, departure, destination1, destination2, destination3, guide1, guide2, guide3, guide4, titleImage, status;
    private float fareAdult, fareKid;
    private int minGuest, maxGuest;
    private boolean noBooking;

    public ViewTourDetailsStaffAction() {
    }

    @Override
    public String execute() {
        try {
            if (id == null) {
                return ERROR;
            }
            TourDAO dao = new TourDAO();
            TourDTO dto = dao.getTourDetailsByIDStaff(id);
            if (dto == null) {
                return ERROR;
            }
            noBooking = dao.hasNotBooking(id);
            name = dto.getName();
            des = dto.getDesc();
            titleImage = dto.getTitleImage();
            fromDate = dto.getFromDateTime().toLocalDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            toDate = dto.getToDateTime().toLocalDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            fareAdult = dto.getFareAdult();
            fareKid = dto.getFareKid();
            transport = dto.getTransport();
            minGuest = dto.getMinGuest();
            maxGuest = dto.getMaxGuest();
            status = dto.getStatus();
            List<String> listDest = dao.getAllTourPlaces(id);
            departure = listDest.get(0);
            destination1 = listDest.get(1);
            if (listDest.size() > 2) {
                destination2 = listDest.get(2);
                if (listDest.size() > 3) {
                    destination3 = listDest.get(3);
                }
            }
            List<String> listGuide = dao.getActiveTourGuides(id);
            guide1 = listGuide.get(0);
            if (listGuide.size() > 1) {
                guide2 = listGuide.get(1);
                if (listGuide.size() > 2) {
                    guide3 = listGuide.get(2);
                    if (listGuide.size() > 3) {
                        guide4 = listGuide.get(3);
                    }
                }
            }
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

    public String getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    public String getTransport() {
        return transport;
    }

    public void setTransport(String transport) {
        this.transport = transport;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getDestination1() {
        return destination1;
    }

    public void setDestination1(String destination1) {
        this.destination1 = destination1;
    }

    public String getDestination2() {
        return destination2;
    }

    public void setDestination2(String destination2) {
        this.destination2 = destination2;
    }

    public String getDestination3() {
        return destination3;
    }

    public void setDestination3(String destination3) {
        this.destination3 = destination3;
    }

    public String getGuide1() {
        return guide1;
    }

    public void setGuide1(String guide1) {
        this.guide1 = guide1;
    }

    public String getGuide2() {
        return guide2;
    }

    public void setGuide2(String guide2) {
        this.guide2 = guide2;
    }

    public String getGuide3() {
        return guide3;
    }

    public void setGuide3(String guide3) {
        this.guide3 = guide3;
    }

    public String getGuide4() {
        return guide4;
    }

    public void setGuide4(String guide4) {
        this.guide4 = guide4;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public boolean isNoBooking() {
        return noBooking;
    }

    public void setNoBooking(boolean noBooking) {
        this.noBooking = noBooking;
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

}
