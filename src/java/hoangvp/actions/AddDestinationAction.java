/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.actions;

import com.opensymphony.xwork2.ActionSupport;
import hoangvp.daos.PlaceDAO;
import hoangvp.dtos.PlaceDTO;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author Danze
 */
public class AddDestinationAction extends ActionSupport implements ServletRequestAware{
    
    private static Logger logger = LogManager.getLogger(AddDestinationAction.class.getName());
    
    private String id, name, des, country, photo, photoFileName, titleImage;
    private HttpServletRequest servletRequest;
    
    public AddDestinationAction() {
    }
    
    @Override
    public String execute() {
        try {
            if (id == null || titleImage == null)
                return INPUT;
            PlaceDAO dao = new PlaceDAO();
            if (dao.isExistedID(id)) {
                addFieldError("id", "Destination ID is existed!");
                return INPUT;
            }
            if (photo == null && titleImage.isEmpty()) {
                titleImage = "images/places/default.jpg";
            } else if (photo != null) {
                String path = servletRequest.getRealPath("/").concat("images/places/" + id.toLowerCase());
                FileUtils.copyFile(new File(photo), new File(path, photoFileName), true);
                titleImage = "images/places/" + id.toLowerCase() + "/" + photoFileName;
            }
            PlaceDTO dto = new PlaceDTO(id, name, titleImage, des, country);
            if (!dao.insert(dto)) {
                addActionError("An error occurs when adding new destination! Please try later!");
                return INPUT;
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return SUCCESS;
    }   

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.servletRequest = hsr;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
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

    public String getTitleImage() {
        return titleImage;
    }

    public void setTitleImage(String titleImage) {
        this.titleImage = titleImage;
    }
        
}
