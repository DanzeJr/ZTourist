/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

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
public class AddStaffAction extends ActionSupport implements ServletRequestAware{

    private static Logger logger = LogManager.getLogger(AddStaffAction.class.getName());

    private String username, email, password, gender, firstName, lastName, address, phone, birthDate, role, photo, photoFileName, avatar;
    private HttpServletRequest servletRequest;

    public AddStaffAction() {
    }

    @Override
    public String execute() {
        try {
            if (username == null || email == null || avatar == null) {
                return INPUT;
            }
            EmployeeDAO dao = new EmployeeDAO();
            boolean check = false;
            if (dao.isExistedUsername(username)) {
                addFieldError("username", "Username is existed!");
                check = true;
            }
            if (dao.isExistedEmail(email)) {
                addFieldError("email", "Email is existed!");
                check = true;
            }
            if (check) {
                addActionError("Invalid Input!");
                return INPUT;
            } else {
                if (photo == null && avatar.isEmpty()) { //neu khong chon avatar
                    avatar = "images/staffs/ZAvatar.png";
                } else if (photo != null) { //neu co thi copy
                    String path = servletRequest.getRealPath("/").concat("images/staffs/" + username.toLowerCase());
                    FileUtils.copyFile(new File(photo), new File(path, photoFileName), true);
                    avatar = "images/staffs/" + username.toLowerCase() + "/" + photoFileName;
                }
                
                EmployeeDTO dto = new EmployeeDTO(firstName, lastName, gender, address, email, phone, Date.valueOf(LocalDate.parse(birthDate, DateTimeFormatter.ofPattern("dd/MMM/yyyy"))));
                dto.setUsername(username);
                dto.setPassword(password);
                dto.setAvatar(avatar);
                dto.setRole(role);
                if (!dao.insert(dto)) {
                    addActionError("An error occurs when add new staff! Please try later!");
                    return INPUT;
                }
            }
        } catch (Exception e) {
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.servletRequest = hsr;
    }

}
