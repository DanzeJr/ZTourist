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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Danze
 */
public class AddToCartAction extends ActionSupport implements SessionAware{
    
    private static Logger logger = LogManager.getLogger(AddToCartAction.class.getName());
    
    private Map<String, Object> session;
    private String id, name, titleImage, fromDate, reg = "Sign In";
    private float fareAdult, fareKid, duration;
    private int  leftSpot, takenSpot, ticketAdult, ticketKid;
    private List<PlaceDTO> listPlace;
    
    public AddToCartAction() {
    }
    
    @Override
    public String execute() {
        try {
            if (session.get("ROLE") == null) { //neu chua dang nhap
                addActionError("Please login first!");
                return LOGIN;
            }
            if (id == null) { //neu khong co id thi chuyen den trang 404 not found
                return ERROR;
            }
            if (LocalDate.now().compareTo(LocalDate.parse(fromDate, DateTimeFormatter.ofPattern("dd/MMM/yyyy"))) >= 0) {
                return ERROR;
            }
            TourDAO dao = new TourDAO();
            takenSpot = dao.getTakenSpotByTourID(id);
            leftSpot = dao.getMaxGuestByID(id) - takenSpot;
            if ((ticketAdult + ticketKid) > leftSpot) { //neu kiem tra lan nua va so ve dat nhieu hon so ve con lai
                TourDTO dto = dao.getTourDetailsByID(id);
                name = dto.getName();
                titleImage = dto.getTitleImage();
                fromDate = dto.getFromDate();
                fareAdult = dto.getFareAdult();
                fareKid = dto.getFareKid();
                duration = dto.getDuration();
                listPlace = dao.findPlacesByTourID(id);
                addActionError("Not enough tickets left!");
                return INPUT;
            }
            HashMap<String, String> cart;
            if (session.get("CART") == null) { //neu cart chua duoc tao
                cart = new HashMap<>();
            } else { //neu cart da tao
                cart = (HashMap<String, String>) session.get("CART");
            }
            cart.put(id, ticketKid + "-" + ticketAdult); //neu dat lai cung mot tour thi ghi de len lan truoc do            
            session.put("CART", cart); //dat cart vao trong session
        } catch (Exception e) {
            addActionError("Error occurs! Please add to cart later");
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }   
    
    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getReg() {
        return reg;
    }

    public void setReg(String reg) {
        this.reg = reg;
    }
    
}
