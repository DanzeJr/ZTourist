/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.TourDAO;
import hoangvp.dtos.TourDTO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Danze
 */
public class InitCartAction extends ActionSupport implements SessionAware, RequestAware{
    
    private static Logger logger = LogManager.getLogger(InitCartAction.class.getName());
        
    private Map<String, Object> session, request;
    
    public InitCartAction() {
    }
    
    @Override
    public String execute() {
        try {
            HashMap<String, String> cart = (HashMap<String, String>) session.get("CART");
            TourDAO dao = new TourDAO();
            List<TourDTO> listTour = new ArrayList<>();
            TourDTO dto;
            int ticketAdult, ticketKid;
            float total = 0;
            for (String id : cart.keySet()) {
                dto = dao.getTourCartByID(id);
                dto.setId(id);
                ticketKid = Integer.parseInt(cart.get(id).split("-")[0]);
                ticketAdult = Integer.parseInt(cart.get(id).split("-")[1]);
                total += ticketKid * dto.getFareKid() + ticketAdult * dto.getFareAdult();
                dto.setTicketAdult(ticketAdult);
                dto.setTicketKid(ticketKid);
                listTour.add(dto);                
            }
            request.put("TourCart", listTour);
            request.put("TotalCart", total);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.request = map;
    }
    
}
