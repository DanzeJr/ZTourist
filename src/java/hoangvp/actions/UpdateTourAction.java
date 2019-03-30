/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.TourDAO;
import hoangvp.dtos.TourDTO;
import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author Danze
 */
public class UpdateTourAction extends ActionSupport implements ServletRequestAware {

    private static Logger logger = LogManager.getLogger(UpdateTourAction.class.getName());

    private String id, name, fromDate, toDate, transport, des, departure, destination1, destination2, destination3, guide1, guide2, guide3, guide4, photo, photoFileName, titleImage, status;
    private float fareAdult, fareKid;
    private int minGuest, maxGuest;
    private boolean noBooking;
    private HttpServletRequest servletRequest;

    public UpdateTourAction() {
    }

    @Override
    public String execute() {
        try {
            if (id == null || titleImage == null) {
                return INPUT;
            }
            TourDAO dao = new TourDAO();
            boolean valid = true;
            if (noBooking) {
                if (destination1.equals(departure)) {
                    addActionError("Destination 1 is duplicated!\n");
                    valid = false;
                }
                if (!destination2.equals("-1") && (destination2.equals(departure) || destination2.equals(destination1))) {
                    addActionError("Destination 2 is duplicated!\n");
                    valid = false;
                }
                if (!destination3.equals("-1") && (destination3.equals(departure) || destination3.equals(destination1) || destination3.equals(destination2))) {
                    addActionError("Destination 3 is duplicated!\n");
                    valid = false;
                }
            }
            
            if (!guide2.equals("-1") && guide2.equals(guide1)) {
                addActionError("Guide 2 is duplicated!\n");
                valid = false;
            }
            if (!guide3.equals("-1") && (guide3.equals(guide1) || guide3.equals(guide2))) {
                addActionError("Guide 3 is duplicated!\n");
                valid = false;
            }
            if (!guide4.equals("-1") && (guide4.equals(guide1) || guide4.equals(guide2) || guide4.equals(guide3))) {
                addActionError("Guide 4 is duplicated!\n");
                valid = false;
            }
            
            if (valid == false) {
                return INPUT;
            }
            
            if (photo == null && titleImage.isEmpty()) {
                titleImage = "images/tours/default.jpg";
            } else if (photo != null) {
                String path = servletRequest.getRealPath("/").concat("images/tours/" + id.toLowerCase());
                FileUtils.copyFile(new File(photo), new File(path, photoFileName), true);
                titleImage = "images/tours/" + id.toLowerCase() + "/" + photoFileName;
            }
            TourDTO dto;
            if (noBooking) {
                dto = new TourDTO(name, des, transport, titleImage, fareAdult, fareKid, Timestamp.valueOf(fromDate), Timestamp.valueOf(toDate), minGuest, maxGuest);
                dto.setStatus(status);
            } else {
                dto = new TourDTO(name, des, transport, titleImage, -1, -1, null, null, -1, -1);
            }
            dto.setId(id);
            if (!dao.update(dto)) {
                addActionError("An error occurs when adding new tour! Please try later!");
                return INPUT;
            } else {
                boolean checkDest = true;
                if (noBooking) {
                    List<String> listDest = new ArrayList<>();
                    listDest.add(departure);
                    listDest.add(destination1);
                    if (!destination2.equals("-1")) {
                        listDest.add(destination2);
                    }
                    if (!destination3.equals("-1")) {
                        listDest.add(destination3);
                    }
                    if (!dao.deleteTourPlaces(id)) {
                        checkDest = false;
                    }
                    for (int i = 0; i < listDest.size(); i++) {
                        if (!dao.insertTourPlace(id, listDest.get(i), i)) {
                            checkDest = false;
                        }
                    }
                    if (checkDest == false) {
                        addActionError("An error occurs when updating tour destinations! Please try later!");
                    }
                }

                List<String> listGuide = new ArrayList<>();
                listGuide.add(guide1);
                if (!guide2.equals("-1")) {
                    listGuide.add(guide2);
                }
                if (!guide3.equals("-1")) {
                    listGuide.add(guide3);
                }
                if (!guide4.equals("-1")) {
                    listGuide.add(guide4);
                }
                boolean checkGuide = true;
                List<String> listOldGuide = dao.getAllTourGuides(id);
                for (String o : listOldGuide) {
                    for (int i = 0; i < listGuide.size(); i++) {
                        if (listGuide.get(i).equals(o)) {
                            listGuide.remove(o);
                            if (!dao.updateTourGuides(id, o)) {
                                checkGuide = false;
                            }
                        }
                    }
                }
                for (String g : listGuide) {
                    if (!dao.insertTourGuide(id, g)) {
                        checkGuide = false;
                    }
                }
                if (checkGuide == false) {
                    addActionError("An error occurs when updating tour guides! Please try later!");
                }
                if (checkDest == false || checkGuide == false) {
                    return INPUT;
                }
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.servletRequest = hsr;
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

    public String getTransport() {
        return transport;
    }

    public void setTransport(String transport) {
        this.transport = transport;
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

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPhotoFileName() {
        return photoFileName;
    }

    public void setPhotoFileName(String photoFileName) {
        this.photoFileName = photoFileName;
    }

    public String getTitleImage() {
        return titleImage;
    }

    public void setTitleImage(String titleImage) {
        this.titleImage = titleImage;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean isNoBooking() {
        return noBooking;
    }

    public void setNoBooking(boolean noBooking) {
        this.noBooking = noBooking;
    }

}
