/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.dtos;

import java.io.Serializable;

/**
 *
 * @author Danze
 */
public class PlaceDTO implements Serializable{
    private String id, name, titleImage, des, country, status;

    public PlaceDTO() {
    }

    public PlaceDTO(String id, String name, String titleImage, String des, String country) {
        this.id = id;
        this.name = name;
        this.titleImage = titleImage;
        this.des = des;
        this.country = country;
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

    public String getTitleImage() {
        return titleImage;
    }

    public void setTitleImage(String titleImage) {
        this.titleImage = titleImage;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
