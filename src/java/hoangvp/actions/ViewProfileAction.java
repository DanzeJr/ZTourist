/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.CustomerDAO;
import hoangvp.dtos.CustomerDTO;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Danze
 */
public class ViewProfileAction extends ActionSupport implements SessionAware{
    
    private static Logger logger = LogManager.getLogger(ViewProfileAction.class.getName());
    
    private Map<String, Object> session;
    private String avatar, firstName, lastName, email, phone, address, gender, birthDate, job;
    
    public ViewProfileAction() {
    }
    
    @Override
    public String execute() {
        try {
            String username = session.get("USER") + "";
            CustomerDAO dao = new CustomerDAO();
            CustomerDTO dto = dao.getProfileByUsername(username);
            avatar = dto.getAvatar();
            firstName = dto.getFirstName();
            lastName = dto.getLastName();
            email = dto.getEmail();
            phone = dto.getPhone();
            address = dto.getAddress();
            gender = dto.getGender();
            birthDate = dto.getBirthDate().toLocalDate().format(DateTimeFormatter.ofPattern("dd/MMM/yyyy")) + "";
            job = dto.getJob();
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }
    
}
