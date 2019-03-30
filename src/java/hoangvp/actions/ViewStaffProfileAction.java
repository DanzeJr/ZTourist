/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.EmployeeDAO;
import hoangvp.dtos.EmployeeDTO;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Danze
 */
public class ViewStaffProfileAction extends ActionSupport implements SessionAware{
    
    private static Logger logger = LogManager.getLogger(ViewStaffProfileAction.class.getName());
    
    private String username, avatar, firstName, lastName, email, phone, address, gender, birthDate, startDate, job, language, role;
    private float salary;
    private boolean isYou;
    private Map<String, Object> session;
    
    public ViewStaffProfileAction() {
    }
    
    @Override
    public String execute() {
        try {
            if (username == null)
                return ERROR;
            username = username.toLowerCase();
            EmployeeDAO dao = new EmployeeDAO();
            EmployeeDTO dto = dao.getProfileByUsername(username);
            avatar = dto.getAvatar();
            firstName = dto.getFirstName();
            lastName = dto.getLastName();
            email = dto.getEmail();
            phone = dto.getPhone();
            address = dto.getAddress();
            gender = dto.getGender();
            birthDate = dto.getBirthDate().toLocalDate().format(DateTimeFormatter.ofPattern("dd/MMM/yyyy"));
            startDate = dto.getStartDate().toLocalDateTime().format(DateTimeFormatter.ofPattern("dd/MMM/yyyy"));
            job = dto.getJob();
            language = dto.getLanguage();
            role = dto.getRole();
            salary = dto.getSalary();
            String user = session.get("USER") + "";
            if (user.equals(username)) {
                isYou = true;
            } else {
                isYou = false;
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public boolean isIsYou() {
        return isYou;
    }

    public void setIsYou(boolean isYou) {
        this.isYou = isYou;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }
    
}
