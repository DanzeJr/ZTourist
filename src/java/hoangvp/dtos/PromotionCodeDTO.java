/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoangvp.dtos;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Danze
 */
public class PromotionCodeDTO implements Serializable{
    private String code;
    private int offPercent;
    private Timestamp startDate, endDate;

    public PromotionCodeDTO() {
    }

    public PromotionCodeDTO(String code, int offPercent, Timestamp startDate, Timestamp endDate) {
        this.code = code;
        this.offPercent = offPercent;
        this.startDate = startDate;
        this.endDate = endDate;
    }
    
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getOffPercent() {
        return offPercent;
    }

    public void setOffPercent(int offPercent) {
        this.offPercent = offPercent;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }
}
