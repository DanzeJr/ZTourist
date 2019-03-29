/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.CouponCodeDAO;
import hoangvp.daos.CustomerDAO;
import hoangvp.daos.TourDAO;
import hoangvp.dtos.CustomerDTO;
import hoangvp.dtos.TourDTO;
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
public class CheckOutAction extends ActionSupport implements SessionAware {

    private static Logger logger = LogManager.getLogger(CheckOutAction.class.getName());

    private Map<String, Object> session;
    private String couponCode, bookingCode, firstName, lastName, email, phone, address, gender, birthDate;
    private float total;
    private int offPercent;
    private List<TourDTO> listTour;

    public CheckOutAction() {
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
            if (check == false) //neu khong du ve
                return INPUT;
            String username = session.get("USER") + "";
            bookingCode = username + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"));
            bookingCode = bookingCode.toUpperCase();
            CustomerDAO cd = new CustomerDAO();
            CustomerDTO cusDTO = cd.getProfileByUsername(username);
            firstName = cusDTO.getFirstName();
            lastName = cusDTO.getLastName();
            email = cusDTO.getEmail();
            phone = cusDTO.getPhone();
            address = cusDTO.getAddress();
            gender = cusDTO.getGender();
            birthDate = cusDTO.getBirthDate().toLocalDate().format(DateTimeFormatter.ofPattern("dd/MMM/yyyy")) + "";
        } catch (Exception e) {
            addActionError("Error occurs! Please check out cart later");
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

}
