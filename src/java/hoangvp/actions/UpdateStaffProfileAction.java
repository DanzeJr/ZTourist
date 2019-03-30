/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import static com.opensymphony.xwork2.Action.INPUT;
import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.EmployeeDAO;
import hoangvp.dtos.EmployeeDTO;
import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author Danze
 */
public class UpdateStaffProfileAction extends ActionSupport implements ServletRequestAware {

    private static Logger logger = LogManager.getLogger(UpdateStaffProfileAction.class.getName());

    private HttpServletRequest servletRequest;
    private String username, avatar, photo, photoFileName, firstName, lastName, email, phone, address, gender, birthDate, role, language, job, startDate;
    private float salary;

    public UpdateStaffProfileAction() {
    }

    @Override
    public String execute() {
        try {
            if (username == null || email == null) {
                return ERROR;
            }
            EmployeeDAO dao = new EmployeeDAO();
            if (photo != null) { //neu avatar duoc chon
                String path = servletRequest.getRealPath("/").concat("images/staffs/" + username.toLowerCase());
                FileUtils.copyFile(new File(photo), new File(path, photoFileName), true);
                avatar = "images/staffs/" + username.toLowerCase() + "/" + photoFileName;
            } else {
                avatar = dao.getAvatar(username);
            }            
            EmployeeDTO dto = new EmployeeDTO(firstName, lastName, gender, address, email, phone, Date.valueOf(LocalDate.parse(birthDate, DateTimeFormatter.ofPattern("dd/MMM/yyyy"))));
            dto.setUsername(username);
            dto.setAvatar(avatar);
            dto.setLanguage(language);
            dto.setJob(job);
            dto.setSalary(salary);
            dto.setRole(role);
            if (!dao.update(dto)) {
                addActionError("An error occurs when update staff profile! Please try later!");
                return INPUT;
            } else {
                addActionMessage("Update Successfully!");
            }
        } catch (Exception e) {
            addActionError("An error occurs when update staff profile! Please try later!");
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

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPhotoFileName() {
        return photoFileName;
    }

    public void setPhotoFileName(String photoFileName) {
        this.photoFileName = photoFileName;
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

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.servletRequest = hsr;
    }

}
