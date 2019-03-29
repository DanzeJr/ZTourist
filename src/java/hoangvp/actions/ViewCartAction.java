/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.CouponCodeDAO;
import hoangvp.daos.TourDAO;
import hoangvp.dtos.PlaceDTO;
import hoangvp.dtos.TourDTO;
import java.util.ArrayList;
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
public class ViewCartAction extends ActionSupport implements SessionAware{
    
    private static Logger logger = LogManager.getLogger(ViewCartAction.class.getName());
    
    private Map<String, Object> session;
    private String couponCode;
    private int offPercent;
    private float total;
    private List<TourDTO> listTour;
    
    public ViewCartAction() {
    }
    
    @Override
    public String execute() {
        try {
            HashMap<String, String> cart = (HashMap<String, String>) session.get("CART");
            TourDAO dao = new TourDAO();
            listTour = new ArrayList<>();
            TourDTO dto;
            int ticketAdult, ticketKid, leftSpot, t;
            total = 0;
            for (String id : cart.keySet()) {
                dto = dao.getTourCartByID(id);
                if (dto != null) {
                    dto.setId(id);
                    ticketKid = Integer.parseInt(cart.get(id).split("-")[0]);
                    ticketAdult = Integer.parseInt(cart.get(id).split("-")[1]);
                    leftSpot = dao.getMaxGuestByID(id) - dao.getTakenSpotByTourID(id);
                    t = ticketKid + ticketAdult;
                    if (t > leftSpot) {
                        addActionError("Tour " + id + " is not enough spots left!");
                    }
                    total += ticketKid * dto.getFareKid() + ticketAdult * dto.getFareAdult();
                    dto.setTicketAdult(ticketAdult);
                    dto.setTicketKid(ticketKid);
                    listTour.add(dto);
                }
            }
            if (couponCode != null) {
                CouponCodeDAO cd = new CouponCodeDAO();
                offPercent = cd.getOffPercentByCode(couponCode);
            } else {
                offPercent = 0;
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public String getCouponCode() {
        return couponCode;
    }

    public void setCouponCode(String couponCode) {
        this.couponCode = couponCode;
    }

    public int getOffPercent() {
        return offPercent;
    }

    public void setOffPercent(int offPercent) {
        this.offPercent = offPercent;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public List<TourDTO> getListTour() {
        return listTour;
    }

    public void setListTour(List<TourDTO> listTour) {
        this.listTour = listTour;
    }
    
}
