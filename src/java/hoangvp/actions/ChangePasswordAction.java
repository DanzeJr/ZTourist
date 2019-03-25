/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.CustomerDAO;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Danze
 */
public class ChangePasswordAction extends ActionSupport implements SessionAware{
    
    private static Logger logger = LogManager.getLogger(ChangePasswordAction.class.getName());
    
    private Map<String, Object> session;
    private String oldPassword, newPassword;
    
    public ChangePasswordAction() {
    }
    
    @Override
    public String execute() {
        try {
            String username = session.get("USER") + "";
            CustomerDAO dao = new CustomerDAO();
            if (!dao.checkLogin(username, oldPassword).equals("customer")) {
                addActionError("Old password is incorrect! Please try again!");
                return INPUT;
            }
            if (!dao.updatePassword(username, newPassword)) {
                addActionError("An error occurs when change password! Please try later!");
            } else {
                addActionMessage("Password Changed!");
            }
        } catch (Exception e) {
            addActionError("An error occurs when change password! Please try later!");
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
    
}
