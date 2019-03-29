/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.CouponCodeDAO;
import hoangvp.daos.TourDAO;
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
public class UpdateCartAction extends ActionSupport implements SessionAware {

    private static Logger logger = LogManager.getLogger(UpdateCartAction.class.getName());

    private Map<String, Object> session;
    private String id, couponCode;
    private float total;
    private int ticketAdult, ticketKid, offPercent;
    private List<TourDTO> listTour;

    public UpdateCartAction() {
    }
    
    private void getCart(int leftSpot, HashMap<String, String> cart) throws Exception {
        TourDAO dao = new TourDAO();        
        listTour = new ArrayList<>();
        TourDTO dto;
        int tKid, tAdult, lSpot, t;
        total = 0;
        for (String x : cart.keySet()) {
            dto = dao.getTourCartByID(x);
            if (dto != null) { //de phong tour bi deactive
                dto.setId(x);
                tKid = Integer.parseInt(cart.get(x).split("-")[0]);
                tAdult = Integer.parseInt(cart.get(x).split("-")[1]);
                lSpot = dao.getMaxGuestByID(x) - dao.getTakenSpotByTourID(x);
                t = tKid + tAdult;
                if (t > leftSpot) {
                    addActionError("Tour " + id + " is not enough spots left!");
                }
                total += tKid * dto.getFareKid() + tAdult * dto.getFareAdult();
                dto.setTicketAdult(tAdult);
                dto.setTicketKid(tKid);
                listTour.add(dto);
            }
        }
        if (couponCode != null) {
            CouponCodeDAO cd = new CouponCodeDAO();
            offPercent = cd.getOffPercentByCode(couponCode);
        } else {
            offPercent = 0;
        }
    }

    @Override
    public String execute() {
        try {
            if (id == null) { //neu khong co id thi chuyen den trang 404 not found
                return ERROR;
            }
            boolean check = true;
            if (ticketAdult < 1) {
                check = false;
                addActionError("Adult tickets must be greater or equals to 1!");
            }
            if (ticketKid < 0) {
                check = false;
                addActionError("Kid tickets must be greater or equals to 0!");
            }
            
            HashMap<String, String> cart;
            if (session.get("CART") == null) { //neu cart chua duoc tao
                return ERROR;
            } else { //neu cart da tao
                cart = (HashMap<String, String>) session.get("CART");
                if (cart.isEmpty()) { //neu cart rong
                    return ERROR;
                } else if (cart.get(id) == null) { //neu id khong co trong gio hang
                    return ERROR;
                }
            }
            TourDAO dao = new TourDAO();
            int leftSpot = dao.getMaxGuestByID(id) - dao.getTakenSpotByTourID(id);
            if (check == false) { //neu ma so ve khong hop le
                getCart(leftSpot, cart);
                addActionError("Update tour " + id + " failed!");
                return SUCCESS;
            }
            if ((ticketAdult + ticketKid) > leftSpot) { //neu kiem tra lan nua va so ve dat nhieu hon so ve con lai
                getCart(leftSpot, cart);
                addActionError("Update " + id + " failed: only " + leftSpot + " spots left!");
                return SUCCESS;
            }
            cart.put(id, ticketKid + "-" + ticketAdult); //neu dat lai cung mot tour thi ghi de len lan truoc do
            //chay view cart o day de giu lai coupon code neu co
            getCart(leftSpot, cart);
            session.put("CART", cart); //dat cart vao trong session
        } catch (Exception e) {
            addActionError("Error occurs! Please update tour in cart later");
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

    public List<TourDTO> getListTour() {
        return listTour;
    }

    public void setListTour(List<TourDTO> listTour) {
        this.listTour = listTour;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

}
