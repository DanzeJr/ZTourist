/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Danze
 */
public class SignOutStaffAction extends ActionSupport implements SessionAware {

    private static Logger logger = LogManager.getLogger(SignOutStaffAction.class.getName());

    private Map<String, Object> session;
    private HttpServletResponse response;

    public SignOutStaffAction() {
    }

    @Override
    public String execute() {
        try {
            session.remove("ROLE");
            session.remove("USER");
            session.remove("AVA");      
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

}
