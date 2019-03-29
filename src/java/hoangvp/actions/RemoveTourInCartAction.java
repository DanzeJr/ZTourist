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
public class RemoveTourInCartAction extends ActionSupport implements SessionAware {

    private static Logger logger = LogManager.getLogger(RemoveTourInCartAction.class.getName());

    private Map<String, Object> session;
    private String id;

    public RemoveTourInCartAction() {
    }

    @Override
    public String execute() {
        try {
            if (id == null) { //neu khong co id thi chuyen den trang 404 not found
                return ERROR;
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
            cart.remove(id);
            session.put("CART", cart); //dat cart vao trong session
        } catch (Exception e) {
            addActionError("Error occurs! Please remove tour in cart later");
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

}
