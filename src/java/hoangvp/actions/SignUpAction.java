/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.CustomerDAO;
import hoangvp.dtos.CustomerDTO;
import java.sql.Date;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author Danze
 */
public class SignUpAction extends ActionSupport {

    private static Logger logger = LogManager.getLogger(SearchTourAction.class.getName());

    private String username, email, password, gender, firstName, lastName, address, phone, birthDate, reg = "Sign Up";

    public SignUpAction() {
    }

    public String toPage() {
        try {
            CustomerDAO dao = new CustomerDAO();
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
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return INPUT;
    }

    public String register() {
        try {
            CustomerDAO dao = new CustomerDAO();
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
                String avatar = "images/avatars/ZAvatar.png";
                CustomerDTO dto = new CustomerDTO(email, firstName, lastName, gender, phone, address, Date.valueOf(birthDate));
                dto.setUsername(username);
                dto.setPassword(password);
                dto.setAvatar(avatar);
                if (!dao.insert(dto)) {
                    addActionError("An error occurs when sign up! Please try later!");
                    return INPUT;
                } else {
                    username = null;
                    email = null;
                    gender = null;
                    firstName = null;
                    lastName = null;
                    address = null;
                    phone = null;
                    birthDate = null;
                    reg = "Sign In";
                    addActionMessage("Register Successfully!");
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

    public String getReg() {
        return reg;
    }

    public void setReg(String reg) {
        this.reg = reg;
    }

}
