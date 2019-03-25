/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.CustomerDAO;
import hoangvp.dtos.CustomerDTO;
import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Danze
 */
public class UpdateProfileAction extends ActionSupport implements ServletRequestAware, SessionAware{
    
    private static Logger logger = LogManager.getLogger(UpdateProfileAction.class.getName());
    
    private HttpServletRequest servletRequest;
    private Map<String, Object> session;
    private String avatar, photo, photoFileName, firstName, lastName, email, phone, address, gender, birthDate, job;
    
    public UpdateProfileAction() {
    }
    
    @Override
    public String execute() {
        try {
            String username = session.get("USER") + "";
            if (photo != null) { //neu avatar khong bi thay doi
                String path = servletRequest.getRealPath("/").concat("images/avatars/" + username.toLowerCase());
                FileUtils.copyFile(new File(photo), new File(path, photoFileName), true);
                avatar = "images/avatars/" + username.toLowerCase() + "/" + photoFileName;
            }
            CustomerDAO dao = new CustomerDAO();
            CustomerDTO dto = new CustomerDTO(email, firstName, lastName, gender, phone, address, Date.valueOf(LocalDate.parse(birthDate, DateTimeFormatter.ofPattern("dd/MMM/yyyy"))));
            dto.setAvatar(avatar);
            dto.setJob(job);
            dto.setUsername(username);
            if (!dao.update(dto)) {
                addActionError("An error occurs when update profile! Please try later!");
            } else {
                if (photo != null) { //neu avatar duoc thay doi
                    session.put("AVA", avatar); //update AVA trong session
                } else {
                    avatar = session.get("AVA") + ""; //neu khong thi lay avatar tu AVA trong session
                }
                addActionMessage("Update Successfully!");
            }
        } catch (Exception e) {
            addActionError("An error occurs when update profile! Please try later!");
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

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.servletRequest = hsr;
    }
    
}
