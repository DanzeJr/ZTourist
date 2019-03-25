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
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Danze
 */
public class SignOutAction extends ActionSupport implements SessionAware, ServletResponseAware {

    private static Logger logger = LogManager.getLogger(SignOutAction.class.getName());

    private Map<String, Object> session;
    private HttpServletResponse response;

    public SignOutAction() {
    }

    @Override
    public String execute() {
        try {
            session.remove("ROLE");
            session.remove("USER");
            session.remove("AVA");
            response = ServletActionContext.getResponse();
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setDateHeader("Expires", 0); // Proxies.        
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
    public void setServletResponse(HttpServletResponse hsr) {
        this.response = hsr;
    }

}
