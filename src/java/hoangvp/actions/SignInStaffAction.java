/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.EmployeeDAO;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Danze
 */
public class SignInStaffAction extends ActionSupport implements SessionAware{
    
    private static Logger logger = LogManager.getLogger(SignInStaffAction.class.getName());
    
    private String username, password;
    private Map<String, Object> session;
    
    public SignInStaffAction() {
    }
    
    @Override
    public String execute() {
        try {
            EmployeeDAO dao = new EmployeeDAO();
            String role = dao.checkLogin(username, password);
            if (role.equals("admin") || role.equals("guide")) {
                session.put("ROLE", role);
                session.put("USER", username);
                String avatar = dao.getAvatar(username);
                session.put("AVA", avatar);
            } else {
                if (role.equals("locked")) {
                    addActionError("Your account is deactived!");
                } else {
                    addActionError("Invalid username or password! Try again!");
                }
                return LOGIN;
            }
        } catch (Exception e) {
            addActionError("Error occurs! Please sign in later");
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }   
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }
        
}
