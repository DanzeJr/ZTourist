/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.BookingDAO;
import hoangvp.daos.CouponCodeDAO;
import hoangvp.daos.CustomerDAO;
import hoangvp.daos.TourDAO;
import hoangvp.dtos.BookingDTO;
import hoangvp.dtos.CustomerDTO;
import hoangvp.dtos.TourDTO;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class ConfirmBookingAction extends ActionSupport implements SessionAware {

    private static Logger logger = LogManager.getLogger(ConfirmBookingAction.class.getName());

    private Map<String, Object> session;
    private String couponCode, comment, bookingCode, firstName, lastName, email, phone, address, date;
    private float total;
    private int offPercent, totalTickets;
    private List<TourDTO> listTour;

    public ConfirmBookingAction() {
    }

    @Override
    public String execute() {
        try {
            HashMap<String, String> cart;
            if (session.get("CART") == null) { //neu cart chua duoc tao
                return ERROR;
            } else { //neu cart da tao
                cart = (HashMap<String, String>) session.get("CART");
                if (cart.isEmpty()) { //neu cart rong
                    return ERROR;
                }
            }
            TourDAO dao = new TourDAO();
            TourDTO dto;
            int tAdult, tKid, leftSpot, t;
            total = 0;
            totalTickets = 0;
            boolean check = true;
            listTour = new ArrayList<>();
            for (String id : cart.keySet()) {
                dto = dao.getTourCartByID(id);
                if (dto != null) {
                    dto.setId(id);
                    tKid = Integer.parseInt(cart.get(id).split("-")[0]);
                    tAdult = Integer.parseInt(cart.get(id).split("-")[1]);
                    leftSpot = dao.getMaxGuestByID(id) - dao.getTakenSpotByTourID(id);
                    t = tKid + tAdult;
                    totalTickets += t;
                    if (t > leftSpot) {
                        check = false;
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
            if (check == false) { //neu khong du ve thi lai quay tro ve cart
                addActionError("Place order failed! Not enough tickets!");
                return INPUT;
            }
            BookingDAO bd = new BookingDAO();
            String username = session.get("USER") + "";
            BookingDTO bDTO = new BookingDTO();
            bDTO.setId(bookingCode);
            bDTO.setCustomerID(username);
            if (couponCode.isEmpty()) {
                couponCode = null;
            }
            bDTO.setCouponCode(couponCode);
            bDTO.setComment(comment);
            date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
            bDTO.setDate(Timestamp.valueOf(LocalDateTime.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"))));
            boolean checkInsert = true;
            if (bd.insert(bDTO)) {
                for (TourDTO x : listTour) {
                    if (!bd.insertDetails(bookingCode, x.getId(), x.getTicketAdult(), x.getTicketKid())) {
                        checkInsert = false;
                    }
                }
                if (checkInsert == false) { //neu insert details khong thanh cong
                    addActionError("Place order failed!");
                    return INPUT;
                }
            } else {
                addActionError("Booking failed");
                return INPUT;
            }
            CustomerDAO cd = new CustomerDAO();
            CustomerDTO cusDTO = cd.getProfileByUsername(username);
            firstName = cusDTO.getFirstName();
            lastName = cusDTO.getLastName();
            email = cusDTO.getEmail();
            phone = cusDTO.getPhone();
            address = cusDTO.getAddress();
            session.remove("CART");
        } catch (Exception e) {
            addActionError("Error occurs! Please book tour later");
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

    public String getBookingCode() {
        return bookingCode;
    }

    public void setBookingCode(String bookingCode) {
        this.bookingCode = bookingCode;
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

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getTotalTickets() {
        return totalTickets;
    }

    public void setTotalTickets(int totalTickets) {
        this.totalTickets = totalTickets;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
}
