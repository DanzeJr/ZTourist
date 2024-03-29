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
import org.apache.struts2.interceptor.RequestAware;

/**
 *
 * @author Danze
 */
public class InitStaffAction extends ActionSupport implements RequestAware{
    
    private static Logger logger = LogManager.getLogger(InitStaffAction.class.getName());
        
    private Map<String, Object> request;
    
    public InitStaffAction() {
    }
    
    @Override
    public String execute() {
        try {
            EmployeeDAO dao = new EmployeeDAO();
            Map<String, String> guide = dao.getGuideIdName();
            request.put("Guide", guide);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.request = map;
    }
    
}
